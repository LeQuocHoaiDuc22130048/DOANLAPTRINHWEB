package vn.edu.hcmuaf.fit.doanweb.Util;

import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Customer;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.User;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.Cart;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;
import vn.edu.hcmuaf.fit.doanweb.Services.OrderService;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class CreateOrder {
    public static void CreateOrder(HttpSession session , String  orderCode , OrderService service) {
        Customer customer = (Customer) session.getAttribute("customer");
        Cart cart = (Cart) session.getAttribute("cart");
        Discounts discount = (Discounts) session.getAttribute("discount");



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
        service.createOrder(orderCode,userId, customerName, phoneNumber, email, fullAddress, subtotal, totalDiscount, shippingFee, totalPrice,
                totalQuantity, paymentMethod, orderNotes, listProducts);

    }
}
