package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.io.Serializable;
@Data
public class UserType implements Serializable {
    private int id;
    private String name;
    private String description;
}

