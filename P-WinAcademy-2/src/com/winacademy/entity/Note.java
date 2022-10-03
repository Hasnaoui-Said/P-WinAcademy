package com.winacademy.entity;

import java.util.ArrayList;

public class Note {
    private ArrayList<Double> evaluations;
    private int id_matiere;
    private Double eval;

    public Note(Double eval, int id_matiere) {
        this.eval = eval;
        this.id_matiere = id_matiere;
        this.evaluations = new ArrayList<>();
        this.evaluations.add(eval);
    }

    public Note() {}

    public Double getEval() {
        return eval;
    }

    public void setEval(Double eval) {
        this.eval = eval;
    }

    public ArrayList<Double> getEvaluations() {
        return evaluations;
    }

    public void setEvaluations(ArrayList<Double> notes) {
        this.evaluations = notes;
    }

    public int addEvaluations(Double ev) {
        this.evaluations.add(ev);
        return 1;
    }

    public int getId_matiere() {
        return id_matiere;
    }

    public void setId_matiere(int id_matiere) {
        this.id_matiere = id_matiere;
    }

    public int getName() {
        return id_matiere;
    }

    public void setName(int id) {
        this.id_matiere = id;
    }

    @Override
    public String toString() {
        return "Note{" +
                "notes=" + this.evaluations +
                ", id_matiere=" + id_matiere +
                '}';
    }
}
