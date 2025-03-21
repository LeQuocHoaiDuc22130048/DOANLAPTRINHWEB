package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class ProductIndex {
    private int id;
    private int categoryId;
    private int brandId;
    private int shapeId;
    private String material;
    private String name;
    private String description;
    private int status;
    private byte hot;
    private double costPrice;
    private double sellingPrice;
    private int quantity;
    private int gender;
    private String color;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private String path_image;
    private List<ProductImage> images;
}
