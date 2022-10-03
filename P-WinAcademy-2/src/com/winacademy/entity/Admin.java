package com.winacademy.entity;

public class Admin {

    private int id_user;
    private int id_college;

    public Admin(int id_user, int id_college) {
        this.id_user = id_user;
        this.id_college = id_college;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id_user=" + id_user +
                ", id_college=" + id_college +
                '}';
    }

    public Admin() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_college() {
        return id_college;
    }

    public void setId_college(int id_college) {
        this.id_college = id_college;
    }
}
