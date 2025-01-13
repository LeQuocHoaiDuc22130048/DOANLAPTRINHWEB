package vn.edu.hcmuaf.fit.doanweb.DAO.Model;


import lombok.Data;
@Data
public class ProductOfMaterial {
    int id;
    String name;
    long price;
    String path;
    String material;
    String color;

    public ProductOfMaterial(int id, String name,long price, String path, String material){
        this.id=id;
        this.price=price;
        this.path=path;
        this.material = material;
    }




}
