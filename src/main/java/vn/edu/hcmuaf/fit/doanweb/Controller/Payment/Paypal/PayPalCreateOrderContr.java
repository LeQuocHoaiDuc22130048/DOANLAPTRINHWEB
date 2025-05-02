
package vn.edu.hcmuaf.fit.doanweb.Controller.Payment.Paypal;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.Util.ExchangeRate;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet("/create-paypal-order")
public class PayPalCreateOrderContr extends HttpServlet {
    private static final String PAYPAL_API = "https://api-m.sandbox.paypal.com/v2/checkout/orders";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        //totalVND== tong so tien don hang sau khi tru khuyen mai
        String totalVND = req.getParameter("total");
        if (totalVND == null || totalVND.isEmpty()) {
            resp.getWriter().write("{\"status\":\"error\",\"message\":\"Tổng tiền không hợp lệ\"}");
            return;
        }

        session.setAttribute("orderTotal", totalVND);
        session.setAttribute("cart", session.getAttribute("cart"));
        totalVND=totalVND.replace(",", "");
        totalVND=totalVND.replace("đ", "");

        // Lấy tỷ giá USD/VND theo thời gian thực
        double exchangeRate = ExchangeRate.getUSDRate();
        double totalUSD = Double.parseDouble(totalVND) / exchangeRate;

        // Làm tròn đến 2 chữ số thập phân
        totalUSD = Math.round(totalUSD * 100.0) / 100.0;

        String accessToken = PayPalAuthContr.getAccessToken();
        if (accessToken == null) {
            resp.getWriter().write("{\"status\":\"error\",\"message\":\"Không lấy được Access Token\"}");
            return;
        }

        // JSON gửi đến PayPal
        String orderData = "{"
                + "\"intent\":\"CAPTURE\","
                + "\"purchase_units\":[{"
                + "\"amount\":{"
                + "\"currency_code\":\"USD\","
                + "\"value\":\"" + totalUSD + "\""
                + "}}],"
                + "\"application_context\":{"
                + "\"return_url\":\"http://localhost:8080/DoAnWeb_war/Success.jsp\","
                + "\"cancel_url\":\"http://localhost:8080/DoAnWeb_war/Cancel.jsp\""
                + "}"
                + "}";

        //Gửi yêu cầu đến PayPal
        URL url = new URL(PAYPAL_API);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(orderData.getBytes(StandardCharsets.UTF_8));
        }

        //Đọc phản hôi từ PayPal
        InputStream is = conn.getInputStream();
        String responseText = new String(is.readAllBytes(), StandardCharsets.UTF_8);

       // Chuyển JSON phản hồi thành đối tượng JSON
        JsonObject jsonResponse = JsonParser.parseString(responseText).getAsJsonObject();
        String orderId = jsonResponse.get("id").getAsString();

        // Trả về orderId trong JSON phản hồi
        JsonObject jsonResponseClient = new JsonObject();
        jsonResponseClient.addProperty("status", "success");
        jsonResponseClient.addProperty("orderId", orderId);

        //Trả về orderId
        resp.getWriter().write(jsonResponseClient.toString());

    }
}
