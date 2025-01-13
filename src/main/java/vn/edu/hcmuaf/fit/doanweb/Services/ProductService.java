package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDao;

import java.util.List;

public class ProductService {


    ProductDao dao = new ProductDao();

    public List<ProductOfMaterial> getProductOfMaterial(String material){
        return dao.getProductOfMaterial(material);
    }

    public List<ProductOfGender> getProductOfGender(int gender){
        return dao.getProductOfGender(gender);
    }

    public List<ProductOfColor> getProductOfColor(String color){
        return dao.getProductOfColor(color);
    }

    public List<ProductOfShape> getProductOfShape(int  shape){
        return dao.getProductOfShape(shape);
    }

    public List<ProductOfBrand> getProductOfBrand(int brand){
        return dao.getProductOfBrand(brand);

    }

    public List<ProductOfCategory> getProductOfCategory(int category){
        return dao.getProductOfCategory(category);
    }


}
