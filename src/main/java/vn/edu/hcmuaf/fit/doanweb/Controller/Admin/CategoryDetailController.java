package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.CategoriesVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "CategoryDetailController", value = "/admin/CategoryDetail")
public class CategoryDetailController extends HttpServlet {
    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            CategoriesVM categoriesVM = adminService.getCategoriesById(categoryId);

            request.setAttribute("categories", categoriesVM);
            request.getRequestDispatcher("Order.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        }

    }

}