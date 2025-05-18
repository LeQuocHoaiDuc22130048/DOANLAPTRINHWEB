package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.Controller.DTO.UserProfile;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;

public interface UserDao {
    public boolean checkEmailExists(String email);
    public boolean  CreateUserTemp (String email , String password , String username );
    public boolean ActiveAccountExists(int userId);
    public int GetUserIdByEmail(String email);
    public User Login(String userName, String password);
    public String GetUserPassword(String name);
    public boolean CheckUserExists(String userName);
    public boolean CheckActiveAccount(String userName);
    public boolean UpdateProfile(User user);
    public UserProfile GetUser(int userId);
    public void updateOrderUserId(String orderCode, int userId);
    public void insertFeedback(String name, String email, String message);
    public boolean isUpdatePassword (String email, String password);
}
