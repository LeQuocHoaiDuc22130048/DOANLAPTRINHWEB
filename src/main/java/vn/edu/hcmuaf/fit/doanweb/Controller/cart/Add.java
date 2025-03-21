package vn.edu.hcmuaf.fit.doanweb.Controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.Services.ProductService;

import java.io.IOException;

@WebServlet(name = "Add", value = "/add-cart")
public class Add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        int quantity = 1;
        String quantityParam = request.getParameter("quantity");

        if(quantityParam != null || !quantityParam.isEmpty()) {
            quantity = Integer.parseInt(quantityParam);
        }

        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }

        session.setAttribute("cart", c);

        // Trả về số lượng mới cho AJAX
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"cartQuantity\": " + c.getTotalQuantity() + "}");



    }



}