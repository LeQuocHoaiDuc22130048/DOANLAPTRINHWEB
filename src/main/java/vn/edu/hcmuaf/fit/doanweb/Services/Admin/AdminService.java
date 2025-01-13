package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
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


    public List<Suggestion> getGenderSuggestion() {
        List<Suggestion> genderSuggestion = new ArrayList<>();
        genderSuggestion.add(new Suggestion(1, "Nam"));
        genderSuggestion.add(new Suggestion(2, "Nữ"));
        genderSuggestion.add(new Suggestion(3, "Trẻ em"));
        genderSuggestion.add(new Suggestion(4, "Unisex"));
        return genderSuggestion;
    }

    public boolean addProduct(ProductAddVM product) {
        boolean isProductAdded = admin.addProduct(product);
        if (isProductAdded) {
            int productId = admin.getLastProductId();
            product.setId(productId);
        }
        return isProductAdded;
    }

    public void updateImages(ProductAddVM productAddVM){
        admin.updateProductImages(productAddVM);
    }

    public static void main(String[] args) {
        AdminService adminService = new AdminService();
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
        ProductAddVM product = new ProductAddVM();
        product.setName("Test Product");
        product.setDescription("Test Description");
        product.setCostPrice(100.00);
        product.setSellingPrice(150.00);
        product.setQuantity(10);
        product.setCategoryId(1);
        product.setBrandId(1);
        product.setShapeId(1);
        product.setMaterial("Test Material");
        product.setGender(1);
        product.setColor("Black");
        product.setStatus(1);
        product.setHot((byte) 0);
        product.setCreatedAt(LocalDateTime.now());
        product.setUpdatedAt(LocalDateTime.now());

        List<ProductImage> images = new ArrayList<>();
        for (int i = 1; i <= 4; i++) {
            ProductImage image = new ProductImage();
            String fileName = "image" + i + ".jpg"; // Tên gốc của ảnh
            String filePath = "assets/images/" + fileName;
            image.setPath(filePath);
            image.setIsMain(i == 1 ? 1 : 0);
            image.setCreatedAt(LocalDateTime.now());
            image.setUpdatedAt(LocalDateTime.now());
            images.add(image);
        }
        product.setImages(images);

        // Thêm sản phẩm và in kết quả
        boolean isProductAdded = adminService.addProduct(product);
        if (isProductAdded) {
            admin.updateProductImages(product);
            System.out.println("Thêm sản phẩm thành công với ID: " + product.getId());
            product.getImages().forEach(image -> {
                System.out.println("Đường dẫn ảnh: " + image.getPath());
            });
        } else {
            System.out.println("Thêm sản phẩm thất bại.");
        }
    }
}
