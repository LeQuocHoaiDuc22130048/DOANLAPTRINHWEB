package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class ProductVM {
    private int id;
    private String productName;
    private String img;
    private long price;
    private int quantity;
    private String material;
    private String color;

    public ProductVM(int id, String name, String path, long price, int quantity) {
        this.id = id;
        this.productName = name;
        this.img = path;
        this.price = price;
        this.quantity = quantity;

    }


    public ProductVM(int id, String name, long price, String path) {
        this.id = id;
        this.productName = name;
        this.img = path;
        this.price = price;

    }

    public ProductVM(int id, String name, long price, String path, String color) {
        this.id = id;
        this.productName = name;
        this.img = path;
        this.price = price;
        this.color = color;
    }
}
