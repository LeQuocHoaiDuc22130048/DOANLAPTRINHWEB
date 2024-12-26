package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class OrderDetail {
    private int orderId;
    private int productId;
    private int quantity;
    private double totalPrice;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
