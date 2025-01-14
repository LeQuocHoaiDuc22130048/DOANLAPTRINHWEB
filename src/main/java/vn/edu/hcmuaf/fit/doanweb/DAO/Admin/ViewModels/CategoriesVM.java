package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class CategoriesVM {
    private int id;
    private String name;
    private int status;
    private int productCount;

    public CategoriesVM(int id, String name, int status, int productCount) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.productCount = productCount;
    }
}
