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
    public boolean addProduct(ProductAddVM product) {
        String imageSql = "INSERT INTO products_images (product_id, name, path, is_main) VALUES (:product_id, :name, :path, :is_main)";
        String productSql = "INSERT INTO products (category_id, brand_id, shape_id, material, name, description, status, hot, cost_price, selling_price, quantity, gender,color, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        LocalDateTime currentTime = LocalDateTime.now();
        product.setCreatedAt(currentTime);
        product.setUpdatedAt(null);
        product.getImages().forEach(image -> {
            image.setCreatedAt(currentTime);
            image.setUpdatedAt(null);
        });

        return jdbi.inTransaction(handle -> {
            int productId = handle.createUpdate(productSql)
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
                    .bind(13, product.getCreatedAt())
                    .bind(14, product.getUpdatedAt())
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(int.class)
                    .one();

            PreparedBatch batch = handle.prepareBatch(imageSql);
            for (ProductImage image : product.getImages()) {
                batch.bind("product_id", productId)
                        .bind("is_main", image.getIsMain())
                        .bind("path", image.getPath())
                        .bind("created_at", image.getCreatedAt())
                        .bind("updated_at", image.getUpdatedAt())
                        .add();
            }
            batch.execute();
            return true;
        });
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
