package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class Orders {
        private String order_code;
        private Integer user_id;  // Có thể để null nếu không có user liên kết
        private String custome_name;
        private String phone_number;
        private String customer_email;
        private String shipping_address;
        private double subtotal;
        private double total_discount;
        private double shipping_fee;
        private double total_price;
        private int total_quantity;
        private String payment_method;
        private boolean payment_status; // 0: chưa thanh toán, 1: đã thanh toán
        private boolean status_order;   // 0: Cancel, 1: Done
        private String order_notes;
        private List<CartProduct> listProducts;

}
