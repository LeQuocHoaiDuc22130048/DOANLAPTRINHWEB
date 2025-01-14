package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.util.List;

public interface AdminProductDao {
    List<ProductVM> getAllProducts();
    Product getProductById(int id);
    int addProduct(Product product);
    boolean addProductImages(ProductImage productImage);
    boolean deleteProduct(int id);
    List<CategoryVM> getAllCategories();
    List<BrandVM> getAllBrands();
    List<FrameShapes> getAllFrameShapes();

    boolean updateProduct(Product product);
    boolean updateProductImage(List<ProductImage> productImage, int id);
}
