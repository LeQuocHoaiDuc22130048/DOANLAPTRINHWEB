package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.FrameShapes;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.time.LocalDateTime;
import java.util.List;

public class Admin {

    private final Jdbi jdbi;

    public Admin() {
        this.jdbi = JDBIConnect.get();
    }

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

    public Product getProductById(String id) {
        String sql = "SELECT id, category_id, brand_id, shape_id, material, name, description, status, hot, cost_price, selling_price, quantity, gender, color, created_at, updated_at FROM products WHERE id = ?";
        return jdbi.withHandle(handle -> handle
                .createQuery(sql)
                .bind(0, id)
                .mapToBean(Product.class)
                .findFirst().orElse(null));
    }

    public List<ProductImage> getImagesByProductId(String id) {
        String sql = "Select id,product_id, is_main, path from products_images where product_id = ?";
        return jdbi.withHandle(handle -> handle
                .createQuery(sql)
                .bind(0, id)
                .mapToBean(ProductImage.class)
                .list());
    }


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


    public boolean addProductImages(ProductImage productImage) {
        String imageSql = "INSERT INTO products_images (product_id, is_main, path) VALUES (?,?,?)";

        int rowAffected = jdbi.withHandle(handle ->
                handle.createUpdate(imageSql)
                        .bind(0, productImage.getProductId())
                        .bind(1, productImage.getIsMain())
                        .bind(2, productImage.getPath())
                        .execute());
        return rowAffected > 0;
    }

    public void updateProduct(String categoryId, String brandId, String shapeId, String material, String name, String description, String status, String hot, String cost_price, String selling_price, String quantity, String gender, String color, String id) {
        String updateProductSql = "UPDATE products SET category_id = ?, brand_id = ?, shape_id = ?, material = ?, name = ?, description = ?, status = ?, hot = ?, cost_price = ?, selling_price = ?, quantity = ?, gender = ?, color = ?, updated_at = ? WHERE id = ?";
        try {
            jdbi.withHandle(handle -> handle.createUpdate(updateProductSql)
                    .bind(0, categoryId)
                    .bind(1, brandId)
                    .bind(2, shapeId)
                    .bind(3, material)
                    .bind(4, name)
                    .bind(5, description)
                    .bind(6, status)
                    .bind(7, hot)
                    .bind(8, cost_price)
                    .bind(9, selling_price)
                    .bind(10, quantity)
                    .bind(11, gender)
                    .bind(12, color)
                    .bind(13, String.valueOf(LocalDateTime.now()))
                    .bind(14, id)
                    .execute());
        } catch (Exception e) {

        }

    }

    public ProductImage getMainImage(String id) {
        String sql = "Select * from products_images where product_id = ? AND is_main = 1";
        try {
            return jdbi.withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, id)
                            .mapToBean(ProductImage.class)
                            .one());
        } catch (Exception e) {
            return null;
        }
    }

    public void updateProductImage(String path, int isMain, String updatedAt, String productId, String imageId) {
        String updateProductImageSql = "UPDATE products_images SET path = ?, is_main = ?, updated_at = ? WHERE product_id = ? AND id = ?";
        try {
            jdbi.withHandle(handle ->
                    handle.createUpdate(updateProductImageSql)
                            .bind(0, path)
                            .bind(1, isMain)
                            .bind(2, updatedAt)
                            .bind(3, productId)
                            .bind(4, imageId)
                            .execute());
        } catch (Exception e) {

        }
    }

    public boolean deleteProduct(int id) {
        String deleteImageProductSql = "DELETE FROM products_images WHERE product_id = ?";
        int rowAffectedImg = jdbi.withHandle(handle -> handle.createUpdate(deleteImageProductSql)
                .bind(0, id)
                .execute());
        if (rowAffectedImg < 0) {
            return false;
        }
        String deleteProductSql = "DELETE FROM products WHERE id = ?";
        int rowAffectedProduct = jdbi.withHandle(handle -> handle.createUpdate(deleteProductSql)
                .bind(0, id)
                .execute());
        return rowAffectedProduct > 0;
    }

    public List<CategoryVM> getAllCategories() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from categories")
                .mapToBean(CategoryVM.class)
                .list());

    }

    public List<BrandVM> getAllBrands() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from brands")
                .mapToBean(BrandVM.class).list());
    }

    public List<FrameShapes> getAllFrameShapes() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from frame_shapes")
                .mapToBean(FrameShapes.class).list());
    }

}
