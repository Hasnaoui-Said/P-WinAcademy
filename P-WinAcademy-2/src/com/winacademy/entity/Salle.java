package com.winacademy.entity;

public class Salle {
    private String num;
    private int capacite;

    public Salle(String num, int capacite) {
        this.num = num;
        this.capacite = capacite;
    }
    public Salle(){}


    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public int getCapacite() {
        return capacite;
    }

    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }

    @Override
    public String toString() {
        return "Salle{" +
                "num='" + num + '\'' +
                ", capacite='" + capacite + '\'' +
                '}';
    }
}
