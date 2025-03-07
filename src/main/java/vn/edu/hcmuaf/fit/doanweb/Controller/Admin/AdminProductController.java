package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.ProductVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AdminController", value = "/admin/AdminProductList")
public class AdminProductController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService service = new AdminService();
        List<ProductVM> products = service.getAllProduct();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/admin/ProductList.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}