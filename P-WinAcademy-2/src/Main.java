import com.winacademy.*;
import com.winacademy.entity.*;

import java.util.*;

public class Main extends Utile{
    public static void main(String[] args) {

        // ArrayList des colleges
        College colleges = new College();
        colleges.setColleges(new Remplir().college());
        // ArrayList des departements
        Departement departements = new Departement();
        departements.setDepartements(new Remplir().departement());
        departements.setSales(departements.getSales());
        // Array List des etudiants
        ArrayList<Etudiant> etudiants = new Remplir().etudiant();
        // Array List des ensiegnants
        Set<Ensiegnant> ensiegnants = new Remplir().ensiegnant();
        // Array List des groups
        Set<Group> groups = new Remplir().group().getGroups();


        // Array List les matieres
        HashSet<Matiere> matieres = new Remplir().matiere();

        etudiants.get(0).addNote(new Note(12.0, 1));
        etudiants.get(0).addNote(new Note(13.0, 1));
        etudiants.get(0).addNote(new Note(13.0, 2));
        etudiants.get(0).addNote(new Note(17.0, 2));
        etudiants.get(0).addNote(new Note(17.0, 3));
        etudiants.get(0).addNote(new Note(17.0, 1));
        ArrayList<Note> notes = etudiants.get(0).getNotes();
        Menu.clearConsole();
        Menu menu = new Menu("Menu principale");
        int choix = menu.menuPrincipale();
        int menuCollege, menuDepartement, menuSalle;
        while(choix!=0){
            switch (choix){
                // Quiter l'app
                case 0:{
                    choix = 0;
                    break;
                }
                // Gestion des college
                case 1:{
                    menuCollege = menu.menuCollege("Getion des Colleges");
                    while(menuCollege!=0){
                        switch (menuCollege){
                            //list des college;
                            case 1:{
                                for (College college: colleges.getColleges()){
                                    System.out.println(college);
                                }
                                // break point
                                if(menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))){
                                    menuCollege = 0;
                                    Menu.clearConsole();
                                    break;
                                }else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    menuCollege = 0;
                                    break;
                                }
                            }
                            // add college
                            case 2:{
                                if(colleges.add(createCollege()) == 1) {
                                    System.out.println("college a ete cree avec success");
                                    // break point
                                    if(menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))){
                                        menuCollege = 0;
                                        choix = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! le nom ou le site deja exist!");
                                    // break point
                                    if(menu.question("Essaye a nouveau oui/non (y/n)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuCollege = 2;
                                        Menu.clearConsole();
                                        break;
                                    }else {
                                        // pour continue
                                        menuCollege = menu.menuCollege("Gestion des colleges");
                                        break;
                                    }
                                }
                                menuCollege = menu.menuCollege("Gestion des colleges");
                                break;
                            }
                            // delete college
                            case 3:{
                                Scanner scanner = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idCollege = scanner.nextInt();
                                College college = colleges.findCollegeById(idCollege);
                                if(college == null){
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if(menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuCollege = 3;
                                        Menu.clearConsole();
                                        break;
                                    }else{
                                        menuCollege = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                }else {
                                    if(colleges.delete(idCollege) == 1) {
                                        System.out.println("college a ete cree avec success");
                                        // break point
                                        if(menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))){
                                            menuCollege = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                            menuCollege = 0;
                                            Menu.clearConsole();
                                            break;
                                        }else{
                                            menuCollege = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    menuCollege = menu.menuCollege("Gestion des colleges");
                                    break;
                                }
                            }
                            // Update
                            case 4:{
                                System.out.print("Donner 'l'index de college: ");
                            }
                            case 5:{
                                //Return;
                                menuCollege = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            default:{
                                menuCollege = 0;
                                choix = 0;
                                Menu.clearConsole();
                                break;
                            }
                        }
                    }
                    break;
                }
                //Getion des Departements
                case 2:{
                    menuDepartement = menu.menuDepartement("Getion des Departements");
                    while(menuDepartement!=0){
                        switch (menuDepartement){
                            //Quiter;
                            case 0:{
                                menuDepartement = 0;
                                choix = 0;
                                Menu.clearConsole();
                                break;
                            }
                            //list des departements;
                            case 1:{
                                for (Departement departement: departements.getDepartements()){
                                    System.out.println(departement);
                                }
                                // break point
                                System.out.println("\n");
                                if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                    menuDepartement = 0;
                                    Menu.clearConsole();
                                    break;
                                }else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    menuDepartement = 0;
                                    break;
                                }
                            }
                            // add departement
                            case 2:{
                                if(departements.add(createDepartement()) == 1) {
                                    System.out.println("college a ete cree avec success");
                                    // break point
                                    if(menu.question("Vous-voulez Ajouter un autre departement(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuDepartement = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! le nom ou le site deja exist!");
                                    // break point
                                    if(menu.question("Essaye a nouveau oui/non (true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuDepartement = 2;
                                        Menu.clearConsole();
                                        break;
                                    }else {
                                        // pour continue
                                        Menu.clearConsole();
                                        menuDepartement = menu.menuDepartement("Gestion des departements");
                                        break;
                                    }
                                }
                                menuDepartement = menu.menuCollege("Gestion des departements");
                                break;
                            }
                            // delete departement
                            case 3:{
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idDepartement = sc.nextInt();
                                College college = colleges.findCollegeById(idDepartement);
                                if(college == null){
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if(menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuDepartement = 3;
                                        Menu.clearConsole();
                                        break;
                                    }else{
                                        menuDepartement = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                }else {
                                    if(colleges.delete(idDepartement) == 1) {
                                        System.out.println("Departement a ete cree avec success");
                                        // break point
                                        if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))){
                                            menuDepartement = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if(menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                            menuDepartement = 3;
                                            Menu.clearConsole();
                                            break;
                                        }else{
                                            menuDepartement = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    menuDepartement = menu.menuDepartement("Gestion des departements");
                                    break;
                                }
                            }
                            // Update
                            case 4:{
                                System.out.print("Modifier un departement: ");
                                System.out.print("encore!! ");
                                if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                    menuDepartement = 0;
                                    Menu.clearConsole();
                                    break;
                                }else{
                                    menuDepartement = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            case 5:{
                                //Return;
                                menuDepartement = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default:{
                                menuDepartement = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                Menu.clearConsole();
                                break;
                            }
                        }
                    }
                    break;
                }
                //Getion des salles
                case 3:{
                    menuSalle = menu.menuSalle("Getion des des Salles");
                    while(menuSalle!=0){
                        switch (menuSalle){
                            //Quiter;
                            case 0:{
                                menuSalle = 0;
                                choix = 0;
                                System.out.println("salllle");
                                break;
                            }
                            //list des salle;
                            case 1:{
                                for (Departement departement : departements.getDepartements()){
                                    System.out.println("List des salle de chaque departement: "+ departement.getName());
                                    System.out.println("Departement: "+ departement.getName() + " College Name "+ departement.getIdCollege());
                                    for (Salle salle : departement.getSales()){
                                        System.out.println(salle.toString());
                                    }
                                }
                                // break point
                                System.out.println("\n");
                                if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                    menuSalle = 0;
                                    Menu.clearConsole();
                                    break;
                                }else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    menuSalle = 0;
                                    break;
                                }
                            }
                            // add salle
                            case 2:{
                                int menuChoixDep = menu.menuChoixDep(departements.getDepartements());
                                Departement departement = departements.findDepartementById(menuChoixDep);
                                if (departement == null){
                                    System.out.println("Error! id departement n'exist pas: ");
                                    if(menu.question("Vous-voulez essaye de nouveau(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuSalle = 2;
                                        Menu.clearConsole();
                                        break;
                                    }else {
                                        menuSalle = 0;
                                    }
                                }else{
                                    for (Salle salle: departement.getSales())
                                        System.out.println(salle.toString());
                                    if(departements.addSalle(menuChoixDep, createSalle()) == 1) {
                                        System.out.println("Salle a bien ete cree avec success.");
                                        // break point
                                        if(menu.question("Vous-voulez cree d'autre salle(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                            menuSalle = 2;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error!");
                                        // break point
                                        if(menu.question("Essaye a nouveau oui/non (true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                            menuSalle = 2;
                                            Menu.clearConsole();
                                            break;
                                        }else {
                                            // pour continue
                                            Menu.clearConsole();
                                            menuSalle = menu.menuSalle("Gestion des salles");
                                            break;
                                        }
                                    }
                                    menuSalle= menu.menuSalle("Gestion des salles");
                                    break;
                                }
                            }
                            // delete salle
                            case 3:{
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idDepartement = sc.nextInt();
                                College college = colleges.findCollegeById(idDepartement);
                                if(college == null){
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if(menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                        menuDepartement = 3;
                                        Menu.clearConsole();
                                        break;
                                    }else{
                                        menuDepartement = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                }else {
                                    if(colleges.delete(idDepartement) == 1) {
                                        System.out.println("Departement a ete cree avec success");
                                        // break point
                                        if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))){
                                            menuDepartement = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if(menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                            menuDepartement = 3;
                                            Menu.clearConsole();
                                            break;
                                        }else{
                                            menuDepartement = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    menuDepartement = menu.menuDepartement("Gestion des departements");
                                    break;
                                }
                            }
                            // Update
                            case 4:{
                                System.out.print("Modifier uue salle: ");
                                System.out.print("encore!! ");
                                if(menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))){
                                    menuSalle = 0;
                                    Menu.clearConsole();
                                    break;
                                }else{
                                    menuSalle = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            case 5:{
                                //Return;
                                menuSalle = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default:{
                                menuSalle = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    break;
                }
                //Default Open menu principale
                default:{
                    Menu.clearConsole();
                    choix = menu.menuPrincipale();
                    break;
                }
            }
        }


        System.out.println("==============================WinAcademy==============================");
        System.out.println("=======================Merci pour votre visite!=======================");

    }

    private static Salle createSalle() {
        try {
            Scanner scanner = new Scanner(System.in);
            Salle salle = new Salle();
            System.out.println("==============================Ajouter un college==============================");
            System.out.print("Numero: ");
            salle.setNum(scanner.nextLine());
            System.out.print("\n");
            System.out.print("Capacite: ");
            salle.setCapacite(scanner.nextInt());
            System.out.print("\n");
            return salle;
        }catch (Exception e){
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createSalle();
        }
    }

    private static Departement createDepartement() {
        try {
            Scanner scanner = new Scanner(System.in);
            Departement departement = new Departement();
            System.out.println("==============================Ajouter un departement==============================");
            System.out.print("Id: ");
            departement.setId(scanner.nextInt());
            System.out.print("\n");
            System.out.print("Nom: ");
            departement.setName(scanner.next());
            System.out.print("\n");
            System.out.print("Id College: ");
            departement.setIdCollege(scanner.nextInt());
            System.out.print("\n");
            System.out.print("Description: ");
            departement.setDescription(scanner.next());
            System.out.print("\n");
            return departement;
        }catch (Exception e){
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createDepartement();
        }
    }

    private static College createCollege() {
        try {
        Scanner scanner = new Scanner(System.in);
        College college = new College();
        System.out.println("==============================Ajouter une salle==============================");
        System.out.print("Numero: ");
        college.setNum(scanner.nextInt());
        System.out.print("\n");
        System.out.print("Le nom: ");
        college.setName(scanner.next());
        System.out.print("\n");
        System.out.print("Id adresse: ");
        college.setIdAddress(scanner.nextInt());
        System.out.print("\n");
        System.out.print("Site: ");
        college.setSite(scanner.next());
        System.out.print("\n");
        return college;
    }catch (Exception e){
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createCollege();
        }
    }
}