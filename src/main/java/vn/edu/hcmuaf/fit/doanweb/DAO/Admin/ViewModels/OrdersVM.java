package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class OrdersVM {
    private int orderId;
    private String buyerName;
    private String buyerEmail;
    private String buyerPhone;
    private String buyerAddress;
    private LocalDateTime orderDate;
    private int transportStatus;

    public OrdersVM(int orderId, String buyerName, String buyerEmail, String buyerPhone, String buyerAddress, LocalDateTime orderDate, int transportStatus) {
        this.orderId = orderId;
        this.buyerName = buyerName;
        this.buyerEmail = buyerEmail;
        this.buyerPhone = buyerPhone;
        this.buyerAddress = buyerAddress;
        this.orderDate = orderDate;
        this.transportStatus = transportStatus;
    }
}
