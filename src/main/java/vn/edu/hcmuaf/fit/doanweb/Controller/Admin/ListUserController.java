package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "ListUserController", value = "/admin/User")
public class ListUserController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService service = new AdminService();
        List<User> users = service.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/ListUser.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}