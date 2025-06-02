package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.time.LocalDateTime;
import java.util.List;


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
        int id = Integer.parseInt(request.getParameter("productId"));
        Product product = adminService.getProductById(id);
        String category = String.valueOf(product.getCategoryId());
        String brand = String.valueOf(product.getBrandId());
        String shape = String.valueOf(product.getShapeId());
        String name = String.valueOf(product.getName());
        String material = String.valueOf(product.getMaterial());
        int gender = product.getGender();
        String color = String.valueOf(product.getColor());
        float costPrice = product.getCostPrice();
        float sellingPrice = product.getSellingPrice();
        int quantity = product.getQuantity();
        String description = String.valueOf(product.getDescription());
        List<ProductImage> images = adminService.getAllProductImage(id);
        ProductImage mainImage = images.stream().filter(img -> img.getIsMain() == 1).findFirst().orElse(null);
        List<ProductImage> subImages = images.stream().filter(img -> img.getIsMain() == 0).toList();

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

}