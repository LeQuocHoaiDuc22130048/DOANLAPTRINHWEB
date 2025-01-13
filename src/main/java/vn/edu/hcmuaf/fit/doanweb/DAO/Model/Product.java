package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class Product {
    private int id;
    private int categoryId;
    private int brandId;
    private int shapeId;
    private String material;
    private String name;
    private String description;
    private int status;
    private byte hot;
    private double costPrice;
    private double sellingPrice;
    private int quantity;
    private int gender;
    private String color;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;

    public Product(int id, int categoryId, int brandId, int shapeId, String material, String name, String description, int status, byte hot, double costPrice, double sellingPrice, int quantity, int gender, String color, LocalDateTime createAt, LocalDateTime updateAt) {
        this.id = id;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.shapeId = shapeId;
        this.material = material;
        this.name = name;
        this.description = description;
        this.status = status;
        this.hot = hot;
        this.costPrice = costPrice;
        this.sellingPrice = sellingPrice;
        this.quantity = quantity;
        this.gender = gender;
        this.color = color;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }
}
