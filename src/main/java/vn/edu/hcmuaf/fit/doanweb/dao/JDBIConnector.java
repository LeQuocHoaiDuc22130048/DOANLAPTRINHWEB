package vn.edu.hcmuaf.fit.doanweb.dao;

import org.jdbi.v3.core.Jdbi;

public class JDBIConnector {

    public static Jdbi jdbi;
    public  static HikariDataSource dataSource;
    public static Jdbi getJdbi(){
        if(jdbi==null){
            connect();
        }
        return jdbi;
    }
    public static void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            HikariConfig hikari = new HikariConfig();
            //url: jdbc:mysql://localhost:3306/ten database
            hikari.setJdbcUrl("jdbc:mysql://" + Property.HOST + ":" + Property.PORT + "/" + Property.DBNAME);
            hikari.setUsername(Property.USER);
            hikari.setPassword(Property.PASSWORD);


            hikari.setMaximumPoolSize(10);
            hikari.setMinimumIdle(1);
            hikari.setIdleTimeout(30000); // Thời gian chờ trước khi đóng kết nối nhàn rỗi (ms)
            hikari.setMaxLifetime(1800000); // Thời gian sống tối đa của kết nối (ms)
            hikari.setConnectionTimeout(20000); // thời gian chờ kết nối
            dataSource = new HikariDataSource(hikari);
            jdbi = Jdbi.create(dataSource);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found.", e);
        }
    }

    public static void close() {
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
        }
    }

    public static void main(String[] args) {


    }



}