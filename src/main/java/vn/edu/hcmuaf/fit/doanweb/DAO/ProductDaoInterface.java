package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;

import java.util.List;

public interface ProductDaoInterface {

    public ProductIndex getProductById(int id);

    List<ProductByCondition> getProductByCondition(String type, String value);

    public List<ProductIndex> getProductsByGender(int gender);

    public List<ProductImage> getImagesByProductId(int productId);

    public List<ProductIndex> getProductsByCategory(int categoryId);

    public Discounts getActiveDiscounts();

    public Categories getCategoryById(int categoryId) ;

    public Brands getBrandById(int id);

    public List<ProductIndex> getProductsByBrandId(int brandId);

    public List<Brands> getBrandList();

    public List<Brands> getTop18Brands();

    public FrameShapes getFrameShapeById(int shapeId);
}