package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Banner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/admin/add-banner")
@MultipartConfig
public class AddBanner extends HttpServlet {
    private final AdminService adminService = new AdminService();
    private static final String SAVE_DIR = "/assets/images/slider";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String linkUrl = request.getParameter("link_url");
        Part imagePart = request.getPart("image");
        // Lấy tên gốc của file (giữ nguyên tên ảnh)
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        //Xử lý hình ảnh
        String savePath = getServletContext().getRealPath(SAVE_DIR);
        System.out.println(savePath);
        File imageDir = new File(savePath);
        if (!imageDir.exists()) {
            imageDir.mkdirs();
        }

        imagePart.write(savePath + File.separator + fileName);

        //Lưu xuống database
        String imageUrl = SAVE_DIR +"/"+ fileName;
        boolean success = adminService.addBanner(title, linkUrl, imageUrl);
        response.setStatus(success ? 200 : 500);
    }
}


