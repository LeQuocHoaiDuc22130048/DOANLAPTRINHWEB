package vn.edu.hcmuaf.fit.doanweb.DAO.Admin.ViewModels;

import lombok.Data;

@Data
public class Suggestion {
    private int id;
    private String name;

    public Suggestion(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
