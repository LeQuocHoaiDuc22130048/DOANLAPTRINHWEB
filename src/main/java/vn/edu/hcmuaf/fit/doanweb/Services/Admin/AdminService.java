package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    static Admin admin = new Admin();

    public List<ProductVM> getAllProduct() {
        return admin.getAllProducts();
    }


    public List<BrandVM> getAllBrand() {
        return admin.getAllBrands();
    }

    public List<FrameShapes> getAllFrameShape() {
        return admin.getAllFrameShapes();
    }

    public Product getProductById(String id) {
        return admin.getProductById(id);
    }

    public ProductImage getProductImageById(String id) {
        return admin.getImageById(id);
    }

    public int addProduct(Product product, List<ProductImage> productImages) {
        // Thêm sản phẩm và lấy ID
        int productId = admin.addProduct(product);
        if (productId <= 0) {
            return 0;
        }
        // Gán ID cho từng hình ảnh và thêm hình ảnh vào CSDL
        for (ProductImage productImage : productImages) {
            productImage.setProductId(productId);
            boolean imageAdded = admin.addProductImages(productImage);
            if (!imageAdded) {
                return 0;
            }
        }
        return productId;
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

    public boolean replyFeedback(int id, String replyContent) {
        return admin.replyFeedback(id,replyContent);
    }

    public static void main(String[] args) {
        AdminService adminService = new AdminService();
        System.out.println(adminService.getAllOrderDetail(6));
    }


}
