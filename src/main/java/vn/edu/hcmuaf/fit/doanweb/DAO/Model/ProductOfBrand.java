package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;
@Data
public class ProductOfBrand {

    int id;
    String name;
    long price;
    String path;
    int brand;

    public ProductOfBrand(int id, String name, long price, String path, int brand){
        this.id = id;
        this.name= name;
        this.price = price;
        this.path = path;
        this.brand = brand;
    }


}