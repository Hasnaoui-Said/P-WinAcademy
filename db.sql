CREATE TABLE IF NOT EXISTS adresse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ville VARCHAR(30),
    pays VARCHAR(30),
    code_postal VARCHAR(20),
    adresse VARCHAR (100)
)ENGINE=INNODB;

INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) 
VALUES ('Youssoufia', 'Maroc', '46300', 'Numero 143 Mohammed El khatib Qu El Mohammadi');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Safi', 'Maroc', '46000', '3 rue El Manfalouti Qu El Massira');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Meknes', 'Maroc', '40000', 'N 43 rue sebtah Qu El Minzeh');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Marrakech', 'Maroc', '42300', 'Lo 32 rue Nakhil Qu Molaki');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Casablanca', 'Maroc', '34000', 'Lot 43 N 19 Qu El Mosteqbal Sidi Maarouf');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Casablanca', 'Maroc', '34500', 'adresse casa 1');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Taza', 'Maroc', '50000', 'adresse casa 2');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Berlin', 'Germany', '160000', 'adresse berlin 1');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Moscow', 'Russie', '20300', 'this is moscow');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Zenit', 'Russie', '170002', 'this is zenit san pitarsbeurg');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`)
VALUES ('Munich', 'Germany', '232324', 'Munich MoKataa');



CREATE TABLE IF NOT EXISTS college (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    site VARCHAR(50),
    id_adresse INT ,
    FOREIGN KEY (id_adresse) REFERENCES adresse(id)
)ENGINE=InnoDB;

INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('Moussa Ibn Tachfin', 'www.moussa.ma', 1);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('Youcode', 'www.Youcode.ma', 2);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('Kachkat', 'www.kachkat.ma', 3);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('ouadi el makhazin', 'www.makhazine.ma', 4);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 1', 'www.col1.ma', 5);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 2', 'www.col2.ma', 6);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 3', 'www.col3.ma', 7);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 4', 'www.col4.ma', 8);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 5', 'www.col5.ma', 9);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 6', 'www.col6.ma', 10);
INSERT INTO `college`(`name`, `site`, `id_adresse`)
VALUES ('col 7', 'www.col7.ma', 11);


CREATE TABLE IF NOT EXISTS departement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR (255),
    id_college INT,
    FOREIGN KEY (id_college) REFERENCES college(numero)
)ENGINE=InnoDB;

INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('informatique', 'this is desc 1', 5);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('informatique', 'this is desc 2', 6);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('informatique', 'this is desc 3', 7);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Math', 'this is desc 4', 5);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Islamic', 'this is desc 5', 5);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Arabe', 'this is desc 6', 5);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Math', 'this is desc 7', 6);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Arabe', 'this is desc 8', 6);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Français', 'this is desc 9', 5);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Français', 'this is desc 10', 6);
INSERT INTO `departement`(`name`, `description`, `id_college`) 
VALUES ('Islamic', 'this is desc 11', 7);


CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(30) UNIQUE,
    password VARCHAR(50),
    status VARCHAR (30)
)ENGINE=InnoDB;

INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Tayeb', 'SOUINI', 'Tayebsouini@gmail.com', '0607189671', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Aymen', 'Darji', 'AymenDarji@gmail.com', '0607432671', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdelaziz', 'Afrakla', 'AbdelazizAfrakla@gmail.com', '0605439671','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdeslam', 'Loukili', 'Abdeslamloukili@gmail.com', '0607189523','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdessalam', 'Elboukri', 'AbdelBoukri@gmail.com', '060718532','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Maher', 'Nourdine', 'Maher@gmail.com', '0607185445','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Mourad', 'Esserakh', 'MouradEsserakh@gmail.com', '0607187896','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Fouad', 'Rawan', 'Fouadrawan@gmail.com', '0607180999','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Adil', 'Ellahya', 'AdilEllahya@gmail.com', '0607189343','1234', 'disactivated');


CREATE TABLE IF NOT EXISTS matiere (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS enseignant (
    id INT AUTO_INCREMENT,
    dateFonction Date,
    PRIMARY KEY (id),
    id_user INT ,
    FOREIGN KEY (id_user) REFERENCES users(id),
    id_matiere INT,
    FOREIGN KEY (id_matiere) REFERENCES matiere (id) 
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (30) UNIQUE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user_role (
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    id_role INT,
    FOREIGN KEY (id_role) REFERENCES role(id),
    date DATE,
    PRIMARY KEY (id_user, id_role, date)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS etudiant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    anneeEntree DATE,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS evaluation (
    id_etudiant INT,
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    id_matiere INT, 
    FOREIGN KEY (id_matiere) REFERENCES matiere (id),
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