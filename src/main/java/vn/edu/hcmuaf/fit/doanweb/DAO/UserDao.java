package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;

public interface UserDao {
    public boolean checkEmailExists(String email);
    public boolean  CreateUserTemp (String email , String password , String username );
    public boolean ActiveAccountExists(int userId);
    public boolean isValidUser(String userName, String password);
    public Integer getUserId(String userName);
    public UsersTypes getUserType(int userId);
    public boolean isAccountActive(int userId);
    public boolean isNewUser(String userName, String password);
    public Integer addUser(String userName, String email, String password, String phone, String address);
    public String getPassword(String username, String email);
}
