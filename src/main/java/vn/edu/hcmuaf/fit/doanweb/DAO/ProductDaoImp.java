package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.util.List;

public class ProductDaoImp implements ProductDaoInterface {
    public Jdbi jdbi= JDBIConnect.get();

    @Override
    public Product getProductById(int id) {
        Product product = jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products WHERE id = :id"
                        )
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            Product p = new Product();
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
    public List<Product> getProductsByGender(int gender) {
        // Truy vấn danh sách sản phẩm theo giới tính
        List<Product> productList = jdbi.withHandle(handle ->
                handle.createQuery(
                                "SELECT * FROM products WHERE gender = :gender"
                        )
                        .bind("gender", gender) // Gán giá trị giới tính vào câu truy vấn
                        .map((rs, ctx) -> {
                            Product p = new Product();
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

    public static void main(String[] args) {
        ProductDaoImp productDao = new ProductDaoImp();
        Product product = productDao.getProductById(4);
        Product product1 = productDao.getProductById(5);
        Product product2 = productDao.getProductById(10);
        Discounts d= productDao.getActiveDiscounts();
//        System.out.println(d.toString());
//        List<Product> d= productDao.getProductsByGender(1);
//        System.out.println(d);
//        for (int i=0; i<d.size(); i++) {
//            System.out.println(d.get(i).To);
//        }

//        if (product != null) {
//            System.out.println("Tên sản phẩm: " + product.getName());
//            System.out.println(" hình ảnh: " + product.getPath_image());
//        } else {
//            System.out.println("Sản phẩm không tồn tại.");
//        }

//        Cart cart= new Cart();
//        System.out.println(cart.add(product));
//        System.out.println(cart.add(product1));
//        System.out.println(cart.add(product2));
//      System.out.println(cart.getTotalQuality());
//      System.out.println(cart.getList());
//      System.out.println(cart.getTotalPrice());

    }

}
