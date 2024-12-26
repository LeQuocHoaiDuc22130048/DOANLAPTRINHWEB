package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

import java.io.Serializable;
@Data
public class UsersTypes implements Serializable {
    private int id;
    private int user_id;
    private int user_type_id;
}

