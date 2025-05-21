package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.OrderDetails;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.util.List;
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
                    .bind("customerName", order.getCustomer_name())
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

    @Override
    public List<Orders> getOrdersByUserId(int userId) {
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, userId)
                        .mapToBean(Orders.class)
                        .list()
        );
    }

    @Override
    public List<OrderDetails> getOrderDetailsByCode(String code) {
        String sql = "SELECT order_details.order_id, " +
                "order_details.product_id, " +
                "order_details.product_name, " +
                "order_details.quantity, " +
                "order_details.price_per_item, " +
                "order_details.total_total AS totalPrice, " +
                "products_images.path AS imagePath " +  // Lấy thêm đường dẫn ảnh
                "FROM orders " +
                "JOIN order_details ON orders.id = order_details.order_id " +
                "JOIN products ON products.id = order_details.product_id " +
                "LEFT JOIN products_images ON products_images.product_id = products.id AND products_images.is_main = 1 " +  // Chỉ join ảnh chính
                "WHERE orders.order_code = ?";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, code)
                        .mapToBean(OrderDetails.class)
                        .list()
        );
    }

}
