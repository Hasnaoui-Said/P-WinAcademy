/* setlect all matiere*/

SELECT * FROM `matiere` WHERE 1

/* select la moyene de chaque matiere*/

SELECT matiere.name, SUM(note)/count(matiere.name) as `evaluation.note` FROM matiere 
INNER JOIN evaluation ON evaluation.id_matiere = matiere.id 
GROUP BY matiere.name;


/* select les ensiegnant de chaque matiere */
SELECT users.lastname AS `Ensiegnant de matiere PHP` FROM `matiere` 
INNER JOIN enseignant ON enseignant.id_matiere = matiere.id 
INNER JOIN users ON enseignant.id_user = users.id 
WHERE matiere.name = 'PHP';


/* select les matieres evalue de chaque etudiants */
SELECT matiere.name FROM enseignant 
INNER JOIN enseigner ON enseigner.id_enseignant = enseignant.id_user
INNER JOIN etudiant ON enseigner.id_etudiant = etudiant.id_user
INNER JOIN matiere ON matiere.id = enseignant.id_matiere 
INNER JOIN departement ON departement.id = enseignant.id_departement
INNER JOIN college ON college.numero = departement.id_college
WHERE etudiant.id_user = 36;



/* la moyene d'un etudiant dans chaque matiere */
SELECT matiere.name FROM enseignant 
INNER JOIN enseigner ON enseigner.id_enseignant = enseignant.id_user
INNER JOIN etudiant ON enseigner.id_etudiant = etudiant.id_user
INNER JOIN matiere ON matiere.id = enseignant.id_matiere 
INNER JOIN departement ON departement.id = enseignant.id_departement
INNER JOIN college ON college.numero = departement.id_college
WHERE etudiant.id_user = 36;

/* la moyene de chaque matieres */

SELECT matiere.name, SUM(note)/count(matiere.name) as `moyen` FROM matiere 
INNER JOIN evaluation ON evaluation.id_matiere = matiere.id
GROUP BY matiere.name;

SELECT departement.name as `deparement name`, users.*, role.name as `role` FROM `departement` 
INNER JOIN responsable on departement.id = responsable.id_departement
INNER JOIN user_role ON user_role.id_user = responsable.id_enseignant
INNER JOIN role ON role.id = user_role.id_role
INNER JOIN users ON users.id = responsable.id_enseignant


SELECT *, AVG(evaluation.note) AS `moyen of matiere` FROM `evaluation` 
INNER JOIN matiere on matiere.id = evaluation.id_matiere
INNER JOIN etudiant ON etudiant.id_user = evaluation.id_etudiant
INNER  JOIN users ON users.id = evaluation.id_etudiant
INNER JOIN user_role ON user_role.id_user = etudiant.id_user
INNER JOIN role ON role.id = user_role.id_role
group by evaluation.id_etudiant, evaluation.id_matiere