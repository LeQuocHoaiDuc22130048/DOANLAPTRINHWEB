package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Discounts {
    private int id;
    private String code;
    private String description;
    private double discountPercentage;
    private int status;
    private double totalDiscount;
    private double totalPrice;
    private String text;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
