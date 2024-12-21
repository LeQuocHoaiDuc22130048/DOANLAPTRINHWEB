package vn.edu.hcmuaf.fit.eyestyle.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.User;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.Users_Types;
import vn.edu.hcmuaf.fit.eyestyle.DAO.UserDao;

import java.io.IOException;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {

    private UserDao userDao=  new UserDao();

    public DangNhapController(){

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        Integer userId = this.userDao.getUserId(userName);

        if(userDao.isNewUser(userName,password)&&userId==null) {
            request.setAttribute("fail-message", "Bạn chưa tạo tài khoản. Vui lòng chuyển sang trang đăng kí");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            return;
        }

         if (!this.userDao.isAccountActive(userId)) {
            request.setAttribute("fail-message", "Tài khoản chưa được kích hoạt");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        } else if (!this.userDao.isValidUser(userName, password)) {
            request.setAttribute("fail-message", "Mật khẩu hoặc tên đăng nhập không chính xác");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = new User();
            user.setName(userName);
            session.setAttribute("user", user);
            Users_Types userType = this.userDao.getUserType(userId);
            if (userType != null) {
                request.setAttribute("success-message", "Đăng nhập thành công");
                if (userType.getUser_type_id() == 1) {
                    response.sendRedirect("admin/admin.html");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("fail-message", "Không thể xác định loại người dùng");
                request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            }

        }

    }
}
