package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;

public class ProductDao {

    private Jdbi jdbi = JDBIConnect.get();

    public ProductDao(){

    }


}