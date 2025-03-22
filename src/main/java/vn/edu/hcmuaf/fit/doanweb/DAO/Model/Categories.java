package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
@Data
public class Categories implements Serializable{
    private int id;
    private String name;
    private int status;
    private int hot;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
