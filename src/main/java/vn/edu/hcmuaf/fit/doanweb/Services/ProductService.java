package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDao;

import java.util.List;

public class ProductService {


    ProductDao dao = new ProductDao();

    public List<ProductByMaterial> getProductByMaterial(String material){
        return dao.getProductByMaterial(material);
    }

    public List<ProductByGender> getProductByGender(int gender){
        return dao.getProductByGender(gender);
    }

    public List<ProductByColor> getProductByColor(String color){
        return dao.getProductByColor(color);
    }

    public List<ProductByShape> getProductByShape(int  shape){
        return dao.getProductByShape(shape);
    }

    public List<ProductByBrand> getProductByBrand(int brand){
        return dao.getProductByBrand(brand);

    }

    public List<ProductByCategory> getProductByCategory(int category){
        return dao.getProductByCategory(category);
    }

    public List<ProductByPriceRange> getProductByprice(long minPrice, long maxPrice){
        return dao.getProductByPrice(minPrice, maxPrice);
    }


}
