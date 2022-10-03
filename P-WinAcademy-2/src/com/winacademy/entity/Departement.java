package com.winacademy.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Departement {

    private int id;
    private String name;
    private String description;
    private int idCollege;
    private Ensiegnant responsable;
    private ArrayList<Salle> sales;
    private Set<Departement> departements;

    public Departement() {
        this.departements = new HashSet<>();
        this.sales = new ArrayList<>();
    }
    public Departement(int id, String name, String description, int idCollege) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.idCollege = idCollege;
        this.sales = new ArrayList<>();
    }

    public int addSalle(Salle salle){
        Iterator itr = this.sales.iterator();
        while (itr.hasNext()){
            Salle s = (Salle) itr.next();
            if(s.getNum().equals(salle.getNum())) return -1;
        }
        this.sales.add(salle);
        return 1;
    }

    public int add(Departement departement){
        Iterator iterator = this.departements.iterator();
        while (iterator.hasNext()){
            Departement dep = (Departement) iterator.next();
            if (dep.getName().equals(departement.getName()) && departement.getIdCollege() == dep.getIdCollege()) {
                return -1;
            }
        }
        this.departements.add(departement);
        return 1;
    }

    public Set<Departement> getDepartements() {
        return departements;
    }

    public void setDepartements(Set<Departement> departements) {
        this.departements = departements;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIdCollege() {
        return idCollege;
    }

    public void setIdCollege(int idCollege) {
        this.idCollege = idCollege;
    }

    public Ensiegnant getResponsable() {
        return responsable;
    }

    public void setResponsable(Ensiegnant responsable) {
        this.responsable = responsable;
    }

    public ArrayList<Salle> getSales() {
        return this.sales;
    }

    public void setSales(ArrayList<Salle> sales) {
        this.sales = sales;
    }

    @Override
    public String toString() {
        return "Departement{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", idCollege=" + idCollege +
                '}';
    }

    public Departement findDepartementById(int id) {
        Iterator iterator = this.departements.iterator();
        while (iterator.hasNext()){
            Departement dep = (Departement) iterator.next();
            if (id == dep.getId()) {
                return dep;
            }
        }
        return null;
    }

    public int addSalle(int idDep, Salle salle) {
        Iterator iterator = this.departements.iterator();
        while (iterator.hasNext()){
            Departement dep = (Departement) iterator.next();
            if (idDep == dep.getId()) {
                dep.addSalle(salle);
                return 1;
            }
        }
        return -1;
    }
}
