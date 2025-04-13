package vn.edu.hcmuaf.fit.doanweb.Controller.Payment;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.InventoryDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Customer;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

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

        saveOrderTODB(req,jsonResponse);
        resp.getWriter().write("{\"status\":\"success\",\"message\":\"Đơn hàng đã được xác nhận!\"}");
    }

    private void saveOrderTODB(HttpServletRequest req, JsonObject jsonResponse) {
        //Lấy thông tin từ session
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Cart cart = (Cart) session.getAttribute("cart");
        Discounts discount = (Discounts) session.getAttribute("discount");

        // Lấy thông tin đơn hàng từ PayPal
        String orderCode = jsonResponse.get("id").getAsString();  // order_id từ PayPal
        String totalVND= (String) session.getAttribute("orderTotal");
        totalVND=totalVND.replace(",", "");
        totalVND=totalVND.replace("đ", "");
        double totalPrice= Double.parseDouble(totalVND);
        String customerName = customer.getName();
        String phoneNumber = customer.getPhone();
        String email = customer.getEmail();
        String fullAddress = customer.getAddress();
        double subtotal = cart.getTotalPrices();
        double totalDiscount = cart.getDiscountAmount(discount);
        double shippingFee = (double) session.getAttribute("shippingFee");
        int totalQuantity = cart.getTotalQuantity();
        String paymentMethod = (String) session.getAttribute("payment_method");
        String orderNotes = (String) session.getAttribute("note");

        // Tạo danh sách sản phẩm từ cart và thêm vào listProducts
        List<CartProduct> listProducts = new ArrayList<>();
        for (CartProduct cartProduct : cart.getList()) {
            CartProduct product = new CartProduct();
            product.setId(cartProduct.getId());
            product.setName(cartProduct.getName());
            product.setQuantity(cartProduct.getQuantity());
            product.setPrice(cartProduct.getPrice());
            product.setPath_img(cartProduct.getPath_img());
            listProducts.add(product);
        }

        // Lưu đơn hàng vào cơ sở dữ liệu
        OrderDaoImp orderDao = new OrderDaoImp();
        Orders order = new Orders();
        order.setOrder_code(orderCode);
        order.setCustome_name(customerName);
        order.setPhone_number(phoneNumber);
        order.setCustomer_email(email);
        order.setShipping_address(fullAddress);
        order.setSubtotal(subtotal);
        order.setTotal_discount(totalDiscount);
        order.setShipping_fee(shippingFee);
        order.setTotal_price(totalPrice);
        order.setTotal_quantity(totalQuantity);
        order.setPayment_method(paymentMethod);
        order.setPayment_status(true);
        order.setStatus_order(true);
        order.setOrder_notes(orderNotes);
        order.setListProducts(listProducts);
        orderDao.saveOrder(order);

        InventoryDaoImp inventoryDao = new InventoryDaoImp();
        inventoryDao.updateStockAfterOrder(listProducts);  //update kho hàng

        session.removeAttribute("cart");
    }


}