package com.winacademy.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class Matiere {
    private int id;
    private String name;
    private HashSet<Matiere> matieres;
    public Matiere() {
        this.matieres = new HashSet<>();
    }
    public Matiere(int id, String name) {
        this.id = id;
        this.name = name;
    }
    public int add(Matiere matiere){
        Iterator itr = this.matieres.iterator();
        while (itr.hasNext()){
            Matiere mat = (Matiere) itr.next();
            if(mat.getName().equals(matiere.getName())){
                System.out.println("error: Matiere "+ mat.getName() +  " is already existe");
                return -1;
            }
        }
        matieres.add(matiere);
        return 1;
    }
    public HashSet<Matiere> getMatieres() {
        return matieres;
    }
    public void setMatieres(HashSet<Matiere> matieres) {
        this.matieres = matieres;
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

    @Override
    public String toString() {
        return "Matiere{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

    public Matiere findMatiereById(int id) {
        Iterator iterator = this.matieres.iterator();
        while (iterator.hasNext()){
            Matiere matiere = (Matiere) iterator.next();
            if(matiere.getId() == id){
                return matiere;
            }
        }
        return null;
    }
    public int delete(int id) {
        Iterator iterator = this.matieres.iterator();
        while (iterator.hasNext()){
            Matiere matiere = (Matiere) iterator.next();
            if(matiere.getId() == id){
                this.matieres.remove(matiere);
                return 1;
            }
        }
        return -1;
    }
}
