package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;

import java.util.List;

public interface AdminProductDao {
    List<ProductVM> getAllProducts();
    Product getProductById(int id);
    boolean addProduct(ProductAddVM product);
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);
    List<CategoryVM> getAllCategories();
    List<BrandVM> getAllBrands();
    List<FrameShapes> getAllFrameShapes();


}
