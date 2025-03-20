package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;

import java.util.List;

public class ProductService {


    ProductDao dao = new ProductDao();
    public List<ProductByCondition> getProduct (String type , String value) {
        return dao.getProductByCondition(type, value);
    }
}