package vn.edu.hcmuaf.fit.doanweb.Controller;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Util.ErrorMessages;
import vn.edu.hcmuaf.fit.doanweb.Util.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;


import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {
    private UserDaoImp userDaoImp;
    private final String Home = JSPPage.Index.getPage();
    private final String Login = JSPPage.Login.getPage();
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
        String BackToHome = request.getContextPath() + "/index";
        if (realPassword == null ||!BCrypt.checkpw(password, realPassword ) ) {
            request.setAttribute("Error", ErrorMessages.LoginFail.getMessage());
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        User user = userDaoImp.Login(userName, realPassword);
        if (user == null) {
            request.setAttribute("Error", ErrorMessages.ActiveMail.getMessage());
            request.getRequestDispatcher(Login).forward(request, response);
            return ;
        }
        // tạo token và lưu vào header
        String token = JwtUtil.generateToken(user.getId(), user.getRole(), user.getName());
        response.setContentType("application/json");
        response.setHeader("Authorization", "Bearer " + token);
        // tạo session lưu thông tin cần thiết
        HttpSession session = request.getSession();
        session.setAttribute("avatar", user.getAvatar());
        // tạo cookie lưu thông tin token
        Cookie jwtCookie = new Cookie("Authorization", token);
        jwtCookie.setHttpOnly(true);
        jwtCookie.setSecure(true); // chỉ nên dùng khi dùng HTTPS
        jwtCookie.setPath("/");
        response.addCookie(jwtCookie);
        response.sendRedirect(BackToHome);
    }
}
