package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.OrderDetailVM;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "OrderDetailController", value = "/admin/OrderDetail")
public class OrderDetailController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        AdminService adminService = new AdminService();
        List<OrderDetailVM> rs = adminService.getAllOrderDetail(orderId);
        request.setAttribute("orderDetail", rs);
        request.getRequestDispatcher("/admin/OrderDetail.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}