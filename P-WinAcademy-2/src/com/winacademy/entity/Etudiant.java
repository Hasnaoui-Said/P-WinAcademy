package com.winacademy.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;

public class Etudiant extends Users {

    private LocalDate anneeEntree;
    private ArrayList<Note> notes;
    private ArrayList<Etudiant> etudiants;


    public Etudiant(int id, String firstname, String lastname, String email, String phone, String password, Boolean status, LocalDate anneeEntree) {
        super(id, firstname, lastname, email, phone, password, status);
        this.anneeEntree = anneeEntree;
        this.notes = new ArrayList<>();
    }

    public Etudiant() {
        this.etudiants = new ArrayList<>();
    }
    public int add(Etudiant etudiant){
        Iterator<Etudiant> iterator = this.etudiants.iterator();
        while (iterator.hasNext()){
            Etudiant etudiant1 = iterator.next();
            if (etudiant1.getEmail().equals(etudiant.getEmail())) return -1;
        }
        this.etudiants.add(etudiant);
        return 1;
    }
    public int delete(int id){
        Iterator<Etudiant> iterator = this.etudiants.iterator();
        while (iterator.hasNext()){
            Etudiant etudiant1 = iterator.next();
            if (etudiant1.getId() == id) {
                etudiants.remove(etudiant1);
                return 1;
            }
        }
        return 1;
    }
    public int addNote(Note note){
        Iterator iterator = this.getNotes().iterator();
        while (iterator.hasNext()){
            Note note1 = (Note) iterator.next();
            if (note1.getId_matiere() == note.getId_matiere()){
                note1.addEvaluations(note.getEval());
                return 1;
            }
        }
        this.notes.add(note);
        return 1;
    }

    public ArrayList<Etudiant> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(ArrayList<Etudiant> etudiants) {
        this.etudiants = etudiants;
    }

    @Override
    public String toString() {
        return "Etudiant{" +
                "id=" + id +
                ", firstname='" + this.getFirstname() + '\'' +
                ", lastname='" + this.getLastname() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", phone='" + getPhone() + '\'' +
                ",anneeEntree=" + anneeEntree +
                ", status=" + getStatus() +
                '}';
    }


    public LocalDate getAnneeEntree() {
        return anneeEntree;
    }

    public void setAnneeEntree(LocalDate anneeEntree) {
        this.anneeEntree = anneeEntree;
    }

    public ArrayList<Note> getNotes() {
        return notes;
    }

    public void setNotes(ArrayList<Note> notes) {
        this.notes = notes;
    }
}
