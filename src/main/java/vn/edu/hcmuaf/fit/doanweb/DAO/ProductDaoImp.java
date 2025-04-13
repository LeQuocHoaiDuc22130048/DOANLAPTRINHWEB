package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateQuery;

import java.util.List;

public class ProductDaoImp implements ProductDaoInterface {
    public Jdbi jdbi = JDBIConnect.get();

    @Override
    public ProductIndex getProductById(int id) {
        ProductIndex product = jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products WHERE id = :id"
                        )
                        .bind("id", id)
                        .map((rs, ctx) -> {
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
                            p.setCostPrice(rs.getDouble("cost_price"));
                            p.setSellingPrice(rs.getDouble("selling_price"));
                            p.setQuantity(rs.getInt("quantity"));
                            p.setGender(rs.getInt("gender"));
                            p.setColor(rs.getString("color"));
                            p.setCreateAt(rs.getTimestamp("created_at").toLocalDateTime());
                            p.setUpdateAt(rs.getTimestamp("updated_at").toLocalDateTime());
                            return p;
                        })
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
                .bind("value",value)
                .mapToBean(ProductByCondition.class).list()));
        return list;
    }

    @Override
    public List<ProductIndex> getProductsByGender(int gender) {
        // Truy vấn danh sách sản phẩm theo giới tính
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                        handle.createQuery(
                                        "SELECT * FROM products WHERE gender = :gender"
                                )
                                .bind("gender", gender) // Gán giá trị giới tính vào câu truy vấn
                                .map((rs, ctx) -> {
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
//                            p.setCreateAt(rs.getTimestamp("created_at").toLocalDateTime());
//                            p.setUpdateAt(rs.getTimestamp("updated_at").toLocalDateTime());
                                    return p;
                                })
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
        List<ProductImage> images = jdbi.withHandle(handle ->
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

        return images;
    }

    @Override
    public List<ProductIndex> getProductsByCategory(int categoryId) {
        // Truy vấn danh sách sản phẩm theo category_id
        List<ProductIndex> productList = jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products WHERE category_id = :categoryId"
                        )
                        .bind("categoryId", categoryId) // Gán giá trị category_id vào câu truy vấn
                        .map((rs, ctx) -> {
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
                            p.setCreateAt(rs.getTimestamp("created_at").toLocalDateTime());
                            p.setUpdateAt(rs.getTimestamp("updated_at").toLocalDateTime());
                            return p;
                        })
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
        Discounts discount = jdbi.withHandle(handle ->
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

        return discount;
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
                handle.createQuery("SELECT * FROM brands WHERE id= :id")
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
                                        "SELECT * FROM products WHERE brand_id = :brandId"
                                )
                                .bind("brandId", brandId)
                                .map((rs, ctx) -> {
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
//                            p.setCreateAt(rs.getTimestamp("created_at").toLocalDateTime());
//                            p.setUpdateAt(rs.getTimestamp("updated_at").toLocalDateTime());
                                    return p;
                                })
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
                handle.createQuery("SELECT * FROM frame_shapes WHERE id= :id")
                        .bind("id", shapeId)
                        .mapToBean(FrameShapes.class)
                        .findOne()
                        .orElse(null)

        );
    }

    public static void main(String[] args) {
    }

}