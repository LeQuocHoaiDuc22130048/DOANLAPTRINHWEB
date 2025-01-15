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
}
