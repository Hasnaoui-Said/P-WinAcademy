package com.winacademy.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Ensiegnant extends Users{
    private LocalDate dateFonction;
    private int id_matiere;
    private int id_departement;
    private HashSet<Ensiegnant> ensiegnants;

    private Set<Group> groups;

    public Ensiegnant(int id, String firstname, String lastname, String email, String phone, String password, Boolean status, LocalDate dateFonction, int id_matiere, int id_departement) {
        super(id, firstname, lastname, email, phone, password, status);
        this.dateFonction = dateFonction;
        this.id_matiere = id_matiere;
        this.id_departement = id_departement;
    }

    public Ensiegnant() {
        this.groups = new HashSet<>();
        this.ensiegnants = new HashSet<>();
    }
    public int add(Ensiegnant ensiegnant){
        Iterator iterator = this.ensiegnants.iterator();
        while (iterator.hasNext()){
            Ensiegnant ensiegnant1 = (Ensiegnant) iterator.next();
            if(ensiegnant1.getId() == id){
                return -1;
            }
        }
        this.ensiegnants.add(ensiegnant);
        return 1;
    }
    public Ensiegnant findMatiereById(int id) {
        Iterator iterator = this.ensiegnants.iterator();
        while (iterator.hasNext()){
            Ensiegnant ensiegnant = (Ensiegnant) iterator.next();
            if(ensiegnant.getId() == id){
                return ensiegnant;
            }
        }
        return null;
    }
    public int delete(int id) {
        Iterator iterator = this.ensiegnants.iterator();
        while (iterator.hasNext()){
            Ensiegnant ensiegnant = (Ensiegnant) iterator.next();
            if(ensiegnant.getId() == id){
                this.ensiegnants.remove(ensiegnant);
                return 1;
            }
        }
        return -1;
    }
    public HashSet<Ensiegnant> getEnsiegnants() {
        return ensiegnants;
    }

    public void setEnsiegnants(HashSet<Ensiegnant> ensiegnants) {
        this.ensiegnants = ensiegnants;
    }

    @Override
    public String toString() {
        return "Ensiegnant{" +
                super.toString()+
                ", dateFonction=" + dateFonction +
                ", id_matiere=" + id_matiere +
                ", id_departement=" + id_departement +
                '}';
    }

    public LocalDate getDateFonction() {
        return dateFonction;
    }

    public void setDateFonction(LocalDate dateFonction) {
        this.dateFonction = dateFonction;
    }

    public int getId_matiere() {
        return id_matiere;
    }

    public void setId_matiere(int id_matiere) {
        this.id_matiere = id_matiere;
    }

    public int getId_departement() {
        return id_departement;
    }

    public void setId_departement(int id_departement) {
        this.id_departement = id_departement;
    }
}
