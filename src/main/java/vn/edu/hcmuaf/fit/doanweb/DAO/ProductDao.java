package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateQuery;
import java.util.List;

public class ProductDao {
    private Jdbi jdbi = JDBIConnect.get();
    public List<ProductByCondition> getProductByCondition(String type, String value) {
        List<ProductByCondition> list;
        list = jdbi.withHandle((handle -> handle.createQuery(GenerateQuery.GetProductBy(type))
                .bind("value",value)
                .mapToBean(ProductByCondition.class).list()));
        return list;
    }
}