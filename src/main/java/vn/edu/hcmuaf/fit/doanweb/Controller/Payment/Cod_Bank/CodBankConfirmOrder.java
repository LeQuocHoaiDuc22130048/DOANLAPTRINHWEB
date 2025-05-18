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

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet("/cod_bank_confirm_order")
public class CodBankConfirmOrder extends HttpServlet {
    private OrderService service = new OrderService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        saveOrderToDB(req);
        resp.getWriter().write("{\"status\":\"success\",\"message\":\"Đơn hàng đã được xác nhận!\"}");
    }

    private void saveOrderToDB(HttpServletRequest req) throws IOException {
        //Lấy thông tin từ session
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Cart cart = (Cart) session.getAttribute("cart");
        Discounts discount = (Discounts) session.getAttribute("discount");

        //thông tin đơn hàng
        String orderCode = "ORD" + System.currentTimeMillis();
        session.setAttribute("orderCode", orderCode);
        session.getAttribute("orderCode");

        User user = (User) session.getAttribute("user");
        Integer userId = null;

        if (user != null) {
            userId = user.getId();
        } else {
            session.setAttribute("temp_order_code", orderCode);
        }

        String customerName = customer.getName();
        String phoneNumber = customer.getPhone();
        String email = customer.getEmail();
        String fullAddress = customer.getAddress();
        double subtotal = cart.getTotalPrices();
        double totalDiscount = cart.getDiscountAmount(discount);
        double shippingFee = (double) session.getAttribute("shippingFee");
        double totalPrice = subtotal - totalDiscount + shippingFee;

        String total= NumberFormat.getInstance(new Locale("vi", "VN")).format(totalPrice) + " đ";
        session.setAttribute("orderTotal", total);
        session.getAttribute("orderTotal");
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
        service.createOrder(orderCode,userId, customerName, phoneNumber, email, fullAddress,
                subtotal, totalDiscount, shippingFee, totalPrice, totalQuantity, paymentMethod,
                orderNotes, listProducts);

    }

}
