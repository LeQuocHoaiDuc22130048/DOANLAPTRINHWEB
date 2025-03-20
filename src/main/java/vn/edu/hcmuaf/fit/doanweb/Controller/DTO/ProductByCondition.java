package vn.edu.hcmuaf.fit.doanweb.Controller.DTO;

public class ProductByCondition {
    private int id;
    private String name;
    private double price;
    private String path;

    public ProductByCondition(int id, String name, double price, String path) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.path = path;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
