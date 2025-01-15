package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;

import java.util.List;

public class ProductService {

static ProductDaoImp dao = new ProductDaoImp();

    public Product getProductById(int id){
        return dao.getProductById(id);
    }

    public List<Product> getProductsByGender(int id){
        return dao.getProductsByGender(id);
    }

    public List<ProductImage> getProductImages(int id){
        return dao.getImagesByProductId(id); //ảnh phụ
    }
  

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
