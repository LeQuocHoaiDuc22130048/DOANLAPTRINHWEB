package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.BrandDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.util.List;

public class BrandServices {
    static BrandDaoImp brandDAO = new BrandDaoImp();

    public List<ProductImage> getAllBrands() {
        return brandDAO.getALlBrands();
    }

    public Brands getBrandsById(int id) {
        return brandDAO.getBrandById(id);
    }

    public static void main(String[] args) {
        BrandServices demo = new BrandServices();
       List<ProductImage> list= demo.getAllBrands();
       for (ProductImage brand : list) {
           System.out.println(brand.toString());
       }

        Brands brand = demo.getBrandsById(22);
        System.out.println(brand.toString());


    }
}
