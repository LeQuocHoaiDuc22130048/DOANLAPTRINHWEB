package vn.edu.hcmuaf.fit.eyestyle.DAO.Model;

import java.io.Serializable;

public class UserType implements Serializable {

    private int id;
    private String name;
    private String description;


    public UserType(int id, String name, String description){
        this.id=id;
        this.name=name;
        this.description=description;
    }
    public UserType(){

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
