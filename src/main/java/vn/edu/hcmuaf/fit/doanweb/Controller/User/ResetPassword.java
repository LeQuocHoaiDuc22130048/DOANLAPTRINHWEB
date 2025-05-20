package vn.edu.hcmuaf.fit.doanweb.Controller.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.UserDaoImp;

import java.io.IOException;

@WebServlet(name = "ResetPassword", value = "/ResetPassword")
public class ResetPassword extends HttpServlet {
    private UserDaoImp userDaoImp= new UserDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

    String email = session.getAttribute("email").toString();
    String newPassword = request.getParameter("newPassword");
    if(!userDaoImp.isUpdatePassword(email , newPassword)){
        request.setAttribute("Error" , "Update password fail");
        request.getRequestDispatcher("DoAnWeb/ResetPassword.jsp").forward(request , response);
    }
    else{
        request.setAttribute("Success" , "Update password success");
        request.getRequestDispatcher("DoAnWeb/login.jsp").forward(request , response);
    }
    }
}
