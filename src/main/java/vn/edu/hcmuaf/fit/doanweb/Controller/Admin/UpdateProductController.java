package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "UpdateProduct", value = "/admin/UpdateProduct")
public class UpdateProductController extends HttpServlet {
    AdminService adminService = new AdminService();
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("categories", adminService.getAllCategory());
        request.setAttribute("brands", adminService.getAllBrand());
        request.setAttribute("frameShapes", adminService.getAllFrameShape());
        request.getRequestDispatcher("/admin/UpdateProduct.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


    }
}