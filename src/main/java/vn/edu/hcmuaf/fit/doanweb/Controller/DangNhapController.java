package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;


import java.io.IOException;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {
    private UserDaoImp userDaoImp;
    private String LoginFailed = "Login Failed";
    private String PasswordIncorect = "Incorrect Password";
    private String UserNotExist = "User Not Exist";
    private String Home = "/index.jsp";
    private String Login = "/dang_nhap.jsp";
    @Override
    public void init() throws ServletException {
        userDaoImp = new UserDaoImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String realPassword = userDaoImp.GetUserPassword(userName);

        if (!userDaoImp.CheckUserExists(userName)) {
            request.setAttribute("Error", UserNotExist);
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        if (  realPassword == null||!BCrypt.checkpw(password, realPassword)) {
            request.setAttribute("Error", PasswordIncorect);
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        if (!userDaoImp.CheckActiveAccount(userName)) {
            request.setAttribute("Error", UserNotExist);
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        int userId = userDaoImp.Login(userName, realPassword);
        if (userId == -1) {
            request.setAttribute("Error", LoginFailed);
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        request.setAttribute("userId", userId);
        request.getRequestDispatcher(Home).forward(request, response);
    }
}
