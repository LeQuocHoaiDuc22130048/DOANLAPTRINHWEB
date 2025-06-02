 package vn.edu.hcmuaf.fit.doanweb.Util;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doanweb.DAO.DB.JDBIConnect;
import vn.edu.hcmuaf.fit.doanweb.DAO.Model.Log;

import java.util.List;

public class LogSystem {
    private static Log instance;
    private static final Jdbi jdbi = JDBIConnect.get();
    ;
    private final static String InsertLog = "INSERT INTO log (Level, Log_Time, Locate, user_id, BeforeText, AfterText) " +
            "VALUES (? , NOW(), ?, ?, ?, ?)";

    enum LEVEL {
        INFO,
        ALTER,
        WARNING,
        DANGER
    }

    public static void CreateLog(String Level, String locate, int userId, String beforeText, String afterText) {
        jdbi.withHandle(handle ->
                handle.createUpdate(InsertLog)
                        .bind(0, LEVEL.valueOf(Level).name())
                        .bind(1, locate)
                        .bind(2, userId)
                        .bind(3, beforeText)
                        .bind(4, afterText)
                        .execute()
        );
    }

    public static List<Log> PrintLog() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT  * FROM log").mapToBean(Log.class)
                        .stream().toList());
    }
}
