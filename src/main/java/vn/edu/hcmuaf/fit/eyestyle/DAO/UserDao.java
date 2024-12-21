package vn.edu.hcmuaf.fit.eyestyle.DAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.eyestyle.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.Users_Types;

import javax.management.Query;
import java.io.IOException;

public class UserDao {


    private Jdbi jdbi = JDBIConnect.get();
    public UserDao(){

    }

    // kiểm tra tài khoản hợp lệ không
    public boolean isValidUser(String userName, String password) {
        String query = "SELECT password FROM users WHERE name = :userName";
        String passwordValid = (String)this.jdbi.withHandle((h) -> {
            return h.createQuery(query).bind("userName", userName).mapTo(String.class)
                    .findFirst().orElse(null);
        });
        return passwordValid != null && passwordValid.equals(password);
    }
    // lấy userid thông qua name
    public Integer getUserId(String userName) {
        String query = "SELECT id FROM users WHERE name = :userName";
        return (Integer)this.jdbi.withHandle((h) -> {
            return h.createQuery(query).bind("userName", userName).mapTo(Integer.class).
                    findFirst().orElse(null);
        });
    }

    // phân loại người dùng
    public Users_Types getUserType(int userId) {
        String query = "SELECT user_type_id FROM users_types JOIN user_type ON users_types.user_type_id=user_type.id JOIN users ON users_types.user_id=users.id WHERE users_types.user_id = :userId";
        return (Users_Types)this.jdbi.withHandle((h) -> {
            return h.createQuery(query).bind("userId", userId).mapToBean(Users_Types.class)
                    .findFirst().orElse(null);
        });
    }

    // kiểm tra tài khoản đã được kích hoạt chưa
    public boolean isAccountActive(int userId) {
        String query = "SELECT status FROM users WHERE id = :userId";
        return (Boolean)this.jdbi.withHandle((h) -> {
            Integer status = h.createQuery(query).bind("userId", userId).mapTo(Integer.class)
                    .findFirst().orElse(null);
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

    }




