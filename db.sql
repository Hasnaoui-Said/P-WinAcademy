/*DROP DATABASE IF EXISTS P_winAcademy;*/

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
    FOREIGN KEY (id_adresse) REFERENCES adresse(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(30) UNIQUE,
    password VARCHAR(50),
    status VARCHAR (30)
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
    anneeEntree DATE,
    id_user INT PRIMARY KEY,
    FOREIGN KEY (id_user) REFERENCES users(id)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS departement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR (255),
    id_college INT,
    FOREIGN KEY (id_college) REFERENCES college(numero)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matiere (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS enseignant (
    dateFonction Date,
    id_user INT PRIMARY key,
    FOREIGN KEY (id_user) REFERENCES users(id),
    id_matiere INT,
    FOREIGN KEY (id_matiere) REFERENCES matiere (id) 
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS responsable (
    id_enseignant INT,
    FOREIGN KEY (id_enseignant) REFERENCES enseignant (id_user),
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id),
    dateDebut DATE,
    dateFin DATE,
    PRIMARY KEY (id_enseignant, id_departement, dateDebut)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS evaluation (
    id_etudiant INT,
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_user),
    id_matiere INT, 
    FOREIGN KEY (id_matiere) REFERENCES matiere (id),
    date DATE,
    note DOUBLE,
    PRIMARY KEY (id_etudiant, id_matiere, date)
)ENGINE=InnoDB;

INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Youssoufia', 'Maroc', '46300', 'Numero 143 Mohammed El khatib Qu El Mohammadi');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Safi', 'Maroc', '46000', '3 rue El Manfalouti Qu El Massira');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Meknes', 'Maroc', '40000', 'N 43 rue sebtah Qu El Minzeh');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Marrakech', 'Maroc', '42300', 'Lo 32 rue Nakhil Qu Molaki');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Casablanca', 'Maroc', '34000', 'Lot 43 N 19 Qu El Mosteqbal Sidi Maarouf');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Casablanca', 'Maroc', '34500', 'adresse casa 1');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Taza', 'Maroc', '50000', 'adresse casa 2');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Berlin', 'Germany', '160000', 'adresse berlin 1');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Moscow', 'Russie', '20300', 'this is moscow');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Zenit', 'Russie', '170002', 'this is zenit san pitarsbeurg');
INSERT INTO `adresse`(`ville`, `pays`, `code_postal`, `adresse`) VALUES ('Munich', 'Germany', '232324', 'Munich MoKataa');


INSERT INTO `college`(`name`, `site`, `id_adresse`) VALUES ('Moussa Ibn Tachfin', 'www.moussa.ma', 1);
INSERT INTO `college`(`name`, `site`, `id_adresse`) VALUES ('Youcode', 'www.Youcode.ma', 2);
INSERT INTO `college`(`name`, `site`, `id_adresse`) VALUES ('Kachkat', 'www.kachkat.ma', 3);


INSERT INTO `matiere`(`name`) VALUES ('Informatique');
INSERT INTO `matiere`(`name`) VALUES ('Math');
INSERT INTO `matiere`(`name`) VALUES ('Français');
INSERT INTO `matiere`(`name`) VALUES ('Arabe');
INSERT INTO `matiere`(`name`) VALUES ('Islamic');

INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('informatique', 'this is desc 1', 1);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('informatique', 'this is desc 2', 2);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('informatique', 'this is desc 3', 3);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Math', 'this is desc 4', 1);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Math', 'this is desc 4', 2);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Math', 'this is desc 4', 3);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Islamic', 'this is desc 5', 1);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Islamic', 'this is desc 5', 2);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Islamic', 'this is desc 5', 3);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Arabe', 'this is desc 2', 1);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Arabe', 'this is desc 2', 2);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Arabe', 'this is desc 2', 3);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Français', 'this is desc 10', 1);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Français', 'this is desc 10', 2);
INSERT INTO `departement`(`name`, `description`, `id_college`) VALUES ('Français', 'this is desc 10', 3);



INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Tayeb', 'SOUINI', 'tayebsouini@gmail.com', '0607189673', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Aymen', 'Darji', 'AymenDarji@gmail.com', '0607432661', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdelaziz', 'Afrakla', 'AbdelazizAfrakla@gmail.com', '0607439671','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdeslam', 'Loukili', 'Abdeslamloukili@gmail.com', '0607199523','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdessalam', 'Elboukri', 'AbdelBoukri@gmail.com', '060719532','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Maher', 'Nourdine', 'Maher@gmail.com', '0607185445','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Mourad', 'Esserakh', 'MouradEsserakh@gmail.com', '0607187806','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Fouad', 'Rawan', 'Fouadrawan@gmail.com', '0607180099','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Adil', 'Ellahya', 'AdilEllahya@gmail.com', '0607180343','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('Mohamed', 'Bouzid', 'Mohamedbouzid@gmail.com', '0607089343','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('hamza', 'hadmdi', 'hadmdi@gmail.com', '0607189343','1234', 'activated');

INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Tayeb', 'hamidi', 'hamidi@gmail.com', '0697189671', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Aymen', 'hamzawi', 'hamzaoui@gmail.com', '0607432671', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdelaziz', 'haki', 'Abdelazizhaki@gmail.com', '0685439671','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Abdeslam', 'souiri', 'souiri@gmail.com', '0608199593','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('hamza', 'harru', 'harry55@gmail.com', '060714532','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Maher', 'ghalibi', 'ghalibiMahir@gmail.com', '0607182445','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Mourad', 'essadiq', 'Mouradessadiq@gmail.com', '0607180896','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('karim', 'radwouini', 'radwouini34@gmail.com', '0607150999','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Adil', 'elahya', 'elahya345@gmail.com', '0609089343','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('Mohamed', 'krimo', 'krimo@gmail.com', '0608189343','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('said', 'hadmdi', 'saidham444@gmail.com', '0607589343','1234', 'activated');

INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('houria', 'houria', 'hassouni@gmail.com', '0607183671', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('kamal', 'tariq', 'Kamal@gmail.com', '0607432971', '1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('abdellah', 'hasnaoui', 'abdohasnaoui@gmail.com', '0605439671','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('fatima', 'fati', 'fati@gmail.com', '0607119523','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('hassan', 'yaeqoubi', 'yaeqoubi@gmail.com', '060718532','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('hamza', 'nassiri', 'ghalibi@gmail.com', '0607185495','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('yassine', 'essadiq', 'yassine66@gmail.com', '0607187296','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('radouane', 'raji', 'radouane665@gmail.com', '0607180909','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) 
VALUES ('Adil', 'mansouri', 'mansouri978@gmail.com', '0507189343','1234', 'disactivated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('khadija', 'touza', 'khadija@gmail.com', '0607989343','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('saida', 'hssan', 'saidahssan@gmail.com', '0607889343','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('abderahman', 'zahri', 'abderahman@gmail.com', '0607789343','1234', 'activated');
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`)
VALUES ('hafssa', 'twinssi', 'twinssihafssa@gmail.com', '0607689343','1234', 'activated');



INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/01/05',1,1);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/11/23',2,2);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/12/12',3,3);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/12/12',4,4);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/12/12',5,5);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/12/12',6,4);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/09/12',7,3);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/12/12',34,2);
INSERT INTO `enseignant`(`dateFonction`,`id_user`,`id_matiere`) VALUES ('2022/07/12',35,5);



INSERT INTO `role`(`name`) VALUES ('Admin');
INSERT INTO `role`(`name`) VALUES ('Enseignant');
INSERT INTO `role`(`name`) VALUES ('Etudiant');

INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (1,1,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (2,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (3,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (4,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (5,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (6,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (7,2,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (8,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (9,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (10,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (11,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (12,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (13,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (14,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (15,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (16,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (17,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (18,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (19,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (20,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (21,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (22,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (23,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (24,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (25,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (26,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (27,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (28,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (29,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (30,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (31,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (32,3,'2021/12/12');
INSERT INTO `user_role`(`id_user`,`id_role`,`date`)
VALUES (33,3,'2021/12/12');


INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',8);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',9);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',10);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',11);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',12);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',13);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',14);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',15);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',16);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',17);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',18);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',19);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',20);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',21);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',22);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',23);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',24);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',25);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',26);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',27);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',28);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',29);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',30);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',31);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',32);
INSERT INTO `etudiant`(`anneeEntree`, `id_user`) VALUES ('2020/09/01',33);


INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (8,1,'2021/11/12',8);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (9,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (10,1,'2021/11/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (11,1,'2021/11/12',17);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (12,1,'2021/11/12',13);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (13,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (14,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (15,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (16,1,'2021/11/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (17,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (18,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (19,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (20,1,'2021/11/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (21,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (22,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (23,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (24,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (25,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (26,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (27,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (28,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (29,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (30,1,'2021/11/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (31,1,'2021/11/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (32,1,'2021/11/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (33,1,'2021/11/12',12);

INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (8,2,'2022/1/12',8);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (9,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (10,2,'2022/1/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (11,2,'2022/1/12',17);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (12,2,'2022/1/12',13);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (13,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (14,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (15,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (16,2,'2022/1/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (17,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (18,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (19,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (20,2,'2022/1/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (21,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (22,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (23,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (24,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (25,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (26,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (27,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (28,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (29,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (30,2,'2022/1/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (31,2,'2022/1/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (32,2,'2022/1/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (33,2,'2022/1/12',12);

INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (8,3,'2021/3/12',8);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (9,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (10,3,'2021/3/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (11,3,'2021/3/12',17);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (12,3,'2021/3/12',13);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (13,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (14,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (15,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (16,3,'2021/3/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (17,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (18,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (19,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (20,3,'2021/3/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (21,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (22,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (23,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (24,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (25,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (26,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (27,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (28,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (29,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (30,3,'2021/3/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (31,3,'2021/3/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (32,3,'2021/3/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (33,3,'2021/3/12',12);

INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (8,4,'2021/4/12',8);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (9,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (10,4,'2021/4/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (11,4,'2021/4/12',17);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (12,4,'2021/4/12',13);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (13,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (14,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (15,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (16,4,'2021/4/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (17,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (18,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (19,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (20,4,'2021/4/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (21,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (22,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (23,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (24,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (25,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (26,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (27,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (28,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (29,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (30,4,'2021/4/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (31,4,'2021/4/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (32,4,'2021/4/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (33,4,'2021/4/12',12);

INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (8,5,'2021/6/12',8);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (9,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (10,5,'2021/6/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (11,5,'2021/6/12',17);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (12,5,'2021/6/12',13);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (13,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (14,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (15,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (16,5,'2021/6/12',9);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (17,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (18,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (19,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (20,5,'2021/6/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (21,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (22,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (23,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (24,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (25,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (26,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (27,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (28,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (29,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (30,5,'2021/6/12',16);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (31,5,'2021/6/12',12);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (32,5,'2021/6/12',14);
INSERT INTO `evaluation`(`id_etudiant`, `id_matiere`, `date`, `note`) VALUES (33,5,'2021/6/12',12);





INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (1,1,'2020/12/12','2021/12/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (2,2,'2020/12/12','2021/1/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (3,3,'2020/12/12','2021/12/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (4,4,'2020/12/12','2021/1/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (5,5,'2020/12/12','2021/12/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (6,6,'2020/12/12','2021/1/12');
INSERT INTO `responsable`(`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES (7,7,'2020/12/12','2021/12/12');

