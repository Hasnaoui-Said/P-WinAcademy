
CREATE TABLE IF NOT EXISTS adresse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ville VARCHAR(30),
    pays VARCHAR(30),
    code_postal VARCHAR(20),
    adresse VARCHAR (100)
)ENGINE=INNODB;

INSERT INTO adresse (ville, pays, code_postal, adresse) VALUES ('Maroc', 'Youssoufia', '10002', 'Avenue Habib Bourguiba');
INSERT INTO adresse (ville, pays, code_postal, adresse) VALUES ('Maroc', 'Marrakech', '40002', 'Avenue ouad eddahab');

CREATE TABLE IF NOT EXISTS college (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    site VARCHAR(50),
    id_adresse INT ,
    FOREIGN KEY (id_adresse) REFERENCES adresse(id)
)ENGINE=InnoDB;

INSERT INTO college (name, site, id_adresse) VALUES ('Kachkat','www.ensi-uma.tn', 1);
INSERT INTO college (name, site, id_adresse) VALUES ('sidi mohamed', 'www.ensme.tn', 2);


/* create table group etudiant */ 
CREATE TABLE IF NOT EXISTS groupe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    id_college INT,
    FOREIGN KEY (id_college) REFERENCES college(numero)
)ENGINE=InnoDB;

INSERT INTO groupe (name, id_college) VALUES ('Groupe A', 1);
INSERT INTO groupe (name, id_college) VALUES ('Groupe B', 1);
INSERT INTO groupe (name, id_college) VALUES ('Groupe C', 1);
INSERT INTO groupe (name, id_college) VALUES ('Groupe AB', 2);
INSERT INTO groupe (name, id_college) VALUES ('Groupe BC', 2);
INSERT INTO groupe (name, id_college) VALUES ('Groupe CC', 2);

CREATE TABLE IF NOT EXISTS etudiant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(30),
    lastName VARCHAR(30),
    phone VARCHAR(30) UNIQUE,
    email VARCHAR(50) UNIQUE,
    gender VARCHAR(50),
    password VARCHAR(50),
    status BOOLEAN,
    anneeEntree DATE,
    id_Groupe INT,
    FOREIGN KEY (id_Groupe) REFERENCES groupe(id)
)ENGINE=InnoDB;


insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (1, 'said', '', 'pkopacek0@last.fm', 'Male', '913-286-9781', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (2, 'hassan', '', 'ocowpe1@cornell.edu', 'Male', '855-815-1172', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (3, 'saida', '', 'espoole2@ovh.net', 'Female', '828-547-0385', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (4, 'hassnae', '', 'ccaddy3@deviantart.com', 'Female', '531-686-4727', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (5, 'hakima', '', 'whassur4@usgs.gov', 'Female', '306-994-0410', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (6, 'moundir', '', 'jwhiteside5@tripadvisor.com', 'Male', '412-198-1494', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (7, 'hakim', '', 'hheining6@thetimes.co.uk', 'Male', '633-387-3038', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (8, 'jamal', '', 'kcourtier7@arstechnica.com', 'Male', '583-163-2224', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (9, 'malak', '', 'ecesaric8@nifty.com', 'Female', '998-544-5388', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (10, 'houria', '', 'dvalentinuzzi9@livejournal.com', 'Female', '255-309-3471', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (11, 'samir', '', 'dglasebrooka@facebook.com', 'Male', '576-884-1834', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (12, 'jalla', '', 'dborderb@whitehouse.gov', 'Female', '718-179-5164', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (13, 'mohamed', '', 'scloughtonc@uol.com.br', 'Male', '365-687-8139', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (14, 'balghit', '', 'hlardnard@utexas.edu', 'Male', '542-623-0969', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (15, 'soufia', '', 'skeablee@chicagotribune.com', 'Female', '452-369-0386', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (16, 'karim', '', 'ntommasif@sphinn.com', 'Male', '629-877-5205', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (17, 'hakima', '', 'cstadingg@wix.com', 'Female', '549-648-0520', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (18, 'said', '', 'aaustonh@barnesandnoble.com', 'Male', '732-907-7090', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (19, 'hasnaoui', '', 'aleaneyi@angelfire.com', 'Female', '931-995-9949', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (20, 'jabir', '', 'aroebyj@privacy.gov.au', 'Female', '136-217-1264', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (21, 'khadija', '', 'edollardk@cmu.edu', 'Female', '286-885-0186', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (22, 'qassim', '', 'malelsandrovichl@unc.edu', 'Male', '538-159-0225', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (23, 'amine', '', 'keselm@mediafire.com', 'Male', '158-967-4986', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (24, 'mahouli', '', 'jscocroftn@netlog.com', 'Female', '860-179-4691', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (25, 'fatima', '', 'hbirkso@wikispaces.com', 'Female', '125-749-9182', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (26, 'khalid', '', 'rwormstonep@trellian.com', 'Male', '545-615-9075', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (27, 'lkadih', '', 'jpikeq@squidoo.com', 'Male', '293-300-4705', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (28, 'rachid', '', 'tcrossbyr@cdbaby.com', 'Male', '669-883-9794', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (29, 'laarbi', '', 'wboydas@nps.gov', 'Male', '347-997-1344', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (30, 'laqja3', '', 'mbalcerst@cnn.com', 'Male', '672-609-6380', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (31, 'soumia', '', 'emilnesu@shareasale.com', 'Female', '129-167-7766', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (32, 'safae', '', 'hbusselv@bloomberg.com', 'Female', '171-690-8912', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (33, 'balha', '', 'dkeesew@ning.com', 'Female', '678-254-6597', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (34, 'hassouni', '', 'ddefreynex@wiley.com', 'Female', '469-765-9083', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (35, 'hamdellah', '', 'rferroy@jigsy.com', 'Male', '838-600-2888', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (36, 'ouassim', '', 'mzielinskiz@sbwire.com', 'Male', '659-374-1882', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (37, 'hafssa', '', 'fbasil10@apple.com', 'Female', '879-271-1375', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (38, 'karim', '', 'epoleykett11@liveinternet.ru', 'Male', '265-780-0277', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (39, 'hassnae', '', 'ebloan12@smh.com.au', 'Female', '512-367-8880', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (40, 'mina', '', 'sbarlass13@shinystat.com', 'Female', '720-184-1397', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (41, 'miloda', '', 'hhizir14@deliciousdays.com', 'Female', '754-322-1440', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (42, 'idress', '', 'bklementz15@typepad.com', 'Male', '621-361-3474', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (43, 'sanhaji', '', 'cskirling16@homestead.com', 'Male', '677-123-9622', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (44, 'khadija', '', 'wgulleford17@illinois.edu', 'Female', '513-140-7117', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (45, 'yahyaoui', '', 'vhairesnape18@desdev.cn', 'Male', '276-182-7173', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (46, 'touria', '', 'kcaulkett19@google.pl', 'Female', '936-845-9470', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (47, 'najiyya', '', 'bbantham1a@reference.com', 'Female', '915-513-5289', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (48, 'harri', '', 'cdenslow1b@ox.ac.uk', 'Female', '525-436-0597', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (49, 'wahmane', '', 'emaiden1c@networkadvertising.org', 'Male', '670-342-9602', 1, 1, NOW(), '123456');
insert into etudiant (id, firstName, lastName, email, gender, phone, id_groupe,status, anneeEntree, password) values (50, 'kalltoum', '', 'bwanden1d@prnewswire.com', 'Female', '253-158-2759', 1, 1, NOW(), '123456');

CREATE TABLE IF NOT EXISTS departement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR (255),
    id_college INT,
    FOREIGN KEY (id_college) REFERENCES college(numero),
    id_responsable INT
)ENGINE=InnoDB;

insert into departement (name, description, id_college, id_responsable) values ('departement1', 'departement1', 1, NULL);
insert into departement (name, description, id_college, id_responsable) values ('departement2', 'departement2', 1, NULL);
insert into departement (name, description, id_college, id_responsable) values ('departement3', 'departement3', 1, NULL);
insert into departement (name, description, id_college, id_responsable) values ('departement4', 'departement4', 1, NULL);
insert into departement (name, description, id_college, id_responsable) values ('departement5', 'departement5', 1, NULL);
insert into departement (name, description, id_college, id_responsable) values ('departement6', 'departement6', 1, NULL);

/* create table salle */
CREATE TABLE IF NOT EXISTS salle (
    num INT primary key,
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id)
)ENGINE=InnoDB;

INSERT INTO salle (num, id_departement) VALUES (1, 1); 
INSERT INTO salle (num, id_departement) VALUES (2, 2);
INSERT INTO salle (num, id_departement) VALUES (3, 3);
INSERT INTO salle (num, id_departement) VALUES (4, 4);
INSERT INTO salle (num, id_departement) VALUES (5, 5);
INSERT INTO salle (num, id_departement) VALUES (6, 6);

CREATE TABLE IF NOT EXISTS matiere (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50),
    salle INT,
    FOREIGN KEY (salle) REFERENCES salle(num)
)ENGINE=InnoDB;

INSERT INTO matiere (id, name, salle) VALUES (1, 'math', 1);
INSERT INTO matiere (id, name, salle) VALUES (2, 'physique', 2);
INSERT INTO matiere (id, name, salle) VALUES (3, 'chimie', 3);
INSERT INTO matiere (id, name, salle) VALUES (4, 'francais', 4);
INSERT INTO matiere (id, name, salle) VALUES (5, 'anglais', 5);
INSERT INTO matiere (id, name, salle) VALUES (6, 'arabe', 6);

CREATE TABLE IF NOT EXISTS enseignant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gender VARCHAR(10),
    firstName VARCHAR(30),
    lastName VARCHAR(30),
    phone VARCHAR(30) UNIQUE,
    email VARCHAR(50) UNIQUE,
    password VARCHAR(50),
    status BOOLEAN,
    dateFonction Date,
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id),
    id_matiere INT,
    FOREIGN KEY (id_matiere) REFERENCES matiere(id)
)ENGINE=InnoDB;

insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Muhammad', 'Spaughton', 'mspaughton0@imgur.com', 'Male', '983-148-2705', NOW(), 'x0huQsnRZZ', true, 1, 1);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Theodore', 'Gayforth', 'tgayforth1@aboutads.info', 'Male', '217-485-7375', NOW(), 'zUC8aGD', false, 2, 2);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Roda', 'Arkcoll', 'rarkcoll2@meetup.com', 'Female', '424-242-9999', NOW(), 'Uc6TP1RGQ', true, 3, 3);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Jonis', 'Farra', 'jfarra3@aboutads.info', 'Female', '917-712-3851', NOW(), '7hnGjX', false, 1, 1);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Cassie', 'Plet', 'cplet4@imgur.com', 'Female', '858-791-1099', NOW(), 'kZVMf7JNm', false, 4, 4);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Cameron', 'MacRorie', 'cmacrorie5@telegraph.co.uk', 'Male', '495-931-7209', NOW(), 'u4u30gWN0', true, 5, 5);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Woodie', 'Kreuzer', 'wkreuzer6@blog.com', 'Male', '180-328-7242', NOW(), 'aSdXdb', true, 1, 1);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Fredericka', 'Leetham', 'fleetham7@nih.gov', 'Female', '299-305-8113', NOW(), 'm3Eyr6n', true, 5, 5);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Dimitri', 'Rizzo', 'drizzo8@symantec.com', 'Male', '565-736-1478', NOW(), 'YHg2nP', true, 6, 6);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Devina', 'Matteuzzi', 'dmatteuzzi9@infoseek.co.jp', 'Female', '883-292-7782', NOW(), 'xUIhP7iXaD', true, 2, 2);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Gwen', 'Iowarch', 'giowarcha@hibu.com', 'Female', '787-841-4633',NOW(), 'tril1WKB', false, 3, 3);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Ermanno', 'Innett', 'einnettb@dmoz.org', 'Male', '936-326-5453', NOW(), 't73mmCDD', true, 1, 1);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Andra', 'Labes', 'alabesc@skype.com', 'Female', '216-937-9324', NOW(), 'klV9wz', false, 4, 4);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Rickie', 'Fitch', 'rfitchd@barnesandnoble.com', 'Male', '554-419-1347', NOW(), 'gZ4o2On97vh3', false, 2, 2);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Arlina', 'McEnhill', 'amcenhille@mayoclinic.com', 'Female', '947-383-9260', NOW(), 'rwfAad9', true, 5, 5);
insert into enseignant (firstName, lastName, email, gender, phone, dateFonction, password, status, id_departement, id_matiere) values ('Archibold', 'Yellep', 'ayellepf@etsy.com', 'Male', '639-881-6357', NOW(), 'xrGJ0g', true, 6, 6);

/* create table note */
CREATE TABLE IF NOT EXISTS note (
    note float,
    id_etudiant INT,
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    id_matiere INT,
    FOREIGN KEY (id_matiere) REFERENCES matiere(id)
)ENGINE=InnoDB;


/* create table assiegnement */
CREATE TABLE IF NOT EXISTS assiegnement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_Groupe INT,
    FOREIGN KEY (id_Groupe) REFERENCES groupe(id),
    id_Enseignant INT,
    FOREIGN KEY (id_Enseignant) REFERENCES enseignant(id)
)ENGINE=InnoDB;

INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 1);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 2);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 3);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 4);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 5);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (1, 6);

INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 1);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 2);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 3);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 4);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 5);
INSERT INTO assiegnement (id_Groupe, id_Enseignant) VALUES (2, 6);

ALTER TABLE `departement` ADD CONSTRAINT `constraint_responsable_dept` FOREIGN KEY (`id_responsable`) REFERENCES `enseignant`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;