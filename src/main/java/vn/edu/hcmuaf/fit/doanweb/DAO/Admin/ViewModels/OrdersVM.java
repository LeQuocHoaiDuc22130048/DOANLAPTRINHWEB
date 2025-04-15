package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrdersVM{
    private int id;
    private int userId;
    private String customerName;
    private String phoneNumber;
    private String email;
    private String shippingAddress;
    private double totalPrice;
    private String paymentMethod;
    private byte paymentStatus;
    private byte orderStatus;
    private String orderNotes;
    private LocalDateTime orderDate;

    public OrdersVM(int id, int userId, String customerName, String phoneNumber, String email, String shippingAddress, double totalPrice, String paymentMethod, byte paymentStatus, byte orderStatus,String orderNotes, LocalDateTime orderDate) {
        this.id = id;
        this.userId = userId;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.shippingAddress = shippingAddress;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.orderStatus = orderStatus;
        this.orderNotes = orderNotes;
        this.orderDate = orderDate;
    }

}
