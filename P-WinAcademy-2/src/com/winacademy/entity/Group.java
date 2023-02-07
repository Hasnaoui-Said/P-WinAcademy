package com.winacademy.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Group {

    private int id;
    private int idCollege;
    private String name;
    private Set<Etudiant> etudiants;
    private Set<Matiere> matieres;
    private Set<Group> groups = new HashSet<>();
    public Group(int id, int idCollege, String name) {
        this.id = id;
        this.idCollege = idCollege;
        this.name = name;
    }

    public Group() {
        this.etudiants = new HashSet<>();
        this.matieres = new HashSet<>();
        this.groups = new HashSet<>();
    }

    public int add(Group grp) {
        Iterator<Group> iterator = this.groups.iterator();
        while (iterator.hasNext()){
            Group group = iterator.next();
            if (group.getIdCollege() == grp.getIdCollege() && group.getName().equals(grp.getName())){
                return -1;
            }
        }
        this.groups.add(grp);
        return 1;
    }
    public int delete(int id) {
        Iterator<Group> iterator = this.groups.iterator();
        int index;
        while (iterator.hasNext()){
            Group group = iterator.next();
            if (group.getId() == id){
                groups.remove(group);
                return 1;
            }
        }
        return -1;
    }
    public int update(int id, String name) {
        Iterator<Group> iterator = this.groups.iterator();
        int index;
        while (iterator.hasNext()){
            Group group = iterator.next();
            if (group.getId() == id){
                group.setName(name);
                return 1;
            }
        }
        return -1;
    }

    public int addEtudiant(Etudiant etudiant){
        for (Etudiant etu: this.etudiants){
            if (etu.getId() == etudiant.getId())
                return -1;
        }
        this.etudiants.add(etudiant);
        return 1;
    }

    public int deleteEtudiant(Etudiant etudiant){
        Iterator itr = this.etudiants.iterator();
        while (itr.hasNext()){
            Etudiant etu = (Etudiant) itr.next();
            if(etu.getId() == etudiant.getId())
                itr.remove();
        }
        return -1;
    }

    public Set<Matiere> getMatieres() {
        return matieres;
    }

    public void setMatieres(Set<Matiere> matieres) {
        this.matieres = matieres;
    }

    public Set<Group> getGroups() {
        return groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }

    public int getIdCollege() {
        return idCollege;
    }

    public void setIdCollege(int idCollege) {
        this.idCollege = idCollege;
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

    public Set<Etudiant> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(Set<Etudiant> etudiants) {
        this.etudiants = etudiants;
    }

    @Override
    public String toString() {
        return "Group{" +
                "id=" + id +
                ", idCollege=" + idCollege +
                ", name='" + name + '\'' +
                '}';
    }

    public Group findMatiereById(int id) {
        Iterator iterator = this.groups.iterator();
        while (iterator.hasNext()){
            Group group = (Group) iterator.next();
            if(group.getId() == id){
                return group;
            }
        }
        return null;
    }
}
