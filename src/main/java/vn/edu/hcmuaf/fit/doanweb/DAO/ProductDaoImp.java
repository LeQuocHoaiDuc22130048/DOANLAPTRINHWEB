package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductDaoImp implements ProductDaoInterface {
    public Jdbi jdbi = JDBIConnect.get();
    public ProductIndex getIndexFromRS (ResultSet rs) throws SQLException {
        ProductIndex p = new ProductIndex();
        p.setId(rs.getInt("id"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setBrandId(rs.getInt("brand_id"));
        p.setShapeId(rs.getInt("shape_id"));
        p.setMaterial(rs.getString("material"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setStatus(rs.getInt("status"));
        p.setHot(rs.getByte("hot"));
        p.setCostPrice((float) rs.getDouble("cost_price"));
        p.setSellingPrice((float) rs.getDouble("selling_price"));
        p.setQuantity(rs.getInt("quantity"));
        p.setGender(rs.getInt("gender"));
        p.setColor(rs.getString("color"));
        return p;
    }
    @Override
    public ProductIndex getProductById(int id) {
        ProductIndex product = jdbi.withHandle(handle ->
                handle.createQuery(
                                GenerateQuery.getAllQuery("products" , "id")
                        )
                        .bind("id", id)
                        .map((rs, ctx) -> getIndexFromRS(rs))
                        .one() // Lấy đối tượng Product
        );

        if (product != null) {
            // Lấy đường dẫn của hình ảnh chính (is_main = 1)
            String mainImage = jdbi.withHandle(handle ->
                    handle.createQuery(
                                    "SELECT path FROM products_images WHERE product_id = :id AND is_main = 1"
                            )
                            .bind("id", id)
                            .mapTo(String.class)
                            .one() // Lấy hình ảnh chính
            );
            product.setPath_image(mainImage); // Gán đường dẫn hình ảnh chính cho sản phẩm
        }

        return product;
    }
    @Override
    public List<ProductByCondition> getProductByCondition(String type, String value) {
        List<ProductByCondition> list;
        list = jdbi.withHandle((handle -> handle.createQuery(GenerateQuery.GetProductBy(type))
                .bind("value", value)
                .mapToBean(ProductByCondition.class).list()));
        return list;
    }
    @Override
    public List<ProductIndex> getProductsByGender(int gender) {
        // Truy vấn danh sách sản phẩm theo giới tính
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                        handle.createQuery(
                                        GenerateQuery.getAllQuery("products" , "gender")
                                )
                                .bind("gender", gender) // Gán giá trị giới tính vào câu truy vấn
                                .map((rs, ctx) -> getIndexFromRS(rs))
                                .list() // Lấy danh sách sản phẩm
        );

        // Lấy đường dẫn hình ảnh chính (is_main = 1) cho từng sản phẩm
        productList.forEach(product -> {
            String mainImage = jdbi.withHandle(handle ->
                    handle.createQuery(
                                    "SELECT path FROM products_images WHERE product_id = :id AND is_main = 1"
                            )
                            .bind("id", product.getId())
                            .mapTo(String.class)
                            .findOne() // Lấy hình ảnh chính
                            .orElse(null) // Nếu không có, trả về null
            );
            product.setPath_image(mainImage); // Gán hình ảnh chính cho sản phẩm
        });

        return productList; // Trả về danh sách sản phẩm
    }
    @Override
    public List<ProductImage> getImagesByProductId(int productId) {
        // Truy vấn danh sách hình ảnh phụ của sản phẩm (is_main = 0)
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products_images WHERE product_id = :productId AND is_main = 0"
                        )
                        .bind("productId", productId)
                        .map((rs, ctx) -> {
                            ProductImage image = new ProductImage();
                            image.setId(rs.getInt("id"));
                            image.setProductId(rs.getInt("product_id"));
                            image.setIsMain(rs.getInt("is_main"));
                            image.setPath(rs.getString("path"));
                            image.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            image.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
                            return image;
                        })
                        .list()
        );
    }
    @Override
    public List<ProductIndex> getProductsByCategory(int categoryId) {
        // Truy vấn danh sách sản phẩm theo category_id
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products WHERE category_id = :categoryId"
                        )
                        .bind("categoryId", categoryId) // Gán giá trị category_id vào câu truy vấn
                        .map((rs, ctx) -> getIndexFromRS(rs))
                        .list() // Lấy danh sách sản phẩm
        );

        // Lấy đường dẫn hình ảnh chính (is_main = 1) cho từng sản phẩm
        productList.forEach(product -> {
            String mainImage = jdbi.withHandle(handle ->
                    handle.createQuery(
                                    "SELECT path FROM products_images WHERE product_id = :id AND is_main = 1"
                            )
                            .bind("id", product.getId())
                            .mapTo(String.class)
                            .findOne() // Lấy hình ảnh chính
                            .orElse(null) // Nếu không có, trả về null
            );
            product.setPath_image(mainImage); // Gán hình ảnh chính cho sản phẩm
        });

        return productList; // Trả về danh sách sản phẩm
    }
    @Override
    // Phương thức lấy khuyến mãi có status = 1
    public Discounts getActiveDiscounts() {
        // Lấy một khuyến mãi duy nhất
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM discounts WHERE status = 1 LIMIT 1"
                        )
                        .map((rs, ctx) -> {
                            Discounts d = new Discounts();
                            d.setId(rs.getInt("id"));
                            d.setCode(rs.getString("code"));
                            d.setDescription(rs.getString("description"));
                            d.setDiscountPercentage(rs.getDouble("discount_percentage"));
                            d.setStatus(rs.getInt("status"));
                            return d;
                        })
                        .one() // Lấy một khuyến mãi duy nhất
        );
    }
    @Override
    public Categories getCategoryById(int categoryId) {
        return jdbi.withHandle(handle -> {
            Categories category = handle.createQuery(
                            "SELECT * FROM categories WHERE id = :categoryId")
                    .bind("categoryId", categoryId)
                    .mapToBean(Categories.class).findOne().orElse(null);

            if (category != null) {
                // Lấy danh sách sub-category từ bảng categories
                List<Categories> subCategories = handle.createQuery(
                                "SELECT c.* FROM categories c " +
                                        "JOIN table_item t ON c.id = t.sub_category " +
                                        "WHERE t.category_id = :categoryId")
                        .bind("categoryId", categoryId)
                        .mapToBean(Categories.class)
                        .list();

                category.setItems(subCategories);
            }
            return category;
        });
    }
    @Override
    public Brands getBrandById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GenerateQuery.getAllQuery("brands" , "id")) // select brand theo id
                        .bind("id", id)
                        .mapToBean(Brands.class)
                        .findOne()
                        .orElse(null));
    }
    // Truy vấn danh sách sản phẩm theo brand id
    @Override
    public List<ProductIndex> getProductsByBrandId(int brandId) {
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                        handle.createQuery(
                                        GenerateQuery.getAllQuery("products" , "brand_id") // Tạo câu truy vấn cho từng sản phẩm
                                )
                                .bind("brand_id", brandId)
                                .map((rs, ctx) -> getIndexFromRS(rs) )
                                .list() // Lấy danh sách sản phẩm
        );

        // Lấy đường dẫn hình ảnh chính (is_main = 1) cho từng sản phẩm
        productList.forEach(product -> {
            String mainImage = jdbi.withHandle(handle ->
                    handle.createQuery(
                                    "SELECT path FROM products_images WHERE product_id = :id AND is_main = 1"
                            )
                            .bind("id", product.getId())
                            .mapTo(String.class)
                            .findOne()
                            .orElse(null)
            );
            product.setPath_image(mainImage);
        });
        return productList;
    }
    @Override
    public List<Brands> getBrandList() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands")
                        .mapToBean(Brands.class)
                        .list()
        );
    }
    @Override
    public List<Brands> getTop18Brands() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands LIMIT 18")
                        .mapToBean(Brands.class)
                        .list()
        );
    }
    @Override
    public FrameShapes getFrameShapeById(int shapeId) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GenerateQuery.getAllQuery("frame_shapes" , "id"))
                        .bind("id", shapeId)
                        .mapToBean(FrameShapes.class)
                        .findOne()
                        .orElse(null)

        );
    }
    @Override
    public void addFavoriteProduct(int userId, int productId) {
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT IGNORE INTO favorites(user_id, product_id) VALUES (:userId, :productId)")
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .execute()
        );
    }
    @Override
    public Set<Integer> getFavoriteProductIds(int userId) {
        Set<Integer> favoriteIds = new HashSet<>();
        jdbi.useHandle(handle -> {
            List<Integer> productIds = handle.createQuery("SELECT product_id FROM favorites WHERE user_id = :userId")
                    .bind("userId", userId)
                    .mapTo(Integer.class)
                    .list();
            favoriteIds.addAll(productIds);
        });
        return favoriteIds;
    }
    @Override
    public boolean isFavorite(int userId, int productId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM favorites WHERE user_id = :userId AND product_id = :productId")
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }
    @Override
    public void removeFavoriteProduct(int userId, int productId) {
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM favorites WHERE user_id = :userId AND product_id = :productId")
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .execute()
        );
    }
    @Override
    public List<ProductIndex> getFavoriteByUserId(int userId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("""
                                    SELECT p.id, p.category_id, p.brand_id, p.shape_id, p.material,\s
                                           p.name, p.description, p.status, p.hot,\s
                                           p.cost_price, p.selling_price, p.quantity, p.gender,\s
                                           p.color, p.created_at, p.updated_at,
                                           pi.path AS path_image
                                    FROM products p
                                    JOIN favorites f ON p.id = f.product_id
                                    LEFT JOIN products_images pi ON pi.product_id = p.id AND pi.is_main = 1
                                    WHERE f.user_id = :userId
                               \s""")
                        .bind("userId", userId)
                        .mapToBean(ProductIndex.class)
                        .list()
        );
    }
    @Override
    public List<ProductIndex> getProducsBestSeller(int limit, int offset) {
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                        handle.createQuery(
                                        "SELECT p.*, SUM(od.quantity) AS total_sold " +
                                                "FROM products p " +
                                                "JOIN order_details od ON p.id = od.product_id " +
                                                "GROUP BY p.id " +
                                                "ORDER BY total_sold DESC " +
                                                "LIMIT :limit OFFSET :offset"
                                )
                                .bind("limit", limit)
                                .bind("offset", offset)
                                .map((rs, ctx) -> getIndexFromRS(rs))
                                .list()
        );
        // Lấy ảnh đại diện
        productList.forEach(product -> {
            String mainImage = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT path FROM products_images WHERE product_id = :id AND is_main = 1")
                            .bind("id", product.getId())
                            .mapTo(String.class)
                            .findOne()
                            .orElse(null)
            );
            product.setPath_image(mainImage);
        });
        return productList;
    }
    @Override
    public int getTotalBestSellerProducts() {
        return jdbi.withHandle(handle ->
                handle.createQuery(
                        "SELECT COUNT(DISTINCT p.id) " +
                                "FROM products p JOIN order_details od ON p.id = od.product_id"
                ).mapTo(Integer.class).findOne().orElse(0)
        );
    }
    @Override
    public List<ProductIndex> searchProducts(String keyword, int offset, int limit) {
        String searchKeyword = "%" + keyword.toLowerCase() + "%";
        return jdbi.withHandle(handle ->
                handle.createQuery("""
                                    SELECT p.id, p.category_id, p.brand_id, p.shape_id, p.material,\s
                                           p.name, p.description, p.status, p.hot,\s
                                           p.cost_price, p.selling_price, p.quantity, p.gender,\s
                                           p.color, p.created_at, p.updated_at,
                                           pi.path AS path_image
                                    FROM products p
                                    LEFT JOIN brands b ON p.brand_id = b.id
                                    LEFT JOIN categories c ON p.category_id = c.id
                                    LEFT JOIN products_images pi ON pi.product_id = p.id AND pi.is_main = 1
                                    WHERE LOWER(p.name) LIKE :keyword
                                       OR LOWER(p.description) LIKE :keyword
                                       OR LOWER(p.material) LIKE :keyword
                                       OR LOWER(p.color) LIKE :keyword
                                       OR LOWER(b.name) LIKE :keyword
                                       OR LOWER(c.name) LIKE :keyword
                                    ORDER BY p.id DESC
                                    LIMIT :limit OFFSET :offset
                               \s""")
                        .bind("keyword", searchKeyword)
                        .bind("limit", limit)
                        .bind("offset", offset)
                        .mapToBean(ProductIndex.class)
                        .list()
        );
    }
    @Override
    public int countSearchResults(String keyword) {
        String searchKeyword = "%" + keyword.toLowerCase() + "%";
        return jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT COUNT(DISTINCT p.id) " +
                                        "FROM products p " +
                                        "LEFT JOIN brands b ON p.brand_id = b.id " +
                                        "LEFT JOIN categories c ON p.category_id = c.id " +
                                        "WHERE LOWER(p.name) LIKE :keyword " +
                                        "OR LOWER(p.description) LIKE :keyword " +
                                        "OR LOWER(p.material) LIKE :keyword " +
                                        "OR LOWER(p.color) LIKE :keyword " +
                                        "OR LOWER(b.name) LIKE :keyword " +
                                        "OR LOWER(c.name) LIKE :keyword"
                        )
                        .bind("keyword", searchKeyword)
                        .mapTo(Integer.class)
                        .one()
        );
    }
    @Override
    public List<Banner> getAllBanners() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT id, image_url, link_url, title FROM banners WHERE status=1 ORDER BY id DESC")
                        .mapToBean(Banner.class)
                        .list()
        );
    }
}