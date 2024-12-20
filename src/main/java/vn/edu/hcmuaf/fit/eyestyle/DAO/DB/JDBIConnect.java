package vn.edu.hcmuaf.fit.eyestyle.DAO.DB;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.eyestyle.DAO.Model.BrandsModel;

import java.sql.SQLException;
import java.util.List;

public class JDBIConnect {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    static Jdbi jdbi;

    public static Jdbi get(){
        if (jdbi == null){
            makeConnect();
        }
        return jdbi;
    }

    private static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL(url);
        dataSource.setUser(DBProperties.user());
        dataSource.setPassword(DBProperties.password());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);
    }

    public static void main(String[] args) {

    }
}
