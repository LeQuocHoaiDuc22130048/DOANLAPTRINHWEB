package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;


import java.io.IOException;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {
    private UserDaoImp userDaoImp;
    private final String Home = JSPPage.Index.getPage();
    private final String Login = JSPPage.Login.getPage();
    private User user;

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
        if (realPassword == null ||!BCrypt.checkpw(password, realPassword ) ) {
            request.setAttribute("Error", "Đăng nhập thất bại vui lòng kiểm tra tài khoản , mật khẩu !");
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        user = userDaoImp.Login(userName, realPassword);
        if (user == null) {
            System.out.println("Login fail");
            request.setAttribute("Error", "Đăng nhập thất bại vui lòng kích hoạt tài khoản của bạn ");
            request.getRequestDispatcher(Login).forward(request, response);
            return ;
        }
        String token = JwtUtil.generateToken(userName);
        response.setHeader("Authorization", "Bearer " + token);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        request.getRequestDispatcher(Home).forward(request, response);
    }
}
