package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Brands {
    private int id;
    private String name;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    private String title;
    private String img;
    private String description;
    private String icon;
}
