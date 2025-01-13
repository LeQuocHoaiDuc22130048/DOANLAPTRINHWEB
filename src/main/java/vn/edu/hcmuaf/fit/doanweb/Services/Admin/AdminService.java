package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.BrandVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoryVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.Suggestion;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;

import java.util.ArrayList;
import java.util.List;

public class AdminService {
    static Admin admin = new Admin();

    public List<ProductVM> getAllProduct(){
        return admin.getAllProducts();
    }

    public List<CategoryVM> getAllCategory(){
        return admin.getAllCategories();
    }

    public List<BrandVM> getAllBrand(){
        return admin.getAllBrands();
    }
    public List<FrameShapes> getAllFrameShape(){
        return admin.getAllFrameShapes();
    }

    public List<Suggestion> getSuggestion(String type){
        return admin.getSuggestions(type);
    }

    public List<Suggestion> getGenderSuggestion(){
        List<Suggestion> genderSuggestion = new ArrayList<>();
        genderSuggestion.add(new Suggestion(1,"Nam"));
        genderSuggestion.add(new Suggestion(2,"Nữ"));
        genderSuggestion.add(new Suggestion(3,"Trẻ em"));
        genderSuggestion.add(new Suggestion(4,"Unisex"));
        return genderSuggestion;
    }

    public boolean addProduct(Product product){
        return admin.addProduct(product);
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
        List<FrameShapes> frameShapes = adminService.getAllFrameShape();
        for (FrameShapes frameShape : frameShapes) {
            System.out.println(frameShape);
        }
    }
}
