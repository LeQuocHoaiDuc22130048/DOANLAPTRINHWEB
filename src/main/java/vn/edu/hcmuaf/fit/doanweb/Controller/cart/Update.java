package vn.edu.hcmuaf.fit.doanweb.Controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.ProductDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;
import vn.edu.hcmuaf.fit.doanweb.Util.AjaxResponse;

import java.io.IOException;

@WebServlet(name = "Update", value = "/update-cart")
public class Update extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        ProductDaoImp productDao = new ProductDaoImp();
        Discounts discount = productDao.getActiveDiscounts();

        double totalPrice = 0;
        double discountAmount = 0;
        double totalAfterDiscount = 0;

        HttpSession session = request.getSession();
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                cart.update(productId, newQuantity);
                session.setAttribute("cart", cart);

                CartProduct product = cart.getProduct(productId);
                totalPrice = (product != null) ? product.getTotalPrice() : 0;

                discountAmount = cart.getDiscountAmount(discount);
                // Tổng giá trị sau khi áp dụng giảm giá
                totalAfterDiscount = cart.getTotalPrices() - discountAmount;

                String message = "{\"totalPrice\": " + totalPrice + ", \"discountAmount\": "
                        + discountAmount + ", \"totalAfterDiscount\": " + totalAfterDiscount + "}";
                // response template
                AjaxResponse.response(response, message);
            }
        }
    }
}