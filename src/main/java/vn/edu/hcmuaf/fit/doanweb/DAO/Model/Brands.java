package vn.edu.hcmuaf.fit.doanweb.DAO.Model;

import java.time.LocalDateTime;

public class Brands {
    private int id;
    private String name;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    private String title;
    private String img;
    private String description;
    private String icon;

    public Brands(int id, String name, LocalDateTime created_at, LocalDateTime updated_at, String title, String img, String description,String icon) {
        this.id = id;
        this.name = name;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.title = title;
        this.img = img;
        this.description = description;
        this.icon = icon;
    }

    public Brands() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
