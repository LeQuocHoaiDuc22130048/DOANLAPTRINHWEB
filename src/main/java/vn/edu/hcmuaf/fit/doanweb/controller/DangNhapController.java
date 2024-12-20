package vn.edu.hcmuaf.fit.doanweb.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.dao.JDBIConnector;
import vn.edu.hcmuaf.fit.doanweb.dao.UserDao;
import vn.edu.hcmuaf.fit.doanweb.model.User;
import vn.edu.hcmuaf.fit.doanweb.model.UsersTypes;

import java.io.IOException;

@WebServlet(name = "DangNhapController", value = "/login")
public class DangNhapController extends HttpServlet {
    private UserDao userDao ;


    public DangNhapController() {
        // Khởi tạo UserDao với JDBI
        userDao = new UserDao();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // kiểm tra xem người đăng nhập có tài khoản chưa

        int userId=userDao.getUserId(userName);

        if(!userDao.isAccountActive(userId)){ // chưa có tài khoản
            request.setAttribute("fail-message", "Tài khoản chưa được kích hoạt");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request,response);
            return;
        }

        if(!userDao.isValidUser(userName,password)){
            request.setAttribute("fail-message", "Mật khẩu hoặc tên đăng nhập không chính xác");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request,response);
            return;
        }

        // đăng nhập thanhf công
        HttpSession session = request.getSession();
        User user = new User();
        user.setName(userName);

        session.setAttribute("user",user);
        UsersTypes userType = userDao.getUserType(userId);

        if(userType!=null){
            request.setAttribute("success-message","Đăng nhập thành công");
            if(userType.getUser_type_id()==1){
                response.sendRedirect("admin/admin.html");

            }else{

                response.sendRedirect("index.jsp");
            }

        }else{
            request.setAttribute("fail-message","Không thể xác định được người dùng");
            request.getRequestDispatcher("dang_nhap.jsp").forward(request,response);
        }


            }
        }


