package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class FeedBacks {
    private int id;
    private String name;
    private String email;
    private String message;
    private String response;
    private byte status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
