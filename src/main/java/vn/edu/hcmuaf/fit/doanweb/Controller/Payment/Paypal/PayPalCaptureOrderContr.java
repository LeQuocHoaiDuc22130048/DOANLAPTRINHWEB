package vn.edu.hcmuaf.fit.doanweb.Controller.Payment.Paypal;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
import vn.edu.hcmuaf.fit.doanweb.Util.CreateOrder;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/capture-paypal-order")
public class PayPalCaptureOrderContr extends HttpServlet {
    private static final String PAYPAL_API = "https://api-m.sandbox.paypal.com/v2/checkout/orders/";
    private OrderService service = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Lấy orderId từ URL
        String orderId = req.getParameter("token");
        if (orderId == null || orderId.isEmpty()) {
            resp.getWriter().write("{\"status\":\"error\",\"message\":\"Mã đơn hàng không hợp lệ!\"}");
            return;
        }

        // Gửi yêu cầu xác nhận thanh toán đến PayPal
        String accessToken = PayPalAuthContr.getAccessToken();
        URL url = new URL(PAYPAL_API + orderId);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        conn.setRequestProperty("Content-Type", "application/json");

        // Đọc phản hồi từ PayPal
        InputStream is = conn.getInputStream();
        String responseText = new String(is.readAllBytes(), StandardCharsets.UTF_8);
        JsonObject jsonResponse = JsonParser.parseString(responseText).getAsJsonObject();

        // Kiểm tra trạng thái đơn hàng
        String status = jsonResponse.get("status").getAsString();
        if (!"APPROVED".equals(status) && !"COMPLETED".equals(status)) {
            resp.getWriter().write("{\"status\":\"error\",\"message\":\"Thanh toán chưa hoàn tất!\"}");
            return;
        }

        saveOrderTODB(req, jsonResponse);
        resp.getWriter().write("{\"status\":\"success\",\"message\":\"Đơn hàng đã được xác nhận!\"}");
    }

    private void saveOrderTODB(HttpServletRequest req, JsonObject jsonResponse) {
        //Lấy thông tin từ session
        HttpSession session = req.getSession();
        //thông tin đơn hàng
        String orderCode = jsonResponse.get("id").getAsString();  // Mã đơn từ PayPal
        CreateOrder.CreateOrder(session , orderCode , service);
        session.removeAttribute("cart");
    }


}