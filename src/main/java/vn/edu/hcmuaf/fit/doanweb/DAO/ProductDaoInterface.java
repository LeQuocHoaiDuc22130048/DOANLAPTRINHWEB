package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;

import java.util.List;

public interface ProductDaoInterface {

    public ProductIndex getProductById(int id);

    List<ProductIndex> getProductsByGender(int gender);

    List<ProductImage> getImagesByProductId(int productId);

    public Discounts getActiveDiscounts();
}