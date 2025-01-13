package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductImage;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class ProductAddVM {
    private String name;
    private String description;
    private int categoryId;
    private int brandId;
    private int shapeId;
    private double costPrice;
    private double sellingPrice;
    private int status = 1;
    private byte hot = 0;
    private int quantity;
    private String material;
    private String color;
    private int gender;
    private List<ProductImage> images;
    LocalDateTime createdAt;
    LocalDateTime updatedAt;



}
