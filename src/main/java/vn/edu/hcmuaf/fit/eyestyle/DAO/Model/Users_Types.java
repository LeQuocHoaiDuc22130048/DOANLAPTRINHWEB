package vn.edu.hcmuaf.fit.eyestyle.DAO.Model;

import java.io.Serializable;

public class Users_Types implements Serializable {

    private int id;
    private int user_id;
    private int user_type_id;


    public Users_Types(int id, int user_id, int user_type_id){
        this.id= id;
        this.user_id=user_id;
        this.user_type_id=user_type_id;
    }
    public Users_Types(){

    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getUser_type_id() {
        return user_type_id;
    }

    public void setUser_type_id(int user_type_id) {
        this.user_type_id = user_type_id;
    }
}
