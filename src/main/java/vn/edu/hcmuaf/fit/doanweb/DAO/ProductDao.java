package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;

import java.util.List;

public class ProductDao {

    private Jdbi jdbi = JDBIConnect.get();

    public ProductDao(){

    }




    // lọc sản phẩm theo chất liệu
    public List<ProductOfMaterial> getProductOfMaterial(String material) {
        String query = "SELECT p.id, p.name, p.selling_price, p.material, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "WHERE pi.is_main = 1 AND p.material LIKE :material";

        String processedMaterial = "%" + material + "%";
        return jdbi.withHandle(h ->
                h.createQuery(query)
                        .bind("material",processedMaterial )
                        .map((rs, ctx) -> new ProductOfMaterial(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getString("material")
                        ))
                        .list()
        );
    }


    // lọc sản phẩm theo giới tính

    public List<ProductOfGender>getProductOfGender(int gender){

        String query = "SELECT p.id, p.name, p.selling_price, p.gender , pi.path" +
                " FROM products p JOIN products_images pi ON p.id = pi.product_id" +
                " WHERE p.gender = :gender AND pi.is_main = 1";

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("gender", gender) // Truyền tham số gender
                        .map((rs, ctx) -> new ProductOfGender(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("gender")
                        )).list()
        );

    }


    // lọc san phẩm theo màu sắc

    public List<ProductOfColor> getProductOfColor(String color){

        String query = "SELECT p.id, p.name, p.selling_price, p.color, pi.path" +
                " FROM products p JOIN products_images pi ON p.id = pi.product_id " +
                "WHERE p.color LIKE :color AND pi.is_main = 1";
        return jdbi.withHandle(h->
                h.createQuery(query).bind("color", color)
                        .map((rs,ctx)-> new ProductOfColor(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getString("color")
                        )).list()
        );

    }

    // lọc sản phẩm theo hình dáng

    public List<ProductOfShape>getProductOfShape(int shape){

        String query = "SELECT p.id, p.name, p.selling_price, p.shape_id, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "JOIN frame_shapes fs ON p.shape_id = fs.id " +
                "WHERE p.shape_id = :shape AND pi.is_main = 1"; // Lọc theo shape_id

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("shape", shape)
                        .map((rs, ctx) -> new ProductOfShape(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("shape_id")
                        ))
                        .list()
        );
    }


    // lọc sản phẩm theo thương hiệu
    public List<ProductOfBrand> getProductOfBrand(int brand){

        String query = "SELECT p.id, p.name, p.selling_price, p.brand_id, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "JOIN brands b ON p.brand_id = b.id " +
                "WHERE p.brand_id = :brand AND pi.is_main = 1";

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("brand", brand)
                        .map((rs, ctx) -> new ProductOfBrand(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("brand_id")
                        ))
                        .list()
        );
    }

    // lọc sản phẩm theo danh mục
    public List<ProductOfCategory> getProductOfCategory(int category){
        String query = "SELECT p.id, p.name, p.selling_price, p.category_id, pi.path " +
                "FROM products p " +
                "JOIN products_images pi ON p.id = pi.product_id " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE p.category_id = :category AND pi.is_main = 1";

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("category", category)
                        .map((rs,ctx)-> new ProductOfCategory(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getLong("selling_price"),
                                rs.getString("path"),
                                rs.getInt("category_id")
                        ))
                        .list()
        );

    }
}




