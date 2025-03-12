package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Handle;
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
    private final static String CheckEmail = "SELECT email FROM users WHERE email = :email LIMIT 1";
    private final static String CreateUserTemp = "INSERT INTO users  (name, email, password, phone , address , status, created_at, updated_at) " +
            "VALUES (:name, :email, :password, NULL, NULL, 0, NOW(), NOW())";
    private final static String ActiveAccount = "UPDATE users set status = 1 where id = :id";
    private final static String GetUserId = "SELECT id FROM users WHERE name = :name";
    private final static String Login = "SELECT id FROM users WHERE name = :name and password = :password";
    private final static String GetUserPassword = "SELECT password FROM users WHERE name = :name LIMIT 1";
    private final static String UserExists = "SELECT id FROM users WHERE name = :name LIMIT 1";

    public UserDaoImp() {
    }

    @Override
    public boolean checkEmailExists(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery(CheckEmail)
                        .bind("email", email)
                        .mapTo(String.class)
                        .first().isEmpty() // Kiểm tra xem giá trị có tồn tại hay không
        );
    }

    @Override
    public boolean CreateUserTemp(String username, String email, String password) {
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
        return jdbi.withHandle(handle -> handle.createUpdate(ActiveAccount).bind("id", userId).execute() > 0);
    }

    @Override
    public int GetUserIdByEmail(String name) {
        return jdbi.withHandle((handle -> handle.createQuery(GetUserId).bind("name", name).mapTo(Integer.class).first()));
    }

    @Override
    public int Login(String userName, String password) {
        return jdbi.withHandle((handle -> handle.createQuery(Login)
                .bind("name", userName).bind("password", password).mapTo(Integer.class).first()));
    }

    @Override
    public String GetUserPassword(String name) {
        return jdbi.withHandle((handle -> handle.createQuery(GetUserPassword).bind("name", name)
                .mapTo(String.class).findOne().orElse(null)));
    }

    @Override
    public boolean CheckUserExists(String userName) {
        return jdbi.withHandle((Handle handle) -> handle.createQuery(UserExists).bind("name", userName)
                .mapTo(Integer.class).findFirst().orElse(-1) > 0);
    }


}