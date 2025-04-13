package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
@Data
public class User implements Serializable {

    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private int status;
    private String role;
    private String avatar;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
}
