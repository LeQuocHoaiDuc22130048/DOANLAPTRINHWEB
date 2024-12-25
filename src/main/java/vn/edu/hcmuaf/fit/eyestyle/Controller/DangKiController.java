package vn.edu.hcmuaf.fit.eyestyle.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.eyestyle.DAO.UserDao;

import java.io.IOException;

@WebServlet(name = "DangKiController", value = "/sign-in")
public class DangKiController extends HttpServlet {

    private UserDao userDao = new UserDao();

    public DangKiController(){

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Integer userId = userDao.getUserId(userName);

        if(userId!=null&&userDao.isAccountActive(userId)&& userDao.isValidUser(userName,password)){
            request.setAttribute("fail-message", "Tài khoản đã được kích hoạt. Vui lòng chuyển sang trang đăng nhập");
            request.getRequestDispatcher("dang_ki.jsp").forward(request,response);
            return;
        }

        // nếu tài khoản chưa kích hoạt thì thực hiện kích hoạt tài khoản

        if(userId!=null&&!userDao.isAccountActive(userId)){
            boolean active = userDao.activeAccount(userId);
            if(active){
                request.setAttribute("success-message" ,"Tài khoản đã đăng kí thành công. Vui lòng đăng nhập");
                request.getRequestDispatcher("dang_ki.jsp").forward(request,response);
            }else{
                request.setAttribute("fail-message", "Kích hoạt tài khoản thất bại. Vui lòng thử lại");
                request.getRequestDispatcher("dang_ki.jsp").forward(request,response);

            }
        }

        if(userId==null&&userDao.isNewUser(userName,password)){

            Integer add = userDao.addUser(userName,email,password,null,null);
            if(add!=null){
                request.setAttribute("success-message" ,"Tài khoản đã đăng kí thành công. Vui lòng đăng nhập");
                request.getRequestDispatcher("dang_ki.jsp").forward(request,response);
            }else{
                request.setAttribute("fail-message", "Đăng kí không thành công. Vui lòng thử lại");
                request.getRequestDispatcher("dang_ki.jsp").forward(request,response);
            }

        }





    }
}
