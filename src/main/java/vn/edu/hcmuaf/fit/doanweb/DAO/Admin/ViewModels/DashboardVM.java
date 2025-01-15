package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class DashboardVM {
    private int id;
    private String name;
    private String brand;
    private String path;
    private int amount;

    public DashboardVM(int productId, String productName, String brandName, String img, int totalSold) {
        this.id = productId;
        this.name = productName;
        this.brand = brandName;
        this.path = img;
        this.amount = totalSold;

    }
}
