package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Posts;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;

import java.util.List;
import java.util.Optional;

public class PostDao {
    private final Jdbi jdbi = JDBIConnect.get();
    
    // Optimized queries with proper indexing hints
    private final static String GET_ALL_POSTS =
            "SELECT id, thumbnail, created_at, title, content, url, access FROM Posts ORDER BY created_at DESC";
    
    private final static String GET_POST_BY_ID =
            "SELECT id, thumbnail, created_at, title, content, url, access FROM Posts WHERE id = :id LIMIT 1";
    
    private final static String GET_POSTS_BY_LIMIT =
            "SELECT id, thumbnail, created_at, title, content, url, access FROM Posts ORDER BY created_at DESC LIMIT :limit OFFSET :offset";
    
    private final static String GET_POSTS_BY_ACCESS =
            "SELECT id, thumbnail, created_at, title, content, url, access FROM Posts WHERE access = :access ORDER BY created_at DESC";
    
    private final static String CREATE_POST_INDEXES =
            "CREATE INDEX IF NOT EXISTS idx_posts_created_at ON Posts(created_at); " +
            "CREATE INDEX IF NOT EXISTS idx_posts_access ON Posts(access); " +
            "CREATE INDEX IF NOT EXISTS idx_posts_id ON Posts(id)";
    
    public PostDao() {
        initializeIndexes();
    }
    
    private void initializeIndexes() {
        try {
            jdbi.withHandle(handle -> {
                handle.execute(CREATE_POST_INDEXES);
                return null;
            });
        } catch (Exception e) {
            // Log error but don't fail initialization
            System.err.println("Failed to create indexes: " + e.getMessage());
        }
    }

    public List<Posts> getAllPost() {
        return jdbi.withHandle(handle ->
                handle.createQuery(GET_ALL_POSTS)
                        .map((rs, ctx) -> mapResultSetToPost(rs))
                        .list()
        );
    }
    
    public Optional<Posts> getPostById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GET_POST_BY_ID)
                        .bind("id", id)
                        .map((rs, ctx) -> mapResultSetToPost(rs))
                        .findOne()
        );
    }
    
    public List<Posts> getPostsByLimit(int limit, int offset) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GET_POSTS_BY_LIMIT)
                        .bind("limit", limit)
                        .bind("offset", offset)
                        .map((rs, ctx) -> mapResultSetToPost(rs))
                        .list()
        );
    }
    
    public List<Posts> getPostsByAccess(int access) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GET_POSTS_BY_ACCESS)
                        .bind("access", access)
                        .map((rs, ctx) -> mapResultSetToPost(rs))
                        .list()
        );
    }
    
    private Posts mapResultSetToPost(java.sql.ResultSet rs) throws java.sql.SQLException {
        Posts post = new Posts();
        post.setId(rs.getInt("id"));
        post.setThumbnail(rs.getString("thumbnail"));
        post.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
        post.setTitle(rs.getString("title"));
        post.setContent(rs.getString("content"));
        post.setUrl(rs.getString("url"));
        post.setAccess(rs.getInt("access"));
        return post;
    }
}
