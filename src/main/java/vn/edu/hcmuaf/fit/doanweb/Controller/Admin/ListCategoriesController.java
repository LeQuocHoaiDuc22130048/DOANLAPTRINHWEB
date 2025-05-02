package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoriesVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "ListCategoriesController", value = "/admin/Category")
public class ListCategoriesController extends HttpServlet {
    AdminService adminService = new AdminService();
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<CategoriesVM> categoriesVMS = adminService.getAllCategories();
        request.setAttribute("categories", categoriesVMS);
        request.getRequestDispatcher("/admin/ListCategories.jsp").forward(request, response);
    }
}