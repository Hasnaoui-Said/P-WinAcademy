package com.winacademy;

import com.winacademy.entity.Departement;
import com.winacademy.entity.Ensiegnant;
import com.winacademy.entity.Etudiant;

import java.util.ArrayList;

public class Utile {

    public static Departement findDepartementById(ArrayList<Departement> departements, int id){
        for (Departement departement: departements)
            if(departement.getId() == id)
                return departement;
        return  null;
    }
    public static Ensiegnant findEnsiegnantById(ArrayList<Ensiegnant> ensiegnant, int id){
        for (Ensiegnant ens: ensiegnant)
            if(ens.getId() == id)
                return ens;
        return  null;
    }
    public static Etudiant findEtudiantById(ArrayList<Etudiant> etudiants, int id){
        for (Etudiant et: etudiants)
            if(et.getId() == id){
                return et;
            }
        return  null;
    }
}
