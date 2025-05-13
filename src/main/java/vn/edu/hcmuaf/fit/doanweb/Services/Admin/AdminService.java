package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;


import java.io.File;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AdminService {
    static Admin admin = new Admin();

    public List<ProductVM> getAllProduct() {
        return admin.getAllProducts();
    }

    public Product getProductById(String id) {
        return admin.getProductById(id);
    }

    public int insertProduct(Product product) {
        // Thêm sản phẩm và lấy ID
        int productId = admin.insertProduct(product);
        if (productId <= 0) {
            return 0;
        }
        return productId;
    }

    public void insertProductImage(int productId, String imagePath, boolean isMain){
        admin.insertProductImage(productId, imagePath, isMain);
    }

    public List<BrandVM> getAllBrand() {
        return admin.getAllBrands();
    }

    public List<FrameShapes> getAllFrameShape() {
        return admin.getAllFrameShapes();
    }



    public ProductImage getProductImageById(String id) {
        return admin.getImageById(id);
    }




    public boolean deleteProduct(int id) {
        return admin.deleteProduct(id);
    }

    public boolean updateProduct(Product product) {
        boolean productUpdated = admin.updateProduct(product);
        return productUpdated;
    }

    public List<OrdersVM> getAllOrders() {
        return admin.getAllOrders();
    }

    public List<OrderDetailVM> getAllOrderDetail(int orderId) {
        return admin.getAllOrderDetails(orderId);
    }



    public boolean deleteOrder(int orderId) {
        return admin.deleteOrder(orderId);
    }

    public List<Discounts> getAllDiscounts() {
        return admin.getDiscounts();
    }

    public boolean addDiscount(Discounts discount) {
        return admin.addDiscount(discount);
    }

    public List<CategoriesVM> getAllCategories() {
        return admin.getCategories();
    }

    public boolean addCategory(CategoriesVM categories) {
        return admin.addCategory(categories);
    }

    public boolean deleteCategory(int id) {
        return admin.deleteCategory(id);
    }

    public List<User> getAllUsers() {
        return admin.getAllUsers();
    }

    public List<FeedBacks> getAllFeedbacks() {
        return admin.getAllFeedbacks();
    }

    public List<DashboardVM> getProductHot() {
        return admin.getProductHot();
    }

    public static void main(String[] args) {
        AdminService adminService = new AdminService();
        System.out.println(File.separator);
    }


}
