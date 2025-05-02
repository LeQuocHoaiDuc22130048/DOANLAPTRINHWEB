package vn.edu.hcmuaf.fit.doanweb.Controller.DTO;

import lombok.Data;

@Data
public class UserProfile {
    private String id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String avatar;
    private String role;
}
