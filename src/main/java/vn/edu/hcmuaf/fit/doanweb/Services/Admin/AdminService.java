package vn.edu.hcmuaf.fit.doanweb.Services.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.Admin;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;

import java.util.List;

public class AdminService {
    static Admin admin = new Admin();

    public List<ProductVM> getAllProduct(){
        return admin.getAllProducts();
    }

   public static void main(String[] args) {
       AdminService adminService = new AdminService();
       List<ProductVM> products = adminService.getAllProduct();
        for (ProductVM product : products) {
           System.out.println(product.toString());
        }
    }
}