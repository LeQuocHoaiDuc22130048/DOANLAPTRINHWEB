package vn.edu.hcmuaf.fit.doanweb.Util;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Log;

public class LogSystem {
    private static Log instance;
    private static final Jdbi jdbi = JDBIConnect.get();;
    private final static String InsertLog = "INSERT INTO Log (Level, Log_Time, Locate, user_id, BeforeText, AfterText) " +
            "VALUES (? , NOW(), ?, ?, ?, ?)";
    enum LEVEL {
        INFO,
        ALTER ,
        WARNING ,
        DANGER
    }
    public static void CreateLog(String Level , String locate, int userId, String beforeText, String afterText) {
        jdbi.withHandle(handle ->
                handle.createUpdate(InsertLog)
                        .bind(0, LEVEL.valueOf(Level))
                        .bind(1, locate)
                        .bind(2, userId)
                        .bind(3, beforeText)
                        .bind(4, afterText)
                        .execute()
        );
    }
}
