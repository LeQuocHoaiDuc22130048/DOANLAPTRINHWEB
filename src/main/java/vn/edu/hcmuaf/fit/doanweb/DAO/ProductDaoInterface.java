package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;

import java.util.List;

public interface ProductDaoInterface {

    public ProductIndex getProductById(int id);

    public List<ProductIndex> getProductsByGender(int gender);

    public List<ProductImage> getImagesByProductId(int productId);

    public List<ProductIndex> getProductsByCategory(int categoryId);

    public Discounts getActiveDiscounts();
}