package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    static Admin admin = new Admin();

    public List<ProductVM> getAllProduct() {
        return admin.getAllProducts();
    }

    public List<CategoryVM> getAllCategory() {
        return admin.getAllCategories();
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

    public boolean updateProduct(Product product){
        boolean productUpdated = admin.updateProduct(product);
        return productUpdated;
    }

    public List<OrdersVM> getAllOrders() {
        return admin.getAllOrders();
    }

    public List<OrderDetailVM> getAllOrderDetail(int orderId) {
        return admin.getAllOrderDetails(orderId);
    }


    public static void main(String[] args) {
        AdminService adminService = new AdminService();

        for (OrderDetailVM orders : adminService.getAllOrderDetail(1)) {
            System.out.println(orders);
        }
//        String path = "new_image_path.jpg";
//        int isMain = 1;
//        String updatedAt = String.valueOf(LocalDateTime.now());
//        String productId = "180";
//        String imageId = "310";
//        adminService.updateProductImage(path, isMain, updatedAt, productId, imageId);
//        System.out.println("done");
//        List<ProductVM> products = adminService.getAllProduct();
//        for (ProductVM product : products) {
//            System.out.println(product.toString());
//        }

//        List<CategoryVM> allCategory = adminService.getAllCategory();
//        for (CategoryVM category : allCategory) {
//            System.out.println(category);
//        }
//        List<BrandVM> allBrand = adminService.getAllBrand();
//        for (BrandVM brand : allBrand) {
//            System.out.println(brand);
//        }
//        List<FrameShapes> frameShapes = adminService.getAllFrameShape();
//        for (FrameShapes frameShape : frameShapes) {
//            System.out.println(frameShape);
//        }


//        for (ProductImage image : admin.getImagesByProductId("1")){
//            System.out.println(image);
//        }

//        Product product = new Product();
//        product.setName("Sản phẩm mẫu");
//        product.setDescription("Mô tả sản phẩm mẫu");
//        product.setCostPrice(100000);
//        product.setSellingPrice(120000);
//        product.setQuantity(10);
//        product.setCategoryId(1);
//        product.setBrandId(1);
//        product.setShapeId(1);
//        product.setMaterial("Nhựa");
//        product.setGender(1);
//        product.setColor("Tím");
//
//        List<ProductImage> productImages = new ArrayList<>();
//        ProductImage productImage1 = new ProductImage();
//        productImage1.setPath("/assets/images/products/image1.jpg");
//
//        ProductImage productImage2 = new ProductImage();
//        productImage2.setPath("/assets/images/products/image2.jpg");
//
//        productImages.add(productImage1);
//        productImages.add(productImage2);
//
//        int result = adminService.addProduct(product, productImages);
//
//        if(result > 0) System.out.println("Them thanh cong voi id" + result);
//        else{
//            System.out.println("Thêm thất bại");
//        }

//        int id = 166;
//        System.out.println(adminService.deleteProduct(id));
    }

    public boolean deleteOrder(int orderId) {
        return admin.deleteOrder(orderId);
    }
}
