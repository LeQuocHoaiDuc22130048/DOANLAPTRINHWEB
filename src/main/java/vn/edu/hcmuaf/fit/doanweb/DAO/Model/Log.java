package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;

@Data
public class Log {
    private int Id;
    private String Level ;
    private LocalDateTime Log_Time ;
    private String Locate ;
    private int UserId;
    private String BeforeText ;
    private String AfterText ;
}
