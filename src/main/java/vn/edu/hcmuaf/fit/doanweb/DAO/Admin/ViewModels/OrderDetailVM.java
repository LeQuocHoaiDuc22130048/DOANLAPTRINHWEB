package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class OrderDetailVM {
    private int productId;
    private String productImage;
    private String productCode;
    private long sellingPrice;
    private int quantityInOrder;
    private long totalPrice;

    public OrderDetailVM(int productId, String productImage, String productCode, long sellingPrice, int quantityInOrder, long totalPrice) {
        this.productId = productId;
        this.productImage = productImage;
        this.productCode = productCode;
        this.sellingPrice = sellingPrice;
        this.quantityInOrder = quantityInOrder;
        this.totalPrice = totalPrice;
    }
}
