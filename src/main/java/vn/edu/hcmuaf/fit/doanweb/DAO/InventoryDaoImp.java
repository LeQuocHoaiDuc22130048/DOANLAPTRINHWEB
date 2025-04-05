package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import org.apache.poi.ss.usermodel.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class InventoryDaoImp implements InventoryDao {
    private Jdbi jdbi = JDBIConnect.get();

    @Override
    public Map<Integer, Integer> getRealStockQuantityMap() {
        String sql = """
                    SELECT 
                        s.product_id,
                        COALESCE(SUM(s.quantity_added), 0) - 
                        COALESCE(SUM(CASE WHEN o.status_order != 0 THEN od.quantity ELSE 0 END), 0) 
                        AS real_stock_quantity
                    FROM stock_in s
                    LEFT JOIN order_details od ON s.product_id = od.product_id
                    LEFT JOIN orders o ON od.order_id = o.id
                    GROUP BY s.product_id
                """;

        List<Map<String, Object>> rows = jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToMap()
                        .list()
        );

        Map<Integer, Integer> stockMap = new HashMap<>();
        for (Map<String, Object> row : rows) {
            Integer productId = ((Number) row.get("product_id")).intValue();
            Integer quantity = ((Number) row.get("real_stock_quantity")).intValue();
            stockMap.put(productId, quantity);
        }

        return stockMap;
    }

    @Override
    public void updateStockAfterOrder(List<CartProduct> listProducts) {
        String sql = """
                    UPDATE inventory 
                    SET stock_quantity = stock_quantity - :orderQty,
                        last_updated = NOW()
                    WHERE product_id = :productId
                """;

        jdbi.useHandle(handle -> {
            for (CartProduct product : listProducts) {
                int productId = product.getId();
                int quantity = product.getQuantity();

                handle.createUpdate(sql)
                        .bind("orderQty", quantity)
                        .bind("productId", productId)
                        .execute();
            }
        });
    }


    //Nhập hàng từ file excel
    public void importFromExcel(String filename) {
        try {
            InputStream is = InventoryDaoImp.class.getClassLoader().getResourceAsStream(filename);
            Workbook workbook = new XSSFWorkbook(is);

            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            rowIterator.next(); // bỏ qua header

            jdbi.useHandle(handle -> {
                String sql = "INSERT INTO stock_in (product_id, quantity_added, import_date) VALUES (:productId, :quantityAdded, :importDate)";

                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    int productId = (int) row.getCell(0).getNumericCellValue();
                    int quantityAdded = (int) row.getCell(1).getNumericCellValue();
                    LocalDateTime importDate = LocalDateTime.now();

                    handle.createUpdate(sql)
                            .bind("productId", productId)
                            .bind("quantityAdded", quantityAdded)
                            .bind("importDate", importDate)
                            .execute();
                }
            });

            System.out.println("Nhập kho từ Excel thành công!");
        } catch (IOException e) {
            System.err.println("Lỗi khi nhập kho từ Excel: " + e.getMessage());
            e.printStackTrace();
        }
    }

//    public static void main(String args[]){
//        new InventoryDaoImp().importFromExcel("Stock_in.xlsx");
//    }
}
