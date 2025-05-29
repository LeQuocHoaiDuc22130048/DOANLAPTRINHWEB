package vn.edu.hcmuaf.fit.doanweb.Util;

public class GenerateQuery {
    public static String GetProductBy (String col) {
        return "SELECT p.id, p.name, p.cost_price, pig.path " +
                "FROM products p " +
                "JOIN products_images pig ON pig.product_id = p.id " +
                "WHERE p." + col + " = :value";
    }
    public static String getAllQuery ( String table , String col) {
        return  "SELECT * FROM " + table + " WHERE " + col + " = :"+ col;
    }
}
