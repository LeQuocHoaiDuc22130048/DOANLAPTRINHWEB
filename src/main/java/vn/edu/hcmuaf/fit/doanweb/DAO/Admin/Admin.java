package vn.edu.hcmuaf.fit.doanweb.DAO.Admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;

import java.time.LocalDateTime;
import java.util.List;

public class Admin {

    private final Jdbi jdbi;

    public Admin() {
        this.jdbi = JDBIConnect.get();
    }

    public List<ProductVM> getAllProducts() {
        String sql = "SELECT p.id, p.name, pimg.`path`,b.img as brandImg, p.selling_price, p.quantity\n" +
                "FROM products p\n" +
                "LEFT JOIN products_images pimg ON p.id = pimg.product_id\n" +
                "LEFT JOIN brands b ON p.brand_id = b.id\n" +
                "WHERE pimg.is_main = 1";
        return jdbi.withHandle(h -> h.createQuery(sql).map((rs, ctx) -> new ProductVM(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("path"),
                rs.getString("brandImg"),
                rs.getLong("selling_price"),
                rs.getInt("quantity")
        )).list());
    }

    public List<OrdersVM> getAllOrders() {
        String sql = """
                SELECT o.id,o.customer_name,o.phone_number,o.customer_email,o.shipping_address,
                o.payment_status,o.status_order, o.created_at
                FROM orders o
                """;

        return jdbi.withHandle(h -> h.createQuery(sql).map((rs, ctx) -> new OrdersVM(
                rs.getInt("id"),
                rs.getString("customer_name"),
                rs.getString("phone_number"),
                rs.getString("customer_email"),
                rs.getString("shipping_address"),
                rs.getByte("payment_status"),
                rs.getByte("status_order"),
                rs.getTimestamp("created_at").toLocalDateTime()
        )).list());
    }

    public List<OrderDetailVM> getAllOrderDetails(int orderId) {
        String sql = """
                SELECT p.id AS product_id, pi.path AS product_image, p.name AS product_code,\s
                     p.selling_price, od.quantity,\s
                     (p.selling_price * od.quantity) - o.total_discount AS total_price\s
                     FROM order_details od\s
                     JOIN orders o ON o.id = od.order_id\s
                     JOIN products p ON od.product_id = p.id\s
                     JOIN products_images pi ON p.id = pi.product_id\s
                     WHERE od.order_id = :orderId AND pi.is_main = 1
                """;

        return jdbi.withHandle(h -> h.createQuery(sql)
                .bind("orderId", orderId)
                .map((rs, ctx) -> new OrderDetailVM(

                        rs.getInt("product_id"),
                        rs.getString("product_image"),
                        rs.getString("product_code"),
                        rs.getLong("selling_price"),
                        rs.getInt("quantity"),
                        rs.getLong("total_price")
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

    public List<Discounts> getDiscounts() {
        String sql = "select id, code, description, discount_percentage, status from discounts";
        return jdbi.withHandle(handle -> handle.createQuery(sql).map((rs,ctx) -> new Discounts(
                    rs.getInt("id"),
                    rs.getString("code"),
                    rs.getString("description"),
                    rs.getDouble("discount_percentage"),
                    rs.getInt("status")
        )).list());
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

    public boolean addDiscount(Discounts discounts) {
        String sql = "INSERT INTO discounts (code, description, discount_percentage, status) VALUES (?,?,?,?)";

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, discounts.getCode())
                        .bind(1, discounts.getDescription())
                        .bind(2, discounts.getDiscountPercentage())
                        .bind(3, discounts.getStatus())
                        .execute()) > 0;
    }

    public boolean updateProduct(Product product) {
        String updateProductSql = "UPDATE products SET category_id = ?, brand_id = ?, shape_id = ?, material = ?, name = ?, description = ?, status = ?, hot = ?, cost_price = ?, selling_price = ?, quantity = ?, gender = ?, color = ?, updated_at = ? WHERE id = ?";
        int rowAffected = jdbi.withHandle(handle ->
                handle.createUpdate(updateProductSql)
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
                        .bind(13, LocalDateTime.now())
                        .bind(14, product.getId())
                        .execute()
        );

        return rowAffected > 0;
    }

    public ProductImage getImageById(String id) {
        String sql = "Select * from products_images where product_id = ? and is_main = 1";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, id)
                        .mapToBean(ProductImage.class)
                        .findFirst().orElse(null));
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

    public boolean deleteOrder(int orderId) {
        String deleteDetailsSql = "DELETE FROM order_details WHERE order_id = ?";
        String deleteOrderSql = "DELETE FROM orders WHERE id = ?";

        jdbi.useTransaction(handle -> {
            handle.createUpdate(deleteDetailsSql)
                    .bind(0, orderId)
                    .execute();

            handle.createUpdate(deleteOrderSql)
                    .bind(0, orderId)
                    .execute();
        });

        return true;
    }

    public List<CategoriesVM> getCategories() {
        String sql = """
                  SELECT c.id, c.`name`, c.img, COUNT(p.id) AS product_count,c.`status`, c.hot, c.created_at
                  FROM categories c
                  LEFT JOIN products p ON c.id = p.category_id
                  GROUP BY c.id
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> new CategoriesVM(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("img"),
                                rs.getInt("product_count"),
                                rs.getByte("status"),
                                rs.getByte("hot"),
                                rs.getTimestamp("created_at").toLocalDateTime()
                        )).list());
    }

    public List<BrandVM> getAllBrands() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from brands")
                .mapToBean(BrandVM.class).list());
    }

    public List<FrameShapes> getAllFrameShapes() {
        return jdbi.withHandle(handle -> handle.createQuery("select id, name from frame_shapes")
                .mapToBean(FrameShapes.class).list());
    }


    public boolean addCategory(CategoriesVM categories) {
        String sql = "INSERT INTO categories (name, status) VALUES (?, ?)";

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, categories.getName())
                        .bind(1, categories.getStatus())
                        .execute() > 0);
    }

    public boolean deleteCategory(int categoryId) {
        String sql = "DELETE FROM categories WHERE id = ?";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, categoryId)
                        .execute() > 0);
    }

    public List<User> getAllUsers() {
        String sql = "select * from users";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(User.class)
                        .list());
    }

    public List<FeedBacks> getAllFeedbacks() {
        String sql = "select * from feedbacks";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(FeedBacks.class)
                        .list());
    }

    public List<DashboardVM> getProductHot() {
        String sql = "SELECT   \n" +
                "    p.id AS product_id,  \n" +
                "    p.name AS product_name,  \n" +
                "    b.name AS brand_name,  \n" +
                "    i.`path` AS img,\n" +
                "    SUM(od.quantity) AS total_sold  \n" +
                "FROM   \n" +
                "    order_details od  \n" +
                "JOIN   \n" +
                "    products p ON od.product_id = p.id  \n" +
                "JOIN   \n" +
                "    brands b ON p.brand_id = b.id  \n" +
                "JOIN \n" +
                "\tproducts_images i ON p.id = i.product_id\n" +
                "WHERE i.is_main = 1\n" +
                "GROUP BY   \n" +
                "    p.id, p.name, b.name  \n" +
                "ORDER BY   \n" +
                "    total_sold DESC  \n" +
                "LIMIT 5";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> new DashboardVM(
                                rs.getInt("product_id"),
                                rs.getString("product_name"),
                                rs.getString("brand_name"),
                                rs.getString("img"),
                                rs.getInt("total_sold"))).list());

    }

    public boolean replyFeedback(int id, String replyContent) {
        String sql = "UPDATE feedbacks SET response = ?, updated_at = NOW(), status = 1 WHERE id = ?";
        int rowsAffected = jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, replyContent)
                        .bind(1, id)
                        .execute()
        );
        return rowsAffected > 0;
    }

    public List<NewsletterSubscriber> getAllNewsletterSubscribers() {
        String sql = "SELECT * FROM newsletter_subscribers ORDER BY created_at DESC";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(NewsletterSubscriber.class)
                        .list());
    }


}
