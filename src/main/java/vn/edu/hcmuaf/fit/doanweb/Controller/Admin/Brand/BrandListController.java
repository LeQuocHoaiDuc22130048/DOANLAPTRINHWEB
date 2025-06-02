package vn.edu.hcmuaf.fit.doanweb.Controller.Admin.Brand;import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Brands;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "BrandListController", value = "/admin/Brand")
public class BrandListController extends HttpServlet {
    private AdminService adminService = new AdminService();
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Brands> brands = adminService.getAllBrands();
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("Brand.jsp").forward(request, response);
    }

}