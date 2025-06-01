package vn.edu.hcmuaf.fit.doanweb.Controller.Payment.Cod_Bank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Customer;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;
import vn.edu.hcmuaf.fit.doanweb.Services.OrderService;
import vn.edu.hcmuaf.fit.doanweb.Util.AjaxResponse;
import vn.edu.hcmuaf.fit.doanweb.Util.CreateOrder;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet("/cod_bank_confirm_order")
public class CodBankConfirmOrder extends HttpServlet {
    private final OrderService service = new OrderService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        saveOrderToDB(req);
        String message = "{\"status\":\"success\",\"message\":\"Đơn hàng đã được xác nhận!\"}";
        AjaxResponse.response(resp, message);
    }

    private void saveOrderToDB(HttpServletRequest req) throws IOException {
        //Lấy thông tin từ session
        HttpSession session = req.getSession();
        //thông tin đơn hàng
        String orderCode = "ORD" + System.currentTimeMillis();
        session.setAttribute("orderCode", orderCode);
        session.getAttribute("orderCode");
        CreateOrder.CreateOrder(session , orderCode , service);


    }

}
