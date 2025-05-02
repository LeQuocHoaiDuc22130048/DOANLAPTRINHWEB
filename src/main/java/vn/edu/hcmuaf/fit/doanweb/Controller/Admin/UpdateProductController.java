package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.text.StringEscapeUtils;

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
        ProductImage productImage = adminService.getProductImageById(id);

        request.setAttribute("product", product);
        request.setAttribute("image", productImage);
//        request.setAttribute("categories", adminService.getAllCategory());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/UpdateProduct.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
//        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = StringEscapeUtils.unescapeHtml4(request.getParameter("description"));
        long costPrice = parseLongSafe(request.getParameter("costPrice"));
        long sellingPrice = parseLongSafe(request.getParameter("sellingPrice"));
        int quantity = parseIntSafe(request.getParameter("quantity"));
        int categoryId = parseIntSafe(request.getParameter("categoryId"));
        int brandId = parseIntSafe(request.getParameter("brandId"));
        int shapeId = parseIntSafe(request.getParameter("shapeId"));
        String material = request.getParameter("material");
        int gender = parseIntSafe(request.getParameter("gender"));
        String color = request.getParameter("color");
        int status = parseByteSafe(request.getParameter("status"));
        byte hot = parseByteSafe(request.getParameter("hot"));
        System.out.println("ID: " + id);
        System.out.println("Name: " + name);
        System.out.println("CostPrice: " + costPrice);

        Product product = new Product();
        product.setId(id);
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
        product.setStatus(status);
        product.setHot(hot);

        boolean success = adminService.updateProduct(product);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/AdminProductList");
        } else {
            request.setAttribute("error", "có lỗi khi thêm sản phẩm");
            request.getRequestDispatcher("/admin/UpdateProduct.jsp").forward(request, response);
        }


    }

    private int parseIntSafe(String value) {
        try {
            return value == null || value.isEmpty() ? 0 : Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private long parseLongSafe(String value) {
        try {
            return value == null || value.isEmpty() ? 0L : Long.parseLong(value);
        } catch (NumberFormatException e) {
            return 0L;
        }
    }

    private byte parseByteSafe(String value) {
        try {
            return value == null || value.isEmpty() ? 0 : Byte.parseByte(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

}