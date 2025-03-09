package vn.edu.hcmuaf.fit.doanweb.Controller.Admin;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.Services.Admin.AdminService;

@WebServlet(name = "DeleteProduct", value = "/admin/DeleteProduct")
public class DeleteProductController extends HttpServlet {
    AdminService adminService = new AdminService();
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        int productId = Integer.parseInt(request.getParameter("id"));
        boolean success = adminService.deleteProduct(productId);

        if (success) {
            response.sendRedirect(request.getContextPath() +"/admin/AdminProductList");
        }else {
            request.setAttribute("error", "Có lỗi khi xóa sản phẩm");
            request.getRequestDispatcher("/admin/ProductList.jsp").forward(request, response);
        }
    }
}