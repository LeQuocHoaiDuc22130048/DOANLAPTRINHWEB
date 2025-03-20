package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;

import java.util.List;

public interface ProductDaoInterface {

    public ProductIndex getProductById(int id);

    List<ProductIndex> getProductsByGender(int gender);

    List<ProductImage> getImagesByProductId(int productId);

    public Discounts getActiveDiscounts();
}