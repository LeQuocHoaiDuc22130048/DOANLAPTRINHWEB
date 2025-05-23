package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import lombok.Data;

@Data
public class Banner {
    private int id;
    private String image_url;
    private String link_url;
    private String title;
    private int status;
}
