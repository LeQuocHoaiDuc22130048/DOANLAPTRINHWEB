package vn.edu.hcmuaf.fit.doanweb.Controller.Payment;

import java.io.*;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.InventoryDao;
import vn.edu.hcmuaf.fit.doanweb.DAO.InventoryDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Customer;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

@WebServlet(name = "PlaceOrderContr", value = "/place-order")
public class PlaceOrderContr extends HttpServlet {
    InventoryDao dao= new InventoryDaoImp();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");  //trả về json

        JsonObject jsonResponse = new JsonObject();
        HttpSession session = request.getSession();

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

        // Lưu thông tin khách hàng vào session
        session.setAttribute("customerName", customerName);
        session.setAttribute("phoneNumber", phoneNumber);
        session.setAttribute("email", email);
        session.setAttribute("addressDetail", addressDetail);
        session.setAttribute("note", specialRequests);

        double shippingFee = Double.parseDouble(request.getParameter("shippingFee"));
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("payment_method", paymentMethod);
        String fullAddress = addressDetail + ", " + ward + ", " + district + ", " + city;
        Customer customer = new Customer(customerName, phoneNumber, email, fullAddress);
        session.setAttribute("customer", customer);

        // Kiểm tra dữ liệu có bị thiếu không
        if (isEmpty(customerName) || isEmpty(phoneNumber) || isEmpty(email) ||
                isEmpty(city) || isEmpty(district) || isEmpty(ward) || isEmpty(addressDetail)) {

            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Vui lòng điền đầy đủ thông tin!");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        //Kiem tra phone hợp lệ
        if( !phoneNumber.matches("^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-9])|(9[0-46-9]))(\\d){7}$")){
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message","Số điện thoại không hợp lệ!");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        // Kiểm tra email hợp lệ
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message","Email không hợp lệ!");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        //Check có đủ hàng trong kho không ?
        Cart cart= (Cart) session.getAttribute("cart");
        List<CartProduct> listProducts= cart.getList();
        Map<Integer, Integer> stockMap = dao.getRealStockQuantityMap();
        for (CartProduct cartProduct : listProducts) {
            int productId = cartProduct.getId();
            int orderQuantity = cartProduct.getQuantity();
            int stockQuantity = stockMap.getOrDefault(productId, 0);

            if (orderQuantity > stockQuantity) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Sản phẩm '" + cartProduct.getName() + "' hết hàng!");
                response.getWriter().write(jsonResponse.toString());
                return;
            }
        }


        // Đặt hàng thành công
        jsonResponse.addProperty("status", "success");
        response.getWriter().write(jsonResponse.toString());

        session.removeAttribute("customerName");
        session.removeAttribute("phoneNumber");
        session.removeAttribute("email");
        session.removeAttribute("addressDetail");
        session.removeAttribute("specialRequests");

    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

}