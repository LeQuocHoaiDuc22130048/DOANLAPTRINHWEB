package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Brand;

import java.io.*;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "BrandAddController", value = "/admin/AddBrand")
public class AddBrandController extends HttpServlet {
    private AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/admin/AddBrand.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");

        try {
            // Lấy thông tin từ form
            String name = request.getParameter("brandName");
            String title = request.getParameter("titleBrand");
            String description = request.getParameter("descriptionBrand");


            Part imagePart = request.getPart("imageBrand");
            String imagePath = processUploadedFile(imagePart, request, "banner_brand/images");


            Part iconPart = request.getPart("iconBrand");
            String iconPath = processUploadedFile(iconPart, request, "icon_brand/icons");


            // Tạo đối tượng Brand
            Brands brand = new Brands();
            brand.setName(name);
            brand.setTitle(title);
            brand.setDescription(description);
            brand.setImg(imagePath);
            brand.setIcon(iconPath);
            brand.setCreated_at(LocalDateTime.now());
            brand.setUpdated_at(LocalDateTime.now());
            // Thêm vào database
            adminService.addBrand(brand);

            response.setContentType("application/json");
            response.getWriter().write("{\"success\":true,\"message\":\"Thêm thương hiệu thành công!\"}");
        }catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\":false,\"message\":\"Thêm thương hiệu thất bại!\"}");
        }
    }

    private String processUploadedFile(Part part, HttpServletRequest request, String subFolder) throws IOException {
        if (part == null || part.getSize() == 0 || part.getSubmittedFileName() == null) {
            return null;
        }

        // Tạo thư mục nếu chưa tồn tại
        String uploadDir = getServletContext().getRealPath("") + "/assets/" + subFolder;
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // Tạo tên file duy nhất
        String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

        // Lưu file
        String filePath = uploadDir + File.separator + uniqueFileName;
        part.write(filePath);

        // Trả về đường dẫn tương đối (không bao gồm realPath)
        return "assets/" + subFolder + "/" + uniqueFileName;
    }
}