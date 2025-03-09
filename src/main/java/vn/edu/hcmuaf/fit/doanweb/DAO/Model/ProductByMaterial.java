package vn.edu.hcmuaf.fit.doanweb.DAO.Model;


import lombok.Data;
@Data
public class ProductByMaterial {
    int id;
    String name;
    long price;
    String path;
    String material;

    public ProductByMaterial(int id, String name,long price, String path, String material){
        this.id=id;
        this.price=price;
        this.path=path;
        this.material = material;
    }




}
