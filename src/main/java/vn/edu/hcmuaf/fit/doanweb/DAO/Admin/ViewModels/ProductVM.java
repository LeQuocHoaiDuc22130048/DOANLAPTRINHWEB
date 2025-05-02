package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class ProductVM {
    private int id;
    private String productName;
    private String img;
    private String brand;
    private long price;
    private int quantity;

    public ProductVM(int id, String name, String path, String brand, long price, int quantity) {
        this.id = id;
        this.productName = name;
        this.img = path;
        this.brand = brand;
        this.price = price;
        this.quantity = quantity;

    }


}
