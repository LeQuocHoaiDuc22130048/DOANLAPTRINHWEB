package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;

import java.util.List;

public interface AdminProductDao {
    List<ProductVM> getAllProducts();
    Product getProductById(int id);
    boolean addProduct(Product product);
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);

}
