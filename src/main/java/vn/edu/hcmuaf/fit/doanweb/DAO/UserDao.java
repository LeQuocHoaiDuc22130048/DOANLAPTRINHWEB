package vn.edu.hcmuaf.fit.doanweb.DAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;


public class UserDao {
        private Jdbi jdbi = JDBIConnect.get();

        public UserDao() {
        }

        public boolean isValidUser(String userName, String password) {
           String query= "SELECT password FROM users WHERE name = :userName AND status = 1";

            String passwordValid = this.jdbi.withHandle((h) -> {
                return h.createQuery(query).bind("userName", userName).mapTo(String.class).findFirst().orElse(null);
            });
            return passwordValid != null && passwordValid.equals(password);
        }

        public Integer getUserId(String userName) {
            String query = "SELECT id FROM users WHERE name = :userName";
            return this.jdbi.withHandle((h) -> {
                return h.createQuery(query).bind("userName", userName).mapTo(Integer.class).findFirst().orElse(null);
            });
        }

        public void redirect(HttpServletRequest request, HttpServletResponse response, int userId) throws IOException {
            if (this.isAccountActive(userId)) {
                UsersTypes usertype = this.getUserType(userId);
                if (usertype.getUser_type_id() == 1) {
                    response.sendRedirect("admin/admin.html");
                } else if (usertype.getUser_type_id() == 2) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendError(1, "Tài khoản chưa được đăng kí");
                }

            }
        }

        public UsersTypes getUserType(int userId) {
            String query = "SELECT user_type_id FROM users_types JOIN user_type ON users_types.user_type_id=user_type.id JOIN users ON users_types.user_id=users.id WHERE users_types.user_id = :userId";
            return this.jdbi.withHandle((h) -> {
                return h.createQuery(query).bind("userId", userId).mapToBean(UsersTypes.class).findFirst().orElse(null);


            });
        }

        public boolean isAccountActive(int userId) {
            String query = "SELECT status FROM users WHERE id = :userId";
            return this.jdbi.withHandle((h) -> {
                Integer status = h.createQuery(query).bind("userId", userId).mapTo(Integer.class).findFirst().orElse(null);
                return status != null && status == 1;
            });
        }


    // phương thức kiểm tra người dùng mới
    public boolean isNewUser(String userName, String password){

        String query = "SELECT COUNT(*)FROM users WHERE name = :userName AND password = :password";
        return jdbi.withHandle(h->{
            int row=  h.createQuery(query).bind("userName", userName)
                    .bind("password",password)
                    .mapTo(Integer.class).findFirst().orElse(0);
            return row==0;

        });

    }

    // phương thức thêm người dùng mới
    public Integer addUser(String userName, String email, String password, String phone, String address) {
        String query = "INSERT INTO users (name, email, password, phone, address, status, created_at, updated_at) " +
                "VALUES (:userName, :email, :password, :phone, :address, 1, NOW(), NOW())";
        return jdbi.withHandle(h ->
                h.createUpdate(query)
                        .bind("userName", userName)
                        .bind("email", email)
                        .bind("password", password)
                        .bind("phone", phone)
                        .bind("address", address)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Integer.class)
                        .findFirst()
                        .orElse(null)
        );
    }



    // phương thức kích hoạt tài khoản
    public boolean activeAccount(int userId) {
        String query = "UPDATE users SET status = 1, updated_at = NOW() WHERE id = :userId";
        return jdbi.withHandle(h ->
                h.createUpdate(query)
                        .bind("userId", userId)
                        .execute() > 0
        );
    }



}

