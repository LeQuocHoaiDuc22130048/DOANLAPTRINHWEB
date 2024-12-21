package vn.edu.hcmuaf.fit.eyestyle.DAO.Model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class User implements Serializable {


    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;
    private int status;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;


    public User(int id, String name, String email, String password, String phone, String address, int status,LocalDateTime created_at, LocalDateTime updated_at){
        this.id=id;
        this.name=name;
        this.email=email;
        this.password=password;
        this.phone=phone;
        this.address=address;
        this.status=status;
        this.created_at=created_at;
        this.updated_at=updated_at;
    }
    public User(){

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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



}
