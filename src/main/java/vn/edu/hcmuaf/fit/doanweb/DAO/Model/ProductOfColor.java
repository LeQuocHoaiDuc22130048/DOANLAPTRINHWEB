package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;
@Data
public class ProductOfColor {


    int id;
    String name;
    long price;
    String path;
    String color;

    public ProductOfColor(int id, String name, long price, String path, String color){

        this.id = id;
        this.name = name;
        this.price = price;
        this.path = path;
        this.color = color;
    }
}