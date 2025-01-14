package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;
@Data
public class ProductByShape {


    int id;
    String name;
    long price;
    String path;
    int shape_id;

    public ProductByShape(int id, String name, long price, String path, int shape_id){

        this.id =id;
        this.name=name;
        this.price = price;
        this.path = path;
        this.shape_id=shape_id;

    }
}
