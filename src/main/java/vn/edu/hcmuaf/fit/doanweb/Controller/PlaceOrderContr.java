package vn.edu.hcmuaf.fit.doanweb.Controller;

import java.io.*;

import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "PlaceOrderContr", value = "/place-order")
public class PlaceOrderContr extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");  //trả về json

        JsonObject jsonResponse = new JsonObject();

        // Lấy dữ liệu từ form
        String customerName = request.getParameter("customerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String paymentMethod = request.getParameter("payment_method");

        // Kiểm tra dữ liệu có bị thiếu không
        if (customerName == null || customerName.trim().isEmpty() ||
                phoneNumber == null || phoneNumber.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                address == null || address.trim().isEmpty() ||
                city == null || city.trim().isEmpty() ||
                paymentMethod == null || paymentMethod.trim().isEmpty()) {

            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Vui lòng điền đầy đủ thông tin!");
            response.getWriter().write(jsonResponse.toString());
            return;

        }

        // Đặt hàng thành công
        request.getSession().setAttribute("orderSuccess", true);
        System.out.println("Session orderSuccess: " + request.getSession().getAttribute("orderSuccess"));
        jsonResponse.addProperty("status", "success");
        jsonResponse.addProperty("message", "Đặt hàng thành công!");
        response.getWriter().write(jsonResponse.toString());
    }

}