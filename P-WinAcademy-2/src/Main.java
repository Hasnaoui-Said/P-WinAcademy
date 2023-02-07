import com.winacademy.*;
import com.winacademy.entity.*;

import java.time.LocalDate;
import java.util.*;

public class Main extends Utile {
    public static void main(String[] args) {

        // ArrayList des colleges
        College colleges = new College();
        colleges.setColleges(new Remplir().college());
        // ArrayList des departements
        Departement departements = new Departement();
        departements.setDepartements(new Remplir().departement());
        departements.setSales(departements.getSales());
        // Array List des etudiants
        Etudiant etudiants = new Etudiant();
        etudiants.setEtudiants(new Remplir().etudiant());
        // Array List des ensiegnants
        Ensiegnant ensiegnants = new Ensiegnant();
        ensiegnants.setEnsiegnants(new Remplir().ensiegnant());
        // Array List des groups
        Group groups = new Group();
        groups.setGroups(new Remplir().group().getGroups());


        // Array List les matieres
        Matiere matieres = new Matiere();
        matieres.setMatieres(new Remplir().matiere());

//        etudiants.get(0).addNote(new Note(12.0, 1));
//        etudiants.get(0).addNote(new Note(13.0, 1));
//        etudiants.get(0).addNote(new Note(13.0, 2));
//        etudiants.get(0).addNote(new Note(17.0, 2));
//        etudiants.get(0).addNote(new Note(17.0, 3));
//        etudiants.get(0).addNote(new Note(17.0, 1));
//        ArrayList<Note> notes = etudiants.get(0).getNotes();
        Menu.clearConsole();
        Menu menu = new Menu("Menu principale");
        int choix = menu.menuPrincipale(), choice;
        while (choix != 0) {
            switch (choix) {
                // Quiter l'app
                case 0: {
                    choix = 0;
                    break;
                }
                // Gestion des college
                case 1: {
                    choice = menu.menuCollege("Getion des Colleges");
                    while (choice != 0) {
                        switch (choice) {
                            //list des college;
                            case 1: {
                                for (College college : colleges.getColleges()) {
                                    System.out.println(college);
                                }
                                // break point
                                if (menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    break;
                                }
                            }
                            // add college
                            case 2: {
                                if (colleges.add(createCollege()) == 1) {
                                    System.out.println("college a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                        choice = 0;
                                        choix = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! le nom ou le site deja exist!");
                                    // break point
                                    if (menu.question("Essaye a nouveau oui/non (y/n)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        // pour continue
                                        choice = menu.menuCollege("Gestion des colleges");
                                        break;
                                    }
                                }
                                choice = menu.menuCollege("Gestion des colleges");
                                break;
                            }
                            // delete college
                            case 3: {
                                Scanner scanner = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idCollege = scanner.nextInt();
                                College college = colleges.findCollegeById(idCollege);
                                if (college == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        choix = menu.menuPrincipale();
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (colleges.delete(idCollege) == 1) {
                                        System.out.println("college a ete cree avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue oui ou non (true/false)").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuCollege("Gestion des colleges");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Donner 'l'index de college: ");
                            }
                            case 5: {
                                //Return;
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            default: {
                                choice = 0;
                                choix = 0;
                                Menu.clearConsole();
                                break;
                            }
                        }
                    }
                    break;
                }
                //Getion des Departements
                case 2: {
                    choice = menu.menuDepartement("Getion des Departements");
                    while (choice != 0) {
                        switch (choice) {
                            //Quiter;
                            case 0: {
                                choice = 0;
                                choix = 0;
                                Menu.clearConsole();
                                break;
                            }
                            //list des departements;
                            case 1: {
                                for (Departement departement : departements.getDepartements()) {
                                    System.out.println(departement);
                                }
                                // break point
                                System.out.println("\n");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    break;
                                }
                            }
                            // add departement
                            case 2: {
                                if (departements.add(createDepartement()) == 1) {
                                    System.out.println("college a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez Ajouter un autre departement(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! le nom ou le site deja exist!");
                                    // break point
                                    if (menu.question("Essaye a nouveau oui/non (true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        // pour continue
                                        Menu.clearConsole();
                                        choice = menu.menuDepartement("Gestion des departements");
                                        break;
                                    }
                                }
                                choice = menu.menuDepartement("Gestion des departements");
                                break;
                            }
                            // delete departement
                            case 3: {
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idDepartement = sc.nextInt();
                                College college = colleges.findCollegeById(idDepartement);
                                if (college == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        choix = menu.menuPrincipale();
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (colleges.delete(idDepartement) == 1) {
                                        System.out.println("Departement a ete cree avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuDepartement("Gestion des departements");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier un departement: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            case 5: {
                                //Return;
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
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
                case 3: {
                    choice = menu.menuSalle("Getion des des Salles");
                    while (choice != 0) {
                        switch (choice) {
                            //list des salle;
                            case 1: {
                                for (Departement departement : departements.getDepartements()) {
                                    System.out.println("List des salle de chaque departement: " + departement.getName());
                                    System.out.println("Departement: " + departement.getName() + " College Name " + departement.getIdCollege());
                                    for (Salle salle : departement.getSales()) {
                                        System.out.println(salle.toString());
                                    }
                                }
                                // break point
                                System.out.println("\n");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    break;
                                }
                            }
                            // add salle
                            case 2: {
                                int menuChoixDep = menu.menuChoixDep(departements.getDepartements());
                                Departement departement = departements.findDepartementById(menuChoixDep);
                                if (departement == null) {
                                    System.out.println("Error! id departement n'exist pas: ");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                    }
                                } else {
                                    for (Salle salle : departement.getSales())
                                        System.out.println(salle.toString());
                                    if (departements.addSalle(menuChoixDep, createSalle()) == 1) {
                                        System.out.println("Salle a bien ete cree avec success.");
                                        // break point
                                        if (menu.question("Vous-voulez cree d'autre salle(true/false):").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 2;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error!");
                                        // break point
                                        if (menu.question("Essaye a nouveau oui/non (true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 2;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            // pour continue
                                            Menu.clearConsole();
                                            choice = menu.menuSalle("Gestion des salles");
                                            break;
                                        }
                                    }
                                    choice = menu.menuSalle("Gestion des salles");
                                    break;
                                }
                            }
                            // delete salle
                            case 3: {
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer id de college: ");
                                int idDepartement = sc.nextInt();
                                College college = colleges.findCollegeById(idDepartement);
                                if (college == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        choix = menu.menuPrincipale();
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (colleges.delete(idDepartement) == 1) {
                                        System.out.println("Departement a ete cree avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'un college");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuDepartement("Gestion des departements");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier uue salle: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            case 5: {
                                //Return;
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    if (choice == 0) choix = 0;
                    break;
                }
                //Getion des matieres
                case 4: {
                    choice = menu.menuMatiere("Getion des des Matieres");
                    while (choice != 0) {
                        switch (choice) {
                            //list des matieres;
                            case 1: {
                                System.out.println("List des matieres");
                                for (Matiere matiere : matieres.getMatieres()) {
                                    System.out.println(matiere.toString());
                                }
                                // break point
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    Menu.clearConsole();
                                    choice = menu.menuMatiere("Getion des des Matieres");

                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    menu.question("Tapy qlqc: ");
                                    choice = 0;
                                    choix = menu.menuPrincipale();
                                    Menu.clearConsole();
                                }
                                break;
                            }
                            // add salle
                            case 2: {
                                if (matieres.add(createMatiere()) == 1) {
                                    System.out.println("matiere a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez ajouter une autre matiere(true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! nom ou id deja exist!!");
                                    // break point
                                    if (menu.question("Essaye a nouveau(True/False)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        // pour continue
                                        choice = menu.menuMatiere("Gestion des Matieres");
                                        break;
                                    }
                                }
                                choice = menu.menuMatiere("Gestion des Matieres");
                                break;
                            }
                            // delete Matiere
                            case 3: {
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer id de Matiere: ");
                                int idMatiere = sc.nextInt();
                                Matiere matiere = matieres.findMatiereById(idMatiere);
                                if (matiere == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        choix = menu.menuPrincipale();
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (matieres.delete(idMatiere) == 1) {
                                        System.out.println("Matiere a ete supprimer avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'une matiere");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuMatiere("Gestion des Matieres");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier uue matiere: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            //Return;
                            case 5: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    if (choice == 0) choix = 0;
                    break;
                }
                //Getion des ensiegnants
                case 5: {
                    choice = menu.menuEnseignants("Getion des des ensiegnants");
                    while (choice != 0) {
                        switch (choice) {
                            //list des ensiegnants;
                            case 1: {
                                System.out.println("List des ensiegnants");
                                for (Ensiegnant ensiegnant : ensiegnants.getEnsiegnants()) {
                                    System.out.println(ensiegnant.toString());
                                }
                                // break point
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    Menu.clearConsole();
                                    choice = menu.menuEnseignants("Getion des des ensiegnants");

                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    choix = menu.menuPrincipale();
                                    Menu.clearConsole();
                                }
                                break;
                            }
                            // add ensiegnant
                            case 2: {
                                if (ensiegnants.add(createEnsiegnant()) == 1) {
                                    System.out.println("Ensiegnant a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez ajouter un autre ensiegnant(true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! nom ou id deja exist!!");
                                    // break point
                                    if (menu.question("Essaye a nouveau(True/False)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        // pour continue
                                        choice = menu.menuEnseignants("Gestion des ensiegnants");
                                        break;
                                    }
                                }
                                choice = menu.menuCollege("Gestion des ensiegnants");
                                break;
                            }
                            // delete ensiegnants
                            case 3: {
                                Scanner scanner = new Scanner(System.in);
                                System.out.println("Entrer id de ensiegnants: ");
                                int id = scanner.nextInt();
                                Matiere matiere = matieres.findMatiereById(id);
                                if (matiere == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        choix = menu.menuPrincipale();
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (matieres.delete(id) == 1) {
                                        System.out.println("Ensiegnant a ete supprimer avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    } else {
                                        System.out.println("Error! leur de suprission d'une ensiegnants");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuEnseignants("Gestion des ensiegnants");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier uue ensiegnants: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            //Return;
                            case 5: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    if (choice == 0) choix = 0;
                    break;
                }
                //Getion des etudaints
                case 6: {
                    choice = menu.menuEtudiant("Getion des des etudaints");
                    while (choice != 0) {
                        switch (choice) {
                            //list
                            case 1: {
                                System.out.println("List des etudaints");
                                Scanner scanner = new Scanner(System.in);
                                System.out.print("Voir la list complete ou court?(p/r): ");
                                String l = scanner.next();
                                for (Etudiant etudiant : etudiants.getEtudiants()) {
                                    if (l.toLowerCase().charAt(0) == "complete".toLowerCase().charAt(3) || l.toLowerCase().charAt(3) == "complete".toLowerCase().charAt(3))
                                        System.out.println(etudiant.toString());
                                    else
                                        System.out.println(etudiant.getId() + " - " + etudiant.getLastname() + " - " + etudiant.getEmail());
                                }
                                // break point
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    Menu.clearConsole();
                                    choice = menu.menuEtudiant("Getion des des etudaints");

                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    choix = menu.menuPrincipale();
                                    Menu.clearConsole();
                                }
                                break;
                            }
                            // add
                            case 2: {
                                if (etudiants.add(createEtudiant()) == 1) {
                                    System.out.println("Etudaint a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez ajouter un autre etudaint(true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! nom ou id deja exist!!");
                                    // break point
                                    if (menu.question("Essaye a nouveau(True/False)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                }
                                choice = menu.menuEtudiant("Gestion des etudaints");
                                break;
                            }
                            // delete
                            case 3: {
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer une id: ");
                                int id = sc.nextInt();
                                Ensiegnant ensiegnant = ensiegnants.findMatiereById(id);
                                if (ensiegnant == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (ensiegnants.delete(id) == 1) {
                                        System.out.println("Etudaint a ete supprimer avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            choix = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    else {
                                        System.out.println("Error! leur de suprission d'un etudaint");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            choix = menu.menuPrincipale();
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuEtudiant("Gestion des etudaints");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier uu etudaint: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            //Return;
                            case 5: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    if (choice == 0) choix = 0;
                    break;
                }
                //Getion des Groups
                case 7: {
                    choice = menu.menuGroups("Getion des des Groups");
                    while (choice != 0) {
                        switch (choice) {
                            //list
                            case 1: {
                                System.out.println("List des Groups");
                                for (Group  group: groups.getGroups())
                                    System.out.println(group.toString());
                                // break point
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    Menu.clearConsole();
                                    choice = menu.menuGroups("Getion des des Groups");

                                } else {
                                    // Trie + search
                                    System.out.println("Desole pas encore developpe");
                                    choice = 0;
                                    choix = menu.menuPrincipale();
                                    Menu.clearConsole();
                                }
                                break;
                            }
                            // add
                            case 2: {
                                if (groups.add(createGroup()) == 1) {
                                    System.out.println("Groups a ete cree avec success");
                                    // break point
                                    if (menu.question("Vous-voulez ajouter un autre Groups(true/false)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    System.out.println("Error! nom ou id deja exist!!");
                                    // break point
                                    if (menu.question("Essaye a nouveau(True/False)").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 2;
                                        Menu.clearConsole();
                                        break;
                                    }
                                }
                                choice = menu.menuGroups("Gestion des Groups");
                                break;
                            }
                            // delete
                            case 3: {
                                Scanner sc = new Scanner(System.in);
                                System.out.println("Entrer une id: ");
                                int id = sc.nextInt();
                                Group group = groups.findMatiereById(id);
                                if (group == null) {
                                    Menu.clearConsole();
                                    System.out.println("Error: L'id inserer n'existe pas");
                                    if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                        choice = 3;
                                        Menu.clearConsole();
                                        break;
                                    } else {
                                        choice = 0;
                                        Menu.clearConsole();
                                        break;
                                    }
                                } else {
                                    if (ensiegnants.delete(id) == 1) {
                                        System.out.println("Group a ete supprimer avec success");
                                        // break point
                                        if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("false".toLowerCase().charAt(0))) {
                                            choice = 0;
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    else {
                                        System.out.println("Error! leur de suprission d'un Group");
                                        if (menu.question("Vous-voulez essaye de nouveau(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                            choice = 3;
                                            Menu.clearConsole();
                                            break;
                                        } else {
                                            choice = 0;
                                            choix = menu.menuPrincipale();
                                            Menu.clearConsole();
                                            break;
                                        }
                                    }
                                    Menu.clearConsole();
                                    choice = menu.menuGroups("Gestion des Groups");
                                    break;
                                }
                            }
                            // Update
                            case 4: {
                                System.out.print("Modifier uu Groups: ");
                                System.out.print("encore!! ");
                                if (menu.question("Vous-voulez continue(true/false): ").toLowerCase().charAt(0) == ("true".toLowerCase().charAt(0))) {
                                    choice = 0;
                                    Menu.clearConsole();
                                    break;
                                } else {
                                    choice = 0;
                                    choix = 0;
                                    Menu.clearConsole();
                                    break;
                                }
                            }
                            //Return;
                            case 5: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                            //default
                            default: {
                                choice = 0;
                                Menu.clearConsole();
                                choix = menu.menuPrincipale();
                                break;
                            }
                        }
                    }
                    if (choice == 0) choix = 0;
                    break;
                }
                //Default Open menu principale
                default: {
                    Menu.clearConsole();
                    choix = menu.menuPrincipale();
                    break;
                }
            }
        }


        System.out.println("\t\t=======================Merci pour votre visite!=======================");
        System.out.println("\t\t==============================WinAcademy==============================");

    }

    private static Group createGroup() {
        try {
            Scanner scanner = new Scanner(System.in);
            Group group = new Group();
            System.out.println("\t\t==============================Ajouter un group==============================");
            System.out.print("\n Id: ");
            group.setId(scanner.nextInt());
            System.out.print("\n Nom: ");
            group.setName(scanner.next());
            System.out.print("\n Id departement: ");
            group.setIdCollege(scanner.nextInt());
            return group;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createGroup();
        }
    }

    private static Ensiegnant createEnsiegnant() {
        try {
            Scanner scanner = new Scanner(System.in);
            Ensiegnant ensiegnant = new Ensiegnant();
            System.out.println("\t\t==============================Ajouter un Ensiegnant==============================");
            System.out.print("\nId: ");
            ensiegnant.setId(scanner.nextInt());
            System.out.print("\nPrenom: ");
            ensiegnant.setFirstname(scanner.next());
            System.out.print("\nNom: ");
            ensiegnant.setLastname(scanner.next());
            System.out.print("\nEmail: ");
            ensiegnant.setEmail(scanner.next());
            System.out.print("\nphone: ");
            ensiegnant.setPhone(scanner.next());
            System.out.print("\nPassword: ");
            ensiegnant.setPassword(scanner.next());
            System.out.print("\nStatus: ");
            ensiegnant.setStatus(scanner.nextBoolean());
            System.out.print("\nId Matiere: ");
            ensiegnant.setId_matiere(scanner.nextInt());
            System.out.print("\nId departement: ");
            ensiegnant.setId_departement(scanner.nextInt());
            ensiegnant.setDateFonction(LocalDate.now());
            return ensiegnant;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createEnsiegnant();
        }
    }

    private static Etudiant createEtudiant() {
        try {
            Scanner scanner = new Scanner(System.in);
            Etudiant etudiant = new Etudiant();
            System.out.println("\t\t==============================Ajouter un Etudiant==============================");
            System.out.print("\nId: ");
            etudiant.setId(scanner.nextInt());
            System.out.print("\nPrenom: ");
            etudiant.setFirstname(scanner.next());
            System.out.print("\nNom: ");
            etudiant.setLastname(scanner.next());
            System.out.print("\nEmail: ");
            etudiant.setEmail(scanner.next());
            System.out.print("\nphone: ");
            etudiant.setPhone(scanner.next());
            System.out.print("\nPassword: ");
            etudiant.setPassword(scanner.next());
            System.out.print("\nStatus: ");
            etudiant.setStatus(scanner.nextBoolean());
            etudiant.setAnneeEntree(LocalDate.now());
            return etudiant;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createEtudiant();
        }
    }

    private static Matiere createMatiere() {
        try {
            Scanner scanner = new Scanner(System.in);
            Matiere matiere = new Matiere();
            System.out.println("\t\t==============================Ajouter une matiere==============================");
            System.out.print("\nId: ");
            matiere.setId(scanner.nextInt());
            System.out.print("\nNom: ");
            matiere.setName(scanner.next());
            return matiere;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createMatiere();
        }
    }

    private static Salle createSalle() {
        try {
            Scanner scanner = new Scanner(System.in);
            Salle salle = new Salle();
            System.out.println("\t\t==============================Ajouter un college==============================");
            System.out.print("\nNumero: ");
            salle.setNum(scanner.nextLine());
            System.out.print("\nCapacite: ");
            salle.setCapacite(scanner.nextInt());
            return salle;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createSalle();
        }
    }

    private static Departement createDepartement() {
        try {
            Scanner scanner = new Scanner(System.in);
            Departement departement = new Departement();
            System.out.println("\t\t==============================Ajouter un departement==============================");
            System.out.print("\nId: ");
            departement.setId(scanner.nextInt());
            System.out.print("\nNom: ");
            departement.setName(scanner.next());
            System.out.print("\nId College: ");
            departement.setIdCollege(scanner.nextInt());
            System.out.print("\nDescription: ");
            departement.setDescription(scanner.next());
            return departement;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createDepartement();
        }
    }

    private static College createCollege() {
        try {
            Scanner scanner = new Scanner(System.in);
            College college = new College();
            System.out.println("\t\t==============================Ajouter une salle==============================");
            System.out.print("\nNumero: ");
            college.setNum(scanner.nextInt());
            System.out.print("\nLe nom: ");
            college.setName(scanner.next());
            System.out.print("\nId adresse: ");
            college.setIdAddress(scanner.nextInt());
            System.out.print("\nSite: ");
            college.setSite(scanner.next());
            return college;
        } catch (Exception e) {
            System.out.println(e.getMessage() + " Error leur d'entrer des informations essaye a nouveau:");
            return createCollege();
        }
    }
}