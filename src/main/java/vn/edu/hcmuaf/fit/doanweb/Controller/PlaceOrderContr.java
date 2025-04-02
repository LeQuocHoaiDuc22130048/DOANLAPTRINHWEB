package vn.edu.hcmuaf.fit.doanweb.Controller;

import java.io.*;

import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Customer;

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
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String addressDetail = request.getParameter("addressDetail");
        String paymentMethod = request.getParameter("payment_method");
        String specialRequests= request.getParameter("specialRequests");

        HttpSession session = request.getSession();
        double shippingFee = Double.parseDouble(request.getParameter("shippingFee"));
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("payment_method", paymentMethod);
        String fullAddress = addressDetail + ", " + ward + ", " + district + ", " + city;
        Customer customer = new Customer(customerName, phoneNumber, email, fullAddress);
        session.setAttribute("customer", customer);
        session.setAttribute("note", specialRequests);

        // Kiểm tra dữ liệu có bị thiếu không
        if (isEmpty(customerName) || isEmpty(phoneNumber) || isEmpty(email) ||
                isEmpty(city) || isEmpty(district) || isEmpty(ward) || isEmpty(addressDetail)) {

            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Vui lòng điền đầy đủ thông tin!");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        // Kiểm tra email hợp lệ
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Email không hợp lệ!");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        // Đặt hàng thành công
        jsonResponse.addProperty("status", "success");
        response.getWriter().write(jsonResponse.toString());
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

}