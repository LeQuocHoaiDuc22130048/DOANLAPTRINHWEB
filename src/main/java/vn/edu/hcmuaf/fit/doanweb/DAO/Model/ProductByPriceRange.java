package vn.edu.hcmuaf.fit.doanweb.DAO.Model;


import lombok.Data;
@Data
public class ProductByPriceRange {

    int id;
    String name;
    long price;
    String path;

    public ProductByPriceRange(int id, String name, long price, String path){

        this.id = id;
        this.name=name;
        this.price=price;
        this.path = path;
    }
}
