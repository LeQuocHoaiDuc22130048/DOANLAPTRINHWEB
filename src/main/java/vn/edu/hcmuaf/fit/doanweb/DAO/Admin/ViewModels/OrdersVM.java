package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class OrdersVM {
    private int orderId;
    private String buyerName;
    private String buyerPhone;
    private String buyerEmail;
    private String buyerAddress;
    private byte paymentStatus;
    private byte orderStatus;
    private LocalDateTime orderTime;

    public OrdersVM(int orderId, String buyerName, String buyerPhone, String buyerEmail, String buyerAddress, byte paymentStatus, byte orderStatus, LocalDateTime orderTime) {
        this.orderId = orderId;
        this.buyerName = buyerName;
        this.buyerPhone = buyerPhone;
        this.buyerEmail = buyerEmail;
        this.buyerAddress = buyerAddress;
        this.paymentStatus = paymentStatus;
        this.orderStatus = orderStatus;
        this.orderTime = orderTime;
    }


}
