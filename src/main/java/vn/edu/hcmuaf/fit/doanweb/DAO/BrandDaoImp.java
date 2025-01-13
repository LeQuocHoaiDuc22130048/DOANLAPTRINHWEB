package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.util.List;

public class BrandDaoImp {
    //    static Map<Integer, BrandsModel> brands = new HashMap<Integer, BrandsModel>();
    private final Jdbi jdbi;

    public BrandDaoImp() {
        this.jdbi = JDBIConnect.get();
    }

    public List<ProductImage> getALlBrands() {
        return jdbi.withHandle(h -> h.createQuery("select * from products_images where is_main = 1")
                .mapToBean(ProductImage.class).list());
    }

    public Brands getBrandById(int id) {
        return jdbi.withHandle(h -> h.createQuery("select * from brands where id = :id")
                .bind("id", id)
                .mapToBean(Brands.class).findOne().orElse(null));
    }
}
