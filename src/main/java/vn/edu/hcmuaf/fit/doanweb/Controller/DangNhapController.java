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
    private UserDaoImp userDaoImp = new UserDaoImp();

    public DangNhapController() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra thông tin tài khoản
        Integer userId = userDaoImp.getUserId(userName);

        if (userId == null) {
            request.setAttribute("fail-message", "Bạn chưa tạo tài khoản. Vui lòng chuyển sang trang đăng kí.");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            return;
        }

        if (!userDaoImp.isAccountActive(userId)) {
            request.setAttribute("fail-message", "Tài khoản chưa được kích hoạt. Vui lòng chuyển sang trang đăng kí để kích hoạt.");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            return;
        }

        if (!userDaoImp.isValidUser(userName, password)) {
            request.setAttribute("fail-message", "Mật khẩu hoặc tên đăng nhập không chính xác.");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        User user = new User();
        session.setAttribute("user",user);
        session.setAttribute("username", userName);
        session.setAttribute("password",password);

            // Lấy loại người dùng
            UsersTypes userType = userDaoImp.getUserType(userId);
            if (userType != null) {
                request.setAttribute("success-message", "Đăng nhập thành công");
                if (userType.getUser_type_id() == 1) {
                    request.getRequestDispatcher("admin/admin.html").forward(request, response);
                } else {
                    request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("fail-message", "Không thể xác định loại người dùng.");
                request.getRequestDispatcher("dang_nhap.jsp").forward(request, response);
            }
        }
    }

