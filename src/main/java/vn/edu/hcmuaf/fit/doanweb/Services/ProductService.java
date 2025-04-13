package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;

import java.util.List;

public class ProductService {


    ProductDaoImp dao = new ProductDaoImp();
    public List<ProductByCondition> getProduct (String type , String value) {
        return dao.getProductByCondition(type, value);
    }
}