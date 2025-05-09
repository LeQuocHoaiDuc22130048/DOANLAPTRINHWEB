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

    public Discounts(int id, String code, String description, double discountPercentage, int status) {
        this.id = id;
        this.code = code;
        this.description = description;
        this.discountPercentage = discountPercentage;
        this.status = status;
    }
    public Discounts(){}
}
