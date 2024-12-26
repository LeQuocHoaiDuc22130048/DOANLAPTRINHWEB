package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;

public interface UserDao {
    public boolean isValidUser(String userName, String password);
    public Integer getUserId(String userName);
    public UsersTypes getUserType(int userId);
    public boolean isAccountActive(int userId);
    public boolean isNewUser(String userName, String password);
    public Integer addUser(String userName, String email, String password, String phone, String address);
}
