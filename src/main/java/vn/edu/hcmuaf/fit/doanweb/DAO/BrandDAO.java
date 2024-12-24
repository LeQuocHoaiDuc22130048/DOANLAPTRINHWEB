package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.BrandsModel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BrandDAO {
    //    static Map<Integer, BrandsModel> brands = new HashMap<Integer, BrandsModel>();
    private final Jdbi jdbi;

    public BrandDAO() {
        this.jdbi = JDBIConnect.get();
    }

    public List<BrandsModel> getALlBrands() {
        return jdbi.withHandle(h -> h.createQuery("select * from brands").mapToBean(BrandsModel.class).list());
    }

    public BrandsModel getBrandById(int id) {
        return jdbi.withHandle(h -> h.createQuery("select * from brands where id = :id").bind("id", id)
                .mapToBean(BrandsModel.class).findOne().orElse(null));

    }


}
