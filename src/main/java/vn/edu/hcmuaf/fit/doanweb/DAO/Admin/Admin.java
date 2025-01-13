package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.PreparedBatch;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public class Admin implements AdminProductDao {

    private final Jdbi jdbi;

    public Admin() {
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
    public int addProduct(Product product) {
        String productSql = "INSERT INTO products (category_id, brand_id, shape_id, material, name, description, status, hot, cost_price, selling_price, quantity, gender,color, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        LocalDateTime currentTime = LocalDateTime.now();
        product.setCreateAt(currentTime);
        product.setUpdateAt(null);

        int productId = jdbi.withHandle(handle ->
                handle.createUpdate(productSql)
                        .bind(0, product.getCategoryId())
                        .bind(1, product.getBrandId())
                        .bind(2, product.getShapeId())
                        .bind(3, product.getMaterial())
                        .bind(4, product.getName())
                        .bind(5, product.getDescription())
                        .bind(6, product.getStatus())
                        .bind(7, product.getHot())
                        .bind(8, product.getCostPrice())
                        .bind(9, product.getSellingPrice())
                        .bind(10, product.getQuantity())
                        .bind(11, product.getGender())
                        .bind(12, product.getColor())
                        .bind(13, product.getCreateAt())
                        .bind(14, product.getUpdateAt())
                        .executeAndReturnGeneratedKeys("id")  // Lấy ID đã được tạo
                        .mapTo(Integer.class)
                        .one());

        product.setId(productId);
        return productId;
    }


    @Override
    public boolean addProductImages(ProductImage productImage) {
        String imageSql = "INSERT INTO products_images (product_id, is_main, path) VALUES (?,?,?)";

        int rowAffected = jdbi.withHandle(handle ->
                handle.createUpdate(imageSql)
                        .bind(0,productImage.getProductId())
                        .bind(1,productImage.getIsMain())
                        .bind(2,productImage.getPath())
                        .execute());
        return rowAffected > 0;
    }
    @Override
    public boolean updateProduct(Product product) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }

    @Override
    public List<CategoryVM> getAllCategories() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from categories")
                .mapToBean(CategoryVM.class)
                .list());

    }

    @Override
    public List<BrandVM> getAllBrands() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from brands")
                .mapToBean(BrandVM.class).list());
    }

    @Override
    public List<FrameShapes> getAllFrameShapes() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from frame_shapes")
                .mapToBean(FrameShapes.class).list());
    }

}
