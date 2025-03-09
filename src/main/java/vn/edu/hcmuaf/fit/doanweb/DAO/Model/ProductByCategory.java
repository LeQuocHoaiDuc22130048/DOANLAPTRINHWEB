package vn.edu.hcmuaf.fit.doanweb.DAO.Model;


import lombok.Data;
@Data
public class ProductByCategory {

    int id;
    String name;
    long price;
    String path;
    int category_id;

    public ProductByCategory(int id, String name, long price, String path, int category_id){

        this.id = id;
        this.name= name;
        this.price = price;
        this.path = path;
        this.category_id = category_id;

    }
}
