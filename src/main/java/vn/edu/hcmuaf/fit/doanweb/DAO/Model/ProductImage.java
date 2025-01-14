package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class ProductImage {
    private int id;
    private int productId;
    private int isMain;
    private String path;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
