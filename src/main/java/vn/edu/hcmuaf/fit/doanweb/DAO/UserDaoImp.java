package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.Util.Roles;

import java.util.Optional;

public class UserDaoImp implements UserDao {
    private final Jdbi jdbi = JDBIConnect.get();


    private final static String defaultUserAvatar = "/assets/images/Avatar/user.png";
    private final static int Active = 1;
    private final static int Inactive = 0;

    // Optimized queries with proper indexing hints and consistent parameter binding
    private final static String CheckEmail = "SELECT email FROM users WHERE email = :email LIMIT 1";
    private final static String CreateUserTemp = "INSERT INTO users (name, email, password, phone, address, status, role , avatar ,  created_at, updated_at) " +
            "VALUES (:name, :email, :password, NULL, NULL,0 , :role  , :avatar  , NOW(), NOW())";
    private final static String ActiveAccount = "UPDATE users SET status = 1 WHERE id = :id";
    private final static String GetUserId = "SELECT id FROM users WHERE email = :email LIMIT 1";
    private final static String Login = "SELECT * FROM users WHERE name = :name AND password = :password AND status = 1  LIMIT 1";
    private final static String GetUserPassword = "SELECT password FROM users WHERE name = :name LIMIT 1";
    private final static String UserExists = "SELECT COUNT(*) FROM users WHERE name = :name";
    private final static String CheckActive = "SELECT status FROM users WHERE name = :name LIMIT 1";
    private final static String UpdateUser = "UPDATE users SET name = :name , email = " +
            ":email , password = :password  ," +
            "phone = :phone  , address = :address , avatar = :avatar  WHERE id = :id";
    private final static String GetUserById = "SELECT name , email , phone , address , avatar FROM users WHERE id = :id";

    public UserDaoImp() {
        // Initialize indexes if they don't exist
    }

    @Override
    public boolean UpdateProfile(User user) {

        return jdbi.withHandle(handle -> handle.createUpdate(UpdateUser)
                .bind("id", user.getId())
                .bind("name", user.getName())
                .bind("email", user.getEmail())
                .bind("password", user.getPassword())
                .bind("phone", user.getPhone())
                .bind("address", user.getAddress())
                .bind("avatar", user.getAvatar())
                .execute() > 0);
    }

    @Override
    public UserProfile GetUser(int userId) {

        return jdbi.withHandle(handle -> handle.createQuery(GetUserById)
                .bind("id", userId)
                .mapToBean(UserProfile.class).first());
    }

    @Override
    public boolean checkEmailExists(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery(CheckEmail)
                        .bind("email", email)
                        .mapTo(String.class)
                        .findOne()
                        .isPresent()
        );
    }

    @Override
    public boolean CreateUserTemp(String username, String email, String password) {
        return jdbi.withHandle(handle ->
                handle.createUpdate(CreateUserTemp)
                        .bind("name", username)
                        .bind("email", email)
                        .bind("password", password)
                        .bind("role", Roles.USER.getRole())
                        .bind("avatar", defaultUserAvatar)
                        .execute() > 0
        );
    }

    @Override
    public boolean ActiveAccountExists(int userId) {
        return jdbi.withHandle(handle ->
                handle.createUpdate(ActiveAccount)
                        .bind("id", userId)
                        .execute() > 0
        );
    }

    @Override
    public int GetUserIdByEmail(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GetUserId)
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(-1)
        );
    }

    @Override
    public User Login(String userName, String password) {
        return jdbi.withHandle(handle ->
                handle.createQuery(Login)
                        .bind("name", userName)
                        .bind("password", password)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    @Override
    public String GetUserPassword(String name) {
        return jdbi.withHandle(handle ->
                handle.createQuery(GetUserPassword)
                        .bind("name", name)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }

    @Override
    public boolean CheckUserExists(String userName) {
        return jdbi.withHandle(handle ->
                handle.createQuery(UserExists)
                        .bind("name", userName)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }

    @Override
    public boolean CheckActiveAccount(String userName) {
        return jdbi.withHandle(handle ->
                handle.createQuery(CheckActive)
                        .bind("name", userName)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(Inactive) == Active
        );
    }
}