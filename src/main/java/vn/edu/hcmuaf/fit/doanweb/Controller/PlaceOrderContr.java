package vn.edu.hcmuaf.fit.doanweb.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name= "Order" , value="/place-order")
public class PlaceOrderContr extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String customerName = request.getParameter("customerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String paymentMethod = request.getParameter("payment_method");

        // Kiểm tra dữ liệu
//        if (customerName == null || phoneNumber == null || email == null || address == null || city == null || paymentMethod == null) {
//         System.out.println("err");
////            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
////            response.sendRedirect(request.getContextPath()+"/gio_hang");
//            return;
//        }

        request.getSession().setAttribute("orderSuccess", true);
        response.sendRedirect("gio_hang.jsp");

    }
}
