package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Categories;

import java.util.ArrayList;
import java.util.List;

public class ProductCategoryDao {
    private Jdbi jdbi= JDBIConnect.get();

    // Lấy danh mục sản theo ID
    public Categories getCategoryById(int categoryId) {
        return jdbi.withHandle(handle -> {
            Categories category = handle.createQuery(
                            "SELECT * FROM categories WHERE id = :categoryId")
                    .bind("categoryId", categoryId)
                    .map((rs, ctx) -> new Categories(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getInt("status"),
                            rs.getInt("hot"),
                            rs.getTimestamp("created_at").toLocalDateTime(),
                            rs.getTimestamp("updated_at").toLocalDateTime(),
                            rs.getString("title"),
                            rs.getString("img"),
                            rs.getString("description"),
                            new ArrayList<>()
                    )).findOne().orElse(null);

            if (category != null) {
                // Lấy danh sách sub-category từ bảng categories
                List<Categories> subCategories = handle.createQuery(
                                "SELECT c.* FROM categories c " +
                                        "JOIN table_item t ON c.id = t.sub_category " +
                                        "WHERE t.category_id = :categoryId")
                        .bind("categoryId", categoryId)
                        .map((rs, ctx) -> new Categories(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getInt("status"),
                                rs.getInt("hot"),
                                rs.getTimestamp("created_at").toLocalDateTime(),
                                rs.getTimestamp("updated_at").toLocalDateTime(),
                                rs.getString("title"),
                                rs.getString("img"),
                                rs.getString("description"),
                                null
                        ))
                        .list();
                category.setItems(subCategories);
            }
            return category;
        });
    }



    public static void main(String[] args) {
//     Categories f= new ProductCategoryDao().getCategoryById(3);
//     System.out.println(f.getName());
    }

}
