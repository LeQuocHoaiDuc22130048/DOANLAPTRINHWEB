package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "AddPromotionController", value = "/admin/AddPromotion")
public class AddPromotionController extends HttpServlet {
    AdminService adminService = new AdminService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code = request.getParameter("code");
        double percent = Double.parseDouble(request.getParameter("percent"));
        int status = Integer.parseInt(request.getParameter("status"));
        String description = request.getParameter("description");

        Discounts discounts = new Discounts();
        discounts.setCode(code);
        discounts.setDiscountPercentage(percent);
        discounts.setStatus(status);
        discounts.setDescription(description);

        if (adminService.addDiscount(discounts)) {
            response.sendRedirect(request.getContextPath() + "/admin/PromotionList");
        }else{
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding discount");
        }
    }
}