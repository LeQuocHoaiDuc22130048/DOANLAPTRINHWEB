package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

@Data
public class OrderDetails {
    private int order_id;
    private int product_id;
    private String product_name;
    private int quantity;
    private double price_per_item;
    private double totalPrice;
    private String imagePath;
}
