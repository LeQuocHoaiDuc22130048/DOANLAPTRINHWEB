package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class OrderItemVM {
    private int orderId;
    private int productId;
    private String productImage;
    private String productCode;
    private String brandImage;
    private long sellingPrice;
    private int quantityInOrder;
    private long totalDiscount;
    private long totalPrice;

    public OrderItemVM(int orderId, int productId, String productImage, String productCode, String brandImage, long sellingPrice, int quantityInOrder, long totalDiscount, long totalPrice) {
        this.orderId = orderId;
        this.productId = productId;
        this.productImage = productImage;
        this.productCode = productCode;
        this.brandImage = brandImage;
        this.sellingPrice = sellingPrice;
        this.quantityInOrder = quantityInOrder;
        this.totalDiscount = totalDiscount;
        this.totalPrice = totalPrice;
    }
}
