package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet(name = "AddProductController", value = "/admin/ProductAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "assets/images";

    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("categories", adminService.getAllCategory());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/ProductAdd.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy và xác thực các tham số
        String name = request.getParameter("name");
//        String description = request.getParameter("description");
        String description = StringEscapeUtils.unescapeHtml4(request.getParameter("description"));
        description = Jsoup.clean(description, Safelist.none());
        double costPrice = Double.parseDouble(request.getParameter("costPrice"));
        double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int shapeId = Integer.parseInt(request.getParameter("shapeId"));
        String material = request.getParameter("material");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String color = request.getParameter("color");

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setCostPrice(costPrice);
        product.setSellingPrice(sellingPrice);
        product.setQuantity(quantity);
        product.setCategoryId(categoryId);
        product.setBrandId(brandId);
        product.setShapeId(shapeId);
        product.setMaterial(material);
        product.setGender(gender);
        product.setColor(color);

        List<ProductImage> images = new ArrayList<>();
        images.add(saveImage(request.getPart("mainImage"), 1));
        images.add(saveImage(request.getPart("image1"), 0));
        images.add(saveImage(request.getPart("image2"), 0));
        images.add(saveImage(request.getPart("image3"), 0));

        int success = adminService.addProduct(product, images);
        if (success > 0) {
            response.sendRedirect("/admin/AdminProductList");
        } else {
            response.getWriter().write("Có lỗi khi thêm sản phẩm");
        }
    }

    private ProductImage saveImage(Part imagePart, int isMain) throws IOException {

        String fileName = imagePart.getSubmittedFileName();
        String filePath = "/assets/images/" + System.currentTimeMillis() + "_" + fileName;
        String savePath = getServletContext().getRealPath("") + filePath;

        imagePart.write(savePath);

        ProductImage productImage = new ProductImage();
        productImage.setPath(filePath);
        productImage.setIsMain(isMain);
        return productImage;
    }


}