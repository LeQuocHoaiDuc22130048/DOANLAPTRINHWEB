package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;

public interface UserDao {
    public boolean checkEmailExists(String email);
    public boolean  CreateUserTemp (String email , String password , String username );
    public boolean ActiveAccountExists(int userId);
    public int GetUserIdByEmail(String email);
    public int  Login(String userName, String password);
    public String GetUserPassword(String name);
    public boolean CheckUserExists(String userName);
    public boolean CheckActiveAccount(String userName);
}
