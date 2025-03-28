package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Orders {
    private int id;
    private double price;
    private int userId;
    private int totalQuantity;
    private int statusPayment;
    private int statusTransport;
    private int discountId;
    private long totalDiscount;
    private long totalPrice;
    private String note;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;
}
