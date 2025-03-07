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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductService productService = new ProductService();
        ProductIndex product = productService.getProductById(Integer.parseInt(request.getParameter("id")));

        if (product == null) {
            response.sendRedirect("index");
        }

        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
        }

        assert product != null;
        c.add(product);
        session.setAttribute("cart", c);

        response.sendRedirect("index");

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}