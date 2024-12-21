package vn.edu.hcmuaf.fit.eyestyle.Services;

import vn.edu.hcmuaf.fit.eyestyle.DAO.BrandDAO;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.BrandsModel;

import java.util.List;

public class BrandServices {
    static BrandDAO brandDAO = new BrandDAO();
    public List<BrandsModel> getAllBrands() {return brandDAO.getALlBrands();}
}
