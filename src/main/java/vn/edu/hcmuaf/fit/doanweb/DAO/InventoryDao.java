package vn.edu.hcmuaf.fit.doanweb.DAO;

import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.util.List;
import java.util.Map;

public interface InventoryDao {

    public Map<Integer, Integer> getRealStockQuantityMap();

    public void importFromExcel(String filename);

    public void updateStockAfterOrder(List<CartProduct> listProducts);
}
