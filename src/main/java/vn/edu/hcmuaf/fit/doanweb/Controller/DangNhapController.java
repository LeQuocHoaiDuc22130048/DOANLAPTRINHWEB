package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.UsersTypes;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;


import java.io.IOException;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {

    private UserDaoImp userDaoImp =  new UserDaoImp();

    public DangNhapController(){

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        Integer userId = this.userDaoImp.getUserId(userName);

        if(userId==null) {
            request.setAttribute("fail-message", "Bạn chưa tạo tài khoản. Vui lòng chuyển sang trang đăng kí");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            return;
        }

         if (!this.userDaoImp.isAccountActive(userId)) {
            request.setAttribute("fail-message", "Tài khoản chưa được kích hoạt. Vui lòng chuyển sang trang đăng kí để kích hoạt");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        } else if (!this.userDaoImp.isValidUser(userName, password)) {
            request.setAttribute("fail-message", "Mật khẩu hoặc tên đăng nhập không chính xác");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = new User();
            user.setName(userName);
            session.setAttribute("user", user);
            UsersTypes userType = this.userDaoImp.getUserType(userId);
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
