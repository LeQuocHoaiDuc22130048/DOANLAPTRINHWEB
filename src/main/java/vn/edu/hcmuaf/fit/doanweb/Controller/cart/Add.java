package vn.edu.hcmuaf.fit.doanweb.Controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoInterface;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;

import java.io.IOException;

@WebServlet(name = "Add", value = "/add-cart")
public class Add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDaoInterface dao = new ProductDaoImp();
        ProductIndex product = dao.getProductById(Integer.parseInt(request.getParameter("id")));
        int quantity = 1;
        String quantityParam = request.getParameter("quantity");

        if(quantityParam != null && !quantityParam.isEmpty()) {
            quantity = Integer.parseInt(quantityParam);
        }

        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }

        c.add(product,quantity);
        session.setAttribute("cart", c);

        // Trả về số lượng mới cho AJAX
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"cartQuantity\": " + c.getTotalQuantity() + "}");
        response.getWriter().flush();  // Đảm bảo dữ liệu được gửi đi
        response.getWriter().close();  // Đóng stream để tránh lỗi

    }



}