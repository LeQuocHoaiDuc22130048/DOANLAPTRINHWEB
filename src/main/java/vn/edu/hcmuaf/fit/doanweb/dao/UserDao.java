package vn.edu.hcmuaf.fit.doanweb.dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.model.User;
import vn.edu.hcmuaf.fit.doanweb.model.UsersTypes;

import java.io.IOException;

public class UserDao {
    private Jdbi jdbi;

public UserDao(){
    this.jdbi=JDBIConnector.getJdbi();
}

// kiểm tra xem tên và mật khẩu có đúng không
    public boolean isValidUser(String userName, String password){
    String query = "SELECT password FROM users WHERE name = :userName";

    String passwordValid = jdbi.withHandle(h->{
        return h.createQuery(query).bind("userName", userName).mapTo(String.class)
                .findFirst().orElse(null);
    });

    return passwordValid!=null && passwordValid.equals(password);
    }

    // phương thức lấy userId từ tên đăng nhập
    public Integer getUserId(String userName){
    String query ="SELECT id FROM users WHERE name = :userName";

        return jdbi.withHandle(h -> {
           return h.createQuery(query).bind("userName", userName).mapTo(Integer.class)
                    .findFirst().orElse(null);
        });
    }
// phương thức chuyển hướng đối với người dùng có đã có tài khoản
    // nếu là người dùng bình thường thì chuyển đến trang chủ
    // là admin thì chuyển đến trang admin
public void redirect(HttpServletRequest request, HttpServletResponse response,int userId)throws IOException {
    if(!isAccountActive(userId)){
        return;
    }
    UsersTypes usertype = getUserType(userId);
    if(usertype.getUser_type_id()==1){
        response.sendRedirect("admin/admin.html");
    }else if(usertype.getUser_type_id()==2){
        response.sendRedirect("index.jsp");
    }else{
        response.sendError(1,"Tài khoản chưa được đăng kí");
    }
}

    // phuơng thức xác định là ngươid dùng bình thường hay admin
    public UsersTypes getUserType(int userId){
    String query = "SELECT user_type_id FROM users_types " +
            "JOIN user_type ON users_types.user_type_id=user_type.id " +
            "JOIN users ON users_types.user_id=users.id " +
            "WHERE users_types.user_id = :userId";
    return jdbi.withHandle(h->{
        return h.createQuery(query).bind("userId",userId)
                .mapToBean(UsersTypes.class).findFirst().orElse(null);
    });

    }

// phương thức kiểm tra xem là người dùng đã có tài khoản chưa
    public boolean isAccountActive(int userId){

    String query = "SELECT status FROM users WHERE id = :userId";
    return jdbi.withHandle(h->{
       Integer status= h.createQuery(query).bind("userId", userId)
                .mapTo(Integer.class).findFirst().orElse(null);

        return status!=null && status==1;
    });

    }

}
