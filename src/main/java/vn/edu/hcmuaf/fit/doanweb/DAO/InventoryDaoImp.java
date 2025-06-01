package vn.edu.hcmuaf.fit.doanweb.DAO;

import org.apache.poi.sl.usermodel.Sheet;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import org.apache.poi.ss.usermodel.*;
import vn.edu.hcmuaf.fit.doanweb.DAO.cart.CartProduct;

import java.io.FileInputStream;
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
        String sql =  """
                    SELECT
                        p.id as product_id,
                        COALESCE(i.stock_quantity, 0) as real_stock_quantity
                    FROM products p
                    LEFT JOIN inventory i ON p.id = i.product_id
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

    @Override
    public void importFromExcel(String filename) {
        System.out.println("importFromExcel trong InventoryDaoImp");
        try (FileInputStream fis = new FileInputStream(filename);
             Workbook workbook = WorkbookFactory.create(fis)) {

            Sheet sheet = (Sheet) workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            rowIterator.next(); // Skip header row

            jdbi.useHandle(handle -> {
                String insertStockSql = """
                    INSERT INTO stock_in (product_id, quantity_added, import_date) 
                    VALUES (:productId, :quantityAdded, :importDate)
                """;

                String updateInventorySql = """
                    INSERT INTO inventory (product_id, stock_quantity, last_updated)
                    VALUES (:productId, :quantity, NOW())
                    ON DUPLICATE KEY UPDATE 
                        stock_quantity = stock_quantity + :quantity,
                        last_updated = NOW()
                """;

                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    int productId = (int) row.getCell(0).getNumericCellValue();
                    int quantityAdded = (int) row.getCell(1).getNumericCellValue();
                    LocalDateTime importDate = LocalDateTime.now();

                    // Insert into stock_in
                    handle.createUpdate(insertStockSql)
                            .bind("productId", productId)
                            .bind("quantityAdded", quantityAdded)
                            .bind("importDate", importDate)
                            .execute();

                    // Update inventory
                    handle.createUpdate(updateInventorySql)
                            .bind("productId", productId)
                            .bind("quantity", quantityAdded)
                            .execute();
                }
            });

            System.out.println("Nhập kho từ Excel thành công!");
        } catch (IOException e) {
            System.err.println("Lỗi khi nhập kho từ Excel: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi nhập kho từ Excel", e);
        }
    }

//    public static void main(String args[]){
//        new InventoryDaoImp().importFromExcel("Stock_in.xlsx");
//    }
}
