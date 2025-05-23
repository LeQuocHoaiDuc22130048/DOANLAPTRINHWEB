package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

import javax.sound.midi.Patch;

@WebServlet(name = "AddProductController", value = "/admin/ProductAdd")
@MultipartConfig
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "/assets/images/Product";

    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("categories", adminService.getAllCategories());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/ProductAdd.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");

        try{
            //Lấy dữ liệu
            Integer idCategory = Integer.valueOf(request.getParameter("idCategory"));
            Integer idBrand = Integer.valueOf(request.getParameter("idBrand"));
            Integer idFrameShape = Integer.valueOf(request.getParameter("idFrame"));
            String productName = request.getParameter("productName");
            String material = request.getParameter("material");
            Integer gender = Integer.valueOf(request.getParameter("gender"));
            String color = request.getParameter("color");
            Float costPrice = Float.valueOf(request.getParameter("costPrice"));
            Float sellingPrice = Float.valueOf(request.getParameter("sellingPrice"));
            Integer quantity = Integer.valueOf(request.getParameter("quantity"));
            String description = request.getParameter("description");

            //Xử lý hình ảnh
            String savePath = getServletContext().getRealPath(SAVE_DIR);
            File imageDir = new File(savePath);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }


            Product product = new Product();
            product.setCategoryId(idCategory);
            product.setBrandId(idBrand);
            product.setShapeId(idFrameShape);
            product.setName(productName);
            product.setMaterial(material);
            product.setGender(gender);
            product.setColor(color);
            product.setCostPrice(costPrice);
            product.setSellingPrice(sellingPrice);
            product.setQuantity(quantity);
            product.setDescription(description);

            int productId = adminService.insertProduct(product);

            Part mainImage = request.getPart("mainImage");
            if(mainImage != null && mainImage.getSize() > 0){
                String mainImageName = UUID.randomUUID() + "_" + Paths.get(mainImage.getSubmittedFileName()).getFileName().toString();
                mainImage.write(savePath + File.separator + mainImageName);

                //Lưu xuống DB
                String mainPath = SAVE_DIR + "/" + mainImageName;
                adminService.insertProductImage(productId, mainPath, true);
            }

            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if(part.getName().equals("subImage") && part.getSize() > 0){
                    String subImageName = UUID.randomUUID() + "_" + Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    part.write(savePath + File.separator + subImageName);
                    String subPath = SAVE_DIR + "/" + subImageName;
                    adminService.insertProductImage(productId, subPath, false);
                }
            }

            response.setContentType("application/json");
            response.getWriter().write("{\"success\":true,\"message\":\"Thêm sản phẩm thành công!\"}");
        }catch (Exception e){
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\":false,\"message\":\"Thêm sản phẩm thất bại!\"}");
        }
    }
}