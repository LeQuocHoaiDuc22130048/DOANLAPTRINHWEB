package vn.edu.hcmuaf.fit.doanweb.DAO.cart;

import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Discounts;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Product;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.ProductIndex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart {

    Map<Integer, CartProduct> data = new HashMap<>();

    public boolean add(ProductIndex product) {
        if (data.containsKey(product.getId())) {
            update(product.getId(), data.get(product.getId()).getQuantity() + 1);
            return true;
        }

        data.put(product.getId(), convert(product));
        return true;
    }

    public boolean update(int id, int quantity) {
        if (!data.containsKey(id)) return false;
        data.get(id).setQuantity(quantity);
        return true;
    }

    public boolean remove(int id) {
        return data.remove(id) != null;
    }

    public List<CartProduct> getList() {
        return new ArrayList<>(data.values());
    }

    public int getTotalQuantity() {
        AtomicInteger i = new AtomicInteger();
        data.forEach((k, v) -> i.addAndGet(v.getQuantity()));
        return i.get();
    }

    public Double getTotalPrices() {
        AtomicReference<Double> i = new AtomicReference<>(0.0);
        data.forEach((k, v) -> {
            i.updateAndGet(v1 -> (double) (v1 + v.getTotalPrice()));
        });
        return i.get();
    }

    private CartProduct convert(ProductIndex product) {
        CartProduct cp = new CartProduct();
        cp.setId(product.getId());
        cp.setPrice(product.getSellingPrice());
        cp.setQuantity(1);
        cp.setName(product.getName());
        cp.setPath_img(product.getPath_image());

        return cp;
    }

    // Phương thức tính số tiền giảm giá
    public double getDiscountAmount(Discounts discount) {
        double totalPrices = getTotalPrices(); // Lấy tổng giá trị giỏ hàng

        if (discount == null) return 0.0; // Nếu không có mã giảm giá thì trả về 0

        double discountAmount = totalPrices * (discount.getDiscountPercentage() / 100);

        // Đảm bảo số tiền giảm giá không vượt quá tổng giá trị giỏ hàng
        if (discountAmount > totalPrices) {
            discountAmount = totalPrices;
        }

        return discountAmount;
    }


}