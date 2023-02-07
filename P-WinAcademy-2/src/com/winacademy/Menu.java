package com.winacademy;

import com.winacademy.entity.Departement;

import java.util.Scanner;
import java.util.Set;

public class Menu {
    private String menuName;
    private String submenu;

    public Menu(String menuName, String submenu) {
        this.menuName = menuName;
        this.submenu = submenu;
    }
    public Menu(String menuName) {
        this.menuName = menuName;
    }


    public Menu() {}

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
    public int menuPrincipale(){
        try {
            System.out.println("================= "+ this.menuName+" =================");
            System.out.println("1: Gestion des colleges.");
            System.out.println("2: Gestion des departements.");
            System.out.println("3: Gestion des Salles.");
            System.out.println("4: Gestion des matieres.");
            System.out.println("5: Gestion des ensiegants.");
            System.out.println("6: Gestion des etudiants.");
            System.out.println("7: Gestion des groups.");
            System.out.println("8: Gestion des notes.");
            System.out.println("0: Quite l'app.");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return this.menuPrincipale();
        }
    }
    public int menuDepartement(String submenu) {

        try {
            System.out.println("================= "+ submenu+" =================");
            System.out.println("1: List des departements.");
            System.out.println("2: Ajouter un departement.");
            System.out.println("3: Supprimer un departement.");
            System.out.println("4: Modifier un departement.");
            System.out.println("5: return");
            System.out.println("0: Quite l'app.");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return this.menuDepartement(submenu);
        }
    }
    public int menuCollege(String submenu) {

        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: List des colleges.");
            System.out.println("2: Ajouter un college.");
            System.out.println("3: Supprimer un collge.");
            System.out.println("4: Modifier un college.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return this.searchCollege(submenu);
        }
    }
    public int searchCollege(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: recherche avec le nom.");
            System.out.println("2: recherche avec le site.");
            System.out.println("3: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return this.searchCollege(submenu);
        }
    }

    public String question(String message){

        try {
            Scanner scanner = new Scanner(System.in);
            System.out.println(message);
            String choix = scanner.next();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+" Error!!:  entre un True ou Talse!!(T/F) ");
            return this.question(message);
        }

    }
    public String getSubmenu() {
        return submenu;
    }

    public void setSubmenu(String submenu) {
        this.submenu = submenu;
    }

    public static void clearConsole(){
        try{
            String operatingSystem = System.getProperty("os.name"); //Check the current operating system

            if(operatingSystem.contains("Windows")){
                ProcessBuilder pb = new ProcessBuilder("cmd", "/c", "cls");
                Process startProcess = pb.inheritIO().start();
                startProcess.waitFor();
            } else {
                ProcessBuilder pb = new ProcessBuilder("clear");
                Process startProcess = pb.inheritIO().start();

                startProcess.waitFor();
            }
            System.out.println("==============================WinAcademy==============================");
        }catch(Exception e){
            System.out.println(e);
        }
    }

    public int menuSalle(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: Liste des salles.");
            System.out.println("2: Cree une salle.");
            System.out.println("3: Supprimer une salle.");
            System.out.println("4: Modifier une salle.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuSalle(submenu);
        }
    }

    public int menuChoixDep(Set<Departement> departements) {
        Menu.clearConsole();
        try {
            System.out.println("Selectionner une departement:");
            for (Departement departement: departements)
                System.out.println(departement.getId()+ " - " + departement.getName()+",- Id college: "+ departement.getIdCollege());
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuChoixDep(departements);
        }
    }

    public int menuMatiere(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: Liste des Matiere.");
            System.out.println("2: Cree une Matiere.");
            System.out.println("3: Supprimer une Matiere.");
            System.out.println("4: Modifier une Matiere.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuSalle(submenu);
        }
    }

    public int menuEnseignants(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: Liste des Ensiegnants.");
            System.out.println("2: Cree une Ensiegnant.");
            System.out.println("3: Supprimer une Ensiegnants.");
            System.out.println("4: Modifier une Ensiegnants.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuSalle(submenu);
        }
    }

    public int menuEtudiant(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: Liste des Etudiants.");
            System.out.println("2: Cree une Etudiant.");
            System.out.println("3: Supprimer une Etudiant.");
            System.out.println("4: Modifier une Etudiant.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuEtudiant(submenu);
        }
    }
 public int menuGroups(String submenu) {
        try {
            System.out.println("================= "+ submenu +" =================");
            System.out.println("1: Liste des Groups.");
            System.out.println("2: Cree une Group.");
            System.out.println("3: Supprimer une Group.");
            System.out.println("4: Modifier une Group.");
            System.out.println("5: return");
            System.out.println("0: Quiter");
            System.out.print("Votre choix: ");
            Scanner scanner = new Scanner(System.in);
            int choix = scanner.nextInt();
            clearConsole();
            return choix;
        }catch (Exception e){
            System.out.println(e.getMessage()+ " Error!!: entre un entier");
            return menuGroups(submenu);
        }
    }

}

