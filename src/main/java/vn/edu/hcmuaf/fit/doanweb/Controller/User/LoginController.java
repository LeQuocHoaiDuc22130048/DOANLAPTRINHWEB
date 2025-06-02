package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;
import vn.edu.hcmuaf.fit.doanweb.Enum.ErrorMessages;
import vn.edu.hcmuaf.fit.doanweb.Enum.JSPPage;
import vn.edu.hcmuaf.fit.doanweb.Util.JwtUtil;


import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private UserDaoImp userDaoImp;
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String realPassword = userDaoImp.GetUserPassword(email);

        if (realPassword == null) {
            // user không tồn tại hoặc chưa có mật khẩu
            request.setAttribute("Error", ErrorMessages.LoginFail.getMessage());
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }

        boolean passwordMatch = false;
        try {
            passwordMatch = BCrypt.checkpw(password, realPassword);
        } catch (Exception e) {
            // log lỗi để kiểm tra nếu hash không đúng định dạng
            e.printStackTrace();
        }

        if (!passwordMatch) {
            System.out.println("Password check result: " + passwordMatch);
            request.setAttribute("Error", ErrorMessages.LoginFail.getMessage());
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }

        User user = userDaoImp.Login(email, realPassword);
        if (user == null) {
            request.setAttribute("Error", ErrorMessages.ActiveMail.getMessage());
            request.getRequestDispatcher(Login).forward(request, response);
            return;
        }
        // tạo token và lưu vào header
        String token = JwtUtil.generateToken(user.getId(), user.getRole(), user.getName());
        response.setContentType("application/json");
        response.setHeader("Authorization", "Bearer " + token);
        // tạo session lưu thông tin cần thiết
        HttpSession session = request.getSession();
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("userId", user.getId());
        session.setAttribute("user", user);

        String tempOrderCode = (String) session.getAttribute("temp_order_code");
        if (tempOrderCode != null) {
            userDaoImp.updateOrderUserId(tempOrderCode, user.getId());
            session.removeAttribute("temp_order_code");
        }

        // tạo cookie lưu thông tin token
        Cookie jwtCookie = new Cookie("Authorization", token);
        jwtCookie.setHttpOnly(true);
        jwtCookie.setSecure(true); // chỉ nên dùng khi dùng HTTPS
        jwtCookie.setPath("/");
        response.addCookie(jwtCookie);

        String location = user.getRole().equals("ADMIN") ? JSPPage.AdminDashBoard.getPage()
                : "/DoAnWeb" + JSPPage.Index.getPage();
        response.sendRedirect(location);
    }
}
