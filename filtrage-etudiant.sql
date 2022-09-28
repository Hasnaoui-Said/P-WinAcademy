

/* la moyene de chaque etudiant */

SELECT users.firstname, SUM(note)/count(users.firstname) as `moyen` FROM users 
INNER JOIN evaluation ON evaluation.id_etudiant = users.id
GROUP BY users.firstname;

/* inforamation de chaque etudiants */
SELECT users.firstname, users.lastname, users.email, users.phone, users.status FROM etudiant 
    INNER JOIN users ON etudiant.id_user = users.id
where 1;

/* les etudiants active */
SELECT users.firstname, users.lastname, users.email, users.phone, users.status FROM etudiant 
    INNER JOIN users ON etudiant.id_user = users.id
where users.status = 1;


/* create table admin */
CREATE TABLE `admin` (
    id_user INT PRIMARY KEY,
    FOREIGN KEY (id_user) REFERENCES users(id),
    id_college INT,
    FOREIGN KEY (id_college) REFERENCES college(numero),
    createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) VALUES ('admin', 'admin', 'admin@gmail.com', '123456789', 'admin', 1);
INSERT INTO `users`(`firstname`, `lastname`, `email`, `phone`, `password`, `status`) VALUES ('admin2', 'admin2', 'admin2@gmail.com', '123556789', 'admin2', 1);

insert into admin (id_user, createAt, id_college) values (1, NOW(), 4);
insert into admin (id_user, createAt, id_college) values (53, NOW(), 5);

/* autant que admin on peut connecter au application */
select users.firstname, users.lastname, users.email, users.phone, users.status from users 
INNER JOIN admin ON users.id = admin.id_user
where users.password = 'admin' and users.email = 'admin@gmail.com';
/* autant que admin on peut update mes infos */
UPDATE `users` Set `firstname`='adminUpdate',`lastname`='adminUpdate',`email`='adminUpdate@gmail.com',`phone`='0642346477',`password`='root'
where users.id = (select id from users where users.password = 'admin' and users.email = 'admin@gmail.com');

/* autant que etudiant peut voir ses notes */
SELECT matiere.name, evaluation.note FROM `evaluation`
INNER JOIN matiere ON matiere.id = evaluation.id_matiere
WHERE evaluation.id_etudiant = 36;
