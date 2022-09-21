CREATE TABLE IF NOT EXISTS adresse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ville VARCHAR(30),
    pays VARCHAR(30),
    code_postal VARCHAR(20),
    adresse VARCHAR (100)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS college (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    site VARCHAR(50),
    id_adresse INT ,
    FOREIGN KEY id_adresse REFERENCES adresse(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS departement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR (255),
    id_college INT,
    FOREIGN KEY id_college REFERENCES college(numero)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(30) UNIQUE,
    password VARCHAR(50),
    status VARCHAR (30)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matiere (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS enseignant (
    id INT AUTO_INCREMENT,
    dateFonction Date,
    PRIMARY KEY (id),
    id_user INT ,
    FOREIGN KEY id_user REFERENCES user(id),
    id_matiere INT,
    FOREIGN KEY id_matiere REFERENCES matiere (id) 
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (30) UNIQUE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user_role (
    id_user INT,
    FOREIGN KEY id_user REFERENCES user(id),
    id_role INT,
    FOREIGN KEY  REFERENCES role(id),
    date DATE,
    PRIMARY KEY (id_user, id_role, date)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS etudiant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    anneeEntree DATE,
    id_user INT,
    FOREIGN KEY id_user REFERENCES user(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS evaluation (
    id_etudiant INT,
    FOREIGN KEY id_etudiant REFERENCES etudiant(id),
    id_matiere INT, 
    FOREIGN KEY id_matiere REFERENCES matiere (id),
    date DATE,
    note DOUBLE,
    PRIMARY KEY (id_etudiant, id_matiere, date)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS responsable (
    id_enseignant INT,
    FOREIGN KEY (id_enseignant) REFERENCES enseignant (id),
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id),
    dateDebut DATE,
    dateFin DATE,
    PRIMARY KEY (id_enseignant, id_departement, dateDebut)
)ENGINE=InnoDB;