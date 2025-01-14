package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "DeleteOrder", value = "/admin/DeleteOrder")
public class DeleteOrderController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminService adminService = new AdminService();
        String orderIdParam = request.getParameter("orderId");
        if (orderIdParam == null || orderIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID");
            return;
        }
        try {
            int orderId = Integer.parseInt(orderIdParam);
            boolean isDeleted = adminService.deleteOrder(orderId);

            if (isDeleted) {
                response.sendRedirect(request.getContextPath() + "/admin/OrderList");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting order");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
        }
    }
}