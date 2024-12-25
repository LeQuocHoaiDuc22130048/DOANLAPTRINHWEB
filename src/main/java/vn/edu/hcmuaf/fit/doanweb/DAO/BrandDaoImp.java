package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;

import java.util.List;

public class BrandDAO {
    //    static Map<Integer, BrandsModel> brands = new HashMap<Integer, BrandsModel>();
    private final Jdbi jdbi;

    public BrandDAO() {
        this.jdbi = JDBIConnect.get();
    }

    public List<Brands> getALlBrands() {
        return jdbi.withHandle(h -> h.createQuery("select * from brands")
                .mapToBean(Brands.class).list());
    }

    public Brands getBrandById(int id) {
        return jdbi.withHandle(h -> h.createQuery("select * from brands where id = :id")
                .bind("id", id)
                .mapToBean(Brands.class).findOne().orElse(null));
    }
}
