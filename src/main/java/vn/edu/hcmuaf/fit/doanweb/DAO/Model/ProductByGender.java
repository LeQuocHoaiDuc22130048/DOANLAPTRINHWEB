package vn.edu.hcmuaf.fit.doanweb.DAO.Model;


import lombok.Data;
@Data
public class ProductByGender {

    int id;
    String name;
    long price;
    String path;
    int gender;

    public ProductByGender(int id, String name, long price, String path, int gender){
        this.id = id;
        this.name= name;
        this.price = price;
        this.path = path;
        this.gender = gender;
    }
}
