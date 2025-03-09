package vn.edu.hcmuaf.fit.doanweb.Controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;

import java.io.IOException;

@WebServlet(name = "Update", value = "/update-cart")
public class Update extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession(false); // Không tạo session mới nếu không tồn tại
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                // Cập nhật số lượng sản phẩm trong giỏ hàng
                cart.update(productId, newQuantity);
                session.setAttribute("cart", cart); // Cập nhật lại session
            }
        }

        // Điều hướng trở lại trang giỏ hàng
//        response.sendRedirect("gio_hang.jsp?update-cart=OK");
        response.sendRedirect(request.getContextPath() + "/gio_hang");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}