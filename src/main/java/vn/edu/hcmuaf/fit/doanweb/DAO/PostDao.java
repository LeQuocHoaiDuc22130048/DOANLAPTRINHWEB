package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Posts;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;

import java.util.List;

public class PostDao {
    private final Jdbi jdbi = JDBIConnect.get();
    private final static String GET_ALL_POSTS =
            "SELECT id, thumbnail, created_at, title, content, url, access FROM Posts";

    public List<Posts> getAllPost() {
        return jdbi.withHandle(handle ->
                handle.createQuery(GET_ALL_POSTS)
                        .map((rs, ctx) -> {
                            Posts post = new Posts();
                            post.setId(rs.getInt("id"));
                            post.setThumbnail(rs.getString("thumbnail"));
                            post.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                            post.setTitle(rs.getString("title"));
                            post.setContent(rs.getString("content"));
                            post.setUrl(rs.getString("url"));
                            post.setAccess(rs.getInt("access"));
                            return post;
                        })
                        .list()
        );
    }
}
