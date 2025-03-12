package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;

public class UserDaoImp implements UserDao {
    private Jdbi jdbi = JDBIConnect.get();
    private final static int AdminRole = 1;
    private final static int UserRole = 2;
    private final static int Active = 1;
    private final static int Inactive = 0;
    private final static String CheckEmail = "SELECT email FROM users WHERE email = :email";
    private final static String CreateUserTemp = "INSERT INTO users (name, email, password, phone , address , status, created_at, updated_at)" +
            " VALUES (:name, :email, :password, NULL, NULL, 0, NOW(), NOW())";
    ;
        private final static String ActiveAccount = "UPDATE users set status = 1 where id = :id";
    private final static String GetUserId = "SELECT id FROM users WHERE email = :email";

    private final static String QUERYPASSWORD = "SELECT password FROM users WHERE name = :userName AND status = " + Active;
    private final static String GETPASSWORD = "SELECT password FROM users WHERE name = :userName AND email = :email";
    private final static String ACTIVED = "UPDATE users SET status = " + Active + ", updated_at = NOW() WHERE id = :userId";
    private final static String USEREXIST = "SELECT COUNT(*) FROM users WHERE email = :email";
    private final static String ADDUSER = "INSERT INTO users VALUES (:userName, :email, :password, :phone, :address, 1, NOW(), NOW())";
    private final static String NEWUSER = "SELECT COUNT(*)FROM users WHERE name = :userName AND password = :password";
    private final static String ACTIVEACCOUNT = "SELECT status FROM users WHERE id = :userId";
    private final static String GETUSERTYPE = "SELECT user_type_id FROM users_types " +
            "JOIN user_type ON users_types.user_type_id=user_type.id " +
            "JOIN users ON users_types.user_id=users.id WHERE users_types.user_id = :userId";
    private final static String USERID = "SELECT id FROM users WHERE name = :userName";

    public UserDaoImp() {
    }

    @Override
    public boolean checkEmailExists(String email) {
        return jdbi.withHandle((handle) -> handle.createQuery(CheckEmail)
                .bind("email", email).mapTo(String.class)
                .findOne().orElse(email) != null);
    }
    @Override
    public boolean CreateUserTemp(String username ,String email, String password) {
        return jdbi.withHandle(handle ->
                handle.createUpdate(CreateUserTemp)
                        .bind("name", username)
                        .bind("email", email)
                        .bind("password", password)
                        .execute() > 0 // 🔥 Cần đặt execute() trong lambda
        );
    }

    @Override
    public boolean ActiveAccountExists(int userId) {
        return  jdbi.withHandle(handle -> handle.createUpdate(ActiveAccount).bind("id", userId).execute() > 0);
    }

    @Override
    public int GetUserIdByEmail(String email) {
        return jdbi.withHandle((handle -> handle.createQuery(GetUserId).bind("email" , email).mapTo(Integer.class).first()));
    }

    @Override
    public boolean isValidUser(String userName, String password) {

        String passwordValid = this.jdbi.withHandle((h) -> h.createQuery(QUERYPASSWORD).bind("userName", userName).mapTo(String.class).findFirst().orElse(null));
        return passwordValid != null && BCrypt.checkpw(password, passwordValid);
    }

    @Override
    public Integer getUserId(String userName) {

        return this.jdbi.withHandle((h) -> {
            return h.createQuery(USERID).bind("userName", userName).mapTo(Integer.class).findFirst().orElse(null);
        });
    }

    @Override
    public UsersTypes getUserType(int userId) {
        return this.jdbi.withHandle((h) -> {
            return h.createQuery(GETUSERTYPE)
                    .bind("userId", userId)
                    .mapToBean(UsersTypes.class)
                    .findFirst().orElse(null);
        });
    }

    @Override
    public boolean isAccountActive(int userId) {
         return jdbi.withHandle((h) -> h.createUpdate(ActiveAccount).bind("id" , userId).execute() > 0);
    }
    // phương thức kiểm tra người dùng mới
    @Override
    public boolean isNewUser(String userName, String password) {
        return jdbi.withHandle(h -> {
            int row = h.createQuery(NEWUSER).bind("userName", userName)
                    .bind("password", password)
                    .mapTo(Integer.class).findFirst().orElse(0);
            return row == 0;

        });

    }

    // phương thức thêm người dùng mới
    @Override
    public Integer addUser(String userName, String email, String password, String phone, String address) {
        return jdbi.withHandle(h ->
                h.createUpdate(ADDUSER)
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
        return jdbi.withHandle(h -> h.createUpdate(ACTIVED)
                .bind("userId", userId)
                .execute() > 0
        );
    }

    // kiểm tra người dùng đã có trong hệ thống hay chưa
    public boolean checkUserExist(String username, String email) {
        return jdbi.withHandle(h -> {
            int row = h.createQuery(USEREXIST)
                    .bind("email", email)
                    .mapTo(Integer.class)
                    .findFirst()
                    .orElse(0);
            return row > 0;  // Kiểm tra nếu có ít nhất 1 người dùng có username và email khớp
        });
    }

    @Override
    public String getPassword(String userName, String email) {
        return jdbi.withHandle(h -> h.createQuery(GETPASSWORD)
                .bind("userName", userName)
                .bind("email", email)
                .mapTo(String.class)
                .findFirst().orElse(null));
    }

}