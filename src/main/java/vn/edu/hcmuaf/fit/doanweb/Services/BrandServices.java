package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.BrandDAO;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.BrandsModel;

import java.util.List;

public class BrandServices {
    static BrandDAO brandDAO = new BrandDAO();

    public List<BrandsModel> getAllBrands() {
        return brandDAO.getALlBrands();
    }

    public BrandsModel getBrandsById(int id) {
        return brandDAO.getBrandById(id);
    }

    public static void main(String[] args) {
        BrandServices demo = new BrandServices();
       List<BrandsModel> list= demo.getAllBrands();
//       for (BrandsModel brand : list) {
//           System.out.println(brand.toString());
//       }

        BrandsModel brand = demo.getBrandsById(22);
//        System.out.println(brand.toString());


    }
}
