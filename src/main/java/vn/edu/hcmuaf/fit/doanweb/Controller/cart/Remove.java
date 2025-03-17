package vn.edu.hcmuaf.fit.doanweb.Controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Remove", value = "/remove-cart")
public class Remove extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = -1;

        try {
            id = Integer.parseInt(request.getParameter("id"));

            HttpSession session = request.getSession(true);
            Cart c = (Cart) session.getAttribute("cart");
            if (c == null) c = new Cart();
            c.remove(id);
            session.setAttribute("cart", c);

//            req.getRequestDispatcher("/gio_hang").forward(req, resp);
            response.sendRedirect(request.getContextPath() + "/gio_hang");

        } catch (Exception e) {
//            req.getRequestDispatcher("/gio_hang").forward(req, resp);
            response.sendRedirect(request.getContextPath() + "/gio_hang");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}