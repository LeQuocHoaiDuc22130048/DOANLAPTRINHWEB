package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "UpdateProduct", value = "/admin/UpdateProduct")
public class UpdateProductController extends HttpServlet {
    AdminService adminService = new AdminService();
    private static final String SAVE_DIR = "assets/images";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        Product product = adminService.getProductById(id);
        ProductImage productImage = adminService.getMainImage(id);

        request.setAttribute("product", product);
        request.setAttribute("image", productImage);
        request.setAttribute("categories", adminService.getAllCategory());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/UpdateProduct.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String costPrice = request.getParameter("costPrice");
        String sellingPrice = request.getParameter("sellingPrice");
        String quantity = request.getParameter("quantity");
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String frameShapeId = request.getParameter("shapeId");
        String gender = request.getParameter("gender");
        String material = request.getParameter("material");
        String description = StringEscapeUtils.unescapeHtml4(request.getParameter("description"));
        String color = request.getParameter("color");

        adminService.updateProduct(categoryId, brandId, frameShapeId, material, name, description, "1", "0", costPrice, sellingPrice, quantity, gender, color, id);

        ProductImage productImage = adminService.getMainImage(id);

        Part mainImagePart = request.getPart("mainImage");
        if (mainImagePart != null && mainImagePart.getSize() > 0) {
            String newMainImage = saveImage(mainImagePart);
            if (productImage != null) {
                productImage.setPath(newMainImage);
                productImage.setUpdatedAt(LocalDateTime.now());
            } else {
                productImage = new ProductImage();
                productImage.setPath(newMainImage);
                productImage.setUpdatedAt(LocalDateTime.now());
                productImage.setProductId(Integer.parseInt(id));
                productImage.setIsMain(1);
            }
            adminService.updateProductImage(productImage.getPath(), productImage.getIsMain(), productImage.getUpdatedAt().toString(), id, String.valueOf(productImage.getId()));
        }
        response.sendRedirect(request.getContextPath() + "/admin/AdminProductList");


    }

    private String saveImage(Part imagePart) throws IOException {
        String fileName = imagePart.getSubmittedFileName();
        String filePath = SAVE_DIR + "/" + System.currentTimeMillis() + "_" + fileName;
        String savePath = getServletContext().getRealPath("") + filePath;
        imagePart.write(savePath);
        return filePath;
    }
}