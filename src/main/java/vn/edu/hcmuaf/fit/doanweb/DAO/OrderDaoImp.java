package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.util.Map;

public class OrderDaoImp implements OrderDao {
    private Jdbi jdbi = JDBIConnect.get();

    @Override
    public int saveOrder(Orders order) {
        return jdbi.withHandle(handle -> {
            String insertOrderSql = """
                    INSERT INTO orders (order_code, user_id, customer_name, phone_number, customer_email, 
                                        shipping_address, subtotal, total_discount, shipping_fee, 
                                        total_price, total_quantity, payment_method, payment_status, 
                                        status_order, order_notes)
                    VALUES (:orderCode, :userId, :customerName, :phoneNumber, :customerEmail, 
                            :shippingAddress, :subtotal, :totalDiscount, :shippingFee, 
                            :totalPrice, :totalQuantity, :paymentMethod, :paymentStatus, 
                            :statusOrder, :orderNotes)
                    """;

            int orderId = handle.createUpdate(insertOrderSql)
                    .bind("orderCode", order.getOrder_code())
                    .bind("userId", order.getUser_id() != null ? order.getUser_id() : null)
                    .bind("customerName", order.getCustome_name())
                    .bind("phoneNumber", order.getPhone_number())
                    .bind("customerEmail", order.getCustomer_email())
                    .bind("shippingAddress", order.getShipping_address())
                    .bind("subtotal", order.getSubtotal())
                    .bind("totalDiscount", order.getTotal_discount())
                    .bind("shippingFee", order.getShipping_fee())
                    .bind("totalPrice", order.getTotal_price())
                    .bind("totalQuantity", order.getTotal_quantity())
                    .bind("paymentMethod", order.getPayment_method())
                    .bind("paymentStatus", order.isPayment_status())
                    .bind("statusOrder", order.isStatus_order())
                    .bind("orderNotes", order.getOrder_notes() != null ? order.getOrder_notes() : null)
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(Integer.class)
                    .one();

            String insertDetailSql = """
                    INSERT INTO order_details (order_id, product_id, product_name, quantity, price_per_item, total_total) 
                    VALUES (:orderId, :productId, :productName, :quantity, :pricePerItem, :totalPrice)
                    """;

            for (CartProduct product : order.getListProducts()) {
                handle.createUpdate(insertDetailSql)
                        .bind("orderId", orderId)
                        .bind("productId", product.getId())
                        .bind("productName", product.getName())
                        .bind("quantity", product.getQuantity())
                        .bind("pricePerItem", product.getPrice())
                        .bind("totalPrice", product.getQuantity() * product.getPrice())
                        .execute();
            }
            return orderId; // Trả về ID của đơn hàng vừa tạo
        });
    }

}
