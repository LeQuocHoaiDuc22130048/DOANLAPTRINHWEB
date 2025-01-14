package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "DeleteCategoryController", value = "/admin/DeleteCategory")
public class DeleteCategoryController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        AdminService adminService = new AdminService();
        if(adminService.deleteCategory(categoryId)) {
            response.sendRedirect(request.getContextPath() + "/admin/ListCategories");
        }else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
        }
    }
}