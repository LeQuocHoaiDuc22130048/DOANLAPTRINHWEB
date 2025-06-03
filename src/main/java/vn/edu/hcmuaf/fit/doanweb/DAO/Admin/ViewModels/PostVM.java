package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PostVM {
    private int id;
    private String thumbnail;
    private LocalDateTime created_at;
    private String title;
    private String content;
    private String url;
    private int access;
}