package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels.OrdersVM;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "OrderListController", value = "/admin/OrderList")
public class OrderListController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService adminService = new AdminService();
        List<OrdersVM> total = adminService.getAllOrders();
        request.setAttribute("orders", total);
        request.getRequestDispatcher("/admin/OrderList.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}