package com.winacademy;

import com.winacademy.entity.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Remplir {
    public Set<College> college(){
        College colleges = new College();
        if (colleges.add(new College(1, "tariq", "tariq.com", 1)) == -1)
            System.out.println("Error: college name or site are already exist!");
        if (colleges.add(new College(2, "youcode", "youcode.com", 2)) == -1)
            System.out.println("Error: college name or site are already exist!");
        return colleges.getColleges();
    }
    public HashSet<Ensiegnant> ensiegnant(){
        Ensiegnant ensiegnants = new Ensiegnant();
        ensiegnants.add(new Ensiegnant(1, "said", "hasnaoui", "saidhasnaoui@gmail.com", "21266554433", "1234", true,  LocalDate.now(),1,1));
        ensiegnants.add(new Ensiegnant(2, "hassane", "hassane", "hassane@gmail.com", "21266554433", "1234", true, LocalDate.now(),1,3));
        ensiegnants.add(new Ensiegnant(3, "karima", "karima", "karima@gmail.com", "21266554433", "1234", true,  LocalDate.now(),2,2));
        ensiegnants.add(new Ensiegnant(4, "khadija", "khadija", "khadija@gmail.com", "21266554433", "1234", true, LocalDate.now(),2,4));

        for (Ensiegnant ensiegnant: ensiegnants.getEnsiegnants())
            System.out.println(ensiegnant.toString());
        return ensiegnants.getEnsiegnants();
    }
    public Set<Departement> departement(){
        Departement departements = new Departement();
        departements.add(new Departement(1, "Informatique", "description dep infos", 1));
        departements.add(new Departement(2, "Math", "description dep Math", 1));
        departements.add(new Departement(3, "Informatique", "description dep infos", 2));
        departements.add(new Departement(4, "Math", "description dep Math", 2));
        for (Departement departement: departements.getDepartements()){
            if(departement.addSalle(new Salle("A1", 20)) != 1)
                System.out.println("Salle deja exist!!");
            if(departement.addSalle(new Salle("B1", 25)) != 1)
                System.out.println("Salle deja exist!!");
            if(departement.addSalle(new Salle("C1", 20)) != 1)
                System.out.println("Salle deja exist!!");
            if(departement.addSalle(new Salle("D1", 25)) != 1)
                System.out.println("Salle deja exist!!");
        }
        return departements.getDepartements();
    }


    public ArrayList<Etudiant> etudiant(){
        Etudiant etudiants = new Etudiant();
        if(etudiants.add(new Etudiant(1, "yasmine", "yasmine", "yasmine@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(2, "houssa", "houssa", "houssa@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(3, "youssef", "youssef", "youssef@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(4, "hamza", "hamza", "hamza@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(4, "abdellah", "abdellah", "abdellah@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(6, "kamal", "kamal", "kamal@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(7, "hafssa", "hafssa", "hafssa@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        if(etudiants.add(new Etudiant(8, "oussama", "oussama", "oussama@gmail.com", "21266554433", "1234", true, LocalDate.now()))==-1)
            System.out.println("Error: email is already eexist!");
        return etudiants.getEtudiants();
    }

    public HashSet<Matiere> matiere(){
        Matiere matieres = new Matiere();
        matieres.add(new Matiere(1, "Math"));
        matieres.add(new Matiere(2, "Informatique"));
        return matieres.getMatieres();
    }

    public Group group() {
        Group groups = new Group();
        if(groups.add(new Group(1,1,"Group1")) == -1)
            System.out.println("error: Group is already existe!");
        if(groups.add(new Group(2,2,"Group1")) == -1)
            System.out.println("error: Group is already existe!");
        if(groups.add(new Group(3,1,"Group2")) == -1)
            System.out.println("error: Group is already existe!");
        if(groups.add(new Group(4,2,"Group2")) == -1)
            System.out.println("error: Group is already existe!");
        return groups;
    }
}
