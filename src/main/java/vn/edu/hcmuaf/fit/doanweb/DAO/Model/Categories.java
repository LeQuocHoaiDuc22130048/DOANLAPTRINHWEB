package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class Categories {
    private int id;
    private String name;
    private int status;
    private int hot;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    private String title;
    private String img;
    private String description;
    private List<Categories> items;


}
