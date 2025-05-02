package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class NewsletterSubscriber {
    private int id;
    private String name;
    private String email;
    private LocalDateTime created_at;
}
