package vn.edu.hcmuaf.fit.doanweb.Services;

import vn.edu.hcmuaf.fit.doanweb.DAO.InventoryDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Orders;
import vn.edu.hcmuaf.fit.doanweb.DAO.OrderDaoImp;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.util.List;

public class OrderService {

    //Lưu đơn hang vao database
    public Orders createOrder(String orderCode, String customerName, String phoneNumber, String email,
                              String fullAddress, double subtotal, double totalDiscount,
                              double shippingFee, double totalPrice, int totalQuantity,
                              String paymentMethod, String orderNotes, List<CartProduct> listProducts) {

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

        order.setPayment_method(paymentMethod);

        if (paymentMethod.equals("paypal")) {
            order.setPayment_status(true);
            order.setStatus_order(true);
        } else {
            order.setPayment_status(false);
            order.setStatus_order(false);
        }

        order.setOrder_notes(orderNotes);
        order.setListProducts(listProducts);

        OrderDaoImp orderDao = new OrderDaoImp();
        orderDao.saveOrder(order);

        InventoryDaoImp inventoryDao = new InventoryDaoImp();
        inventoryDao.updateStockAfterOrder(listProducts);

        return order;
    }
}
