package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CategoriesVM {
    private int id;
    private String name;
    private String img;
    private int productCount;
    private byte status;
    private byte hot;
    private LocalDateTime createAt;

    public CategoriesVM(int id, String name, String img, int productCount, byte status, byte hot, LocalDateTime createAt) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.productCount = productCount;
        this.status = status;
        this.hot = hot;
        this.createAt = createAt;
    }
}
