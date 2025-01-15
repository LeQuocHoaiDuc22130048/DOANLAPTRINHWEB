package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;

import java.util.List;

public class Admin implements  AdminProductDao{

    private final Jdbi jdbi;

    public Admin(){
        this.jdbi = JDBIConnect.get();
    }

    @Override
    public List<ProductVM> getAllProducts() {
        String sql = "SELECT p.id, p.name,pi.path,p.selling_price ,p.quantity " +
                "From products p " +
                "LEFT JOIN products_images pi ON p.id = pi.product_id " +
                "WHERE pi.is_main = 1";


        return jdbi.withHandle(h -> h.createQuery(sql).map((rs, ctx) -> new ProductVM(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("path"),
                rs.getLong("selling_price"),
                rs.getInt("quantity")

        )).list());
    }

    @Override
    public Product getProductById(int id) {
        return null;
    }

    @Override
    public boolean addProduct(Product product) {
        return false;
    }

    @Override
    public boolean updateProduct(Product product) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }
}
