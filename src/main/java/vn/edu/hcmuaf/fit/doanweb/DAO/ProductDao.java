package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.ProductByCondition;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.Util.GenerateQuery;

import java.util.List;

public class ProductDao {

    private final Jdbi jdbi = JDBIConnect.get();

    public ProductDao(){

    }
    public List<ProductByCondition> getProductByCondition(String type, String value) {
        List<ProductByCondition> list;
        list = jdbi.withHandle((handle -> handle.createQuery(GenerateQuery.GetProductBy(type))
                .bind("value",value)
                .mapToBean(ProductByCondition.class).list()));
        return list;
    }
    // lọc sản phẩm theo chất liệu
    public List<ProductByMaterial>getProductByMaterial(String material){

        String query = "SELECT p.id, p.name, p.selling_price, p.material,pi.path" +
                " FROM products p JOIN products_images pi ON p.id = pi.product_id" +
                " WHERE p.material LIKE :material AND pi.is_main = 1";

        return jdbi.withHandle(h->
                h.createQuery(query)
                        .bind("material",material)
                        .map((rs, ctx)-> new ProductByMaterial(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getString("material")
                        )).list()
        );
    }


    // lọc sản phẩm theo giới tính

    public List<ProductByGender>getProductByGender(int gender){

        String query = "SELECT p.id, p.name, p.selling_price, p.gender , pi.path" +
                " FROM products p JOIN products_images pi ON p.id = pi.product_id" +
                " WHERE p.gender = :gender AND pi.is_main = 1";

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("gender", gender) // Truyền tham số gender
                        .map((rs, ctx) -> new ProductByGender(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("gender")
                        )).list()
        );

    }


    // lọc san phẩm theo màu sắc

    public List<ProductByColor> getProductByColor(String color){

        String query = "SELECT p.id, p.name, p.selling_price, p.color, pi.path" +
                " FROM products p JOIN products_images pi ON p.id = pi.product_id " +
                "WHERE p.color LIKE :color AND pi.is_main = 1";
        return jdbi.withHandle(h->
                h.createQuery(query).bind("color", color)
                        .map((rs,ctx)-> new ProductByColor(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getString("color")
                        )).list()
        );

    }

    // lọc sản phẩm theo hình dáng

    public List<ProductByShape>getProductByShape(int shape){

        String query = "SELECT p.id, p.name, p.selling_price, p.shape_id, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "JOIN frame_shapes fs ON p.shape_id = fs.id " +
                "WHERE p.shape_id = :shape AND pi.is_main = 1"; // Lọc theo shape_id

        return jdbi.withHandle(h ->
                h.createQuery(query)
                        .bind("shape", shape)
                        .map((rs, ctx) -> new ProductByShape(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("shape_id")
                        ))
                        .list()
        );
    }
//
//
//    // lọc sản phẩm theo thương hiệu
//    public List<ProductByBrand> getProductByBrand(int brand){
//
//        String query = "SELECT p.id, p.name, p.selling_price, p.brand_id, pi.path " +
//                "FROM products p " +
//                "JOIN products_images pi ON p.id = pi.product_id " +
//                "JOIN brands b ON p.brand_id = b.id " +
//                "WHERE p.brand_id = :brand AND pi.is_main = 1";
//
//        return jdbi.withHandle(h ->
//                h.createQuery(query)
//                        .bind("brand", brand)
//                        .map((rs, ctx) -> new ProductByBrand(
//                                rs.getInt("id"),
//                                rs.getString("name"),
//                                rs.getLong("selling_price"),
//                                rs.getString("path"),
//                                rs.getInt("brand_id")
//                        ))
//                        .list()
//        );
//    }

    // lọc sản phẩm theo danh mục
    public List<ProductByCategory> getProductByCategory(int category){
        String query = "SELECT p.id, p.name, p.selling_price, p.category_id, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE p.category_id = :category AND pi.is_main = 1";

        return jdbi.withHandle(h ->
                h.createQuery(query)
                        .bind("category", category)
                        .map((rs,ctx)-> new ProductByCategory(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("category_id")
                        ))
                        .list()
        );

    }

    // lọc san phẩm theo  khoảng giá

    public List<ProductByPriceRange> getProductByPrice(long minPrice, long maxPrice){

        String query = "SELECT p.id, p.name, p.selling_price, pi.path " +
                "FROM products p JOIN products_images pi ON p.id = pi.product_id " +
                "WHERE p.selling_price BETWEEN :minPrice AND :maxPrice " +
                "AND pi.is_main = 1";

        return jdbi.withHandle(h ->
                h.createQuery(query)
                        .bind("minPrice", minPrice)
                        .bind("maxPrice", maxPrice)
                        .map((rs, ctx) -> new ProductByPriceRange(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path")
                        ))
                        .list()
        );
    }

}