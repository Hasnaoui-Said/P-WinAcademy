-- nomber des etudiants qui etudier par ensignant

SELECT COUNT(etudiant.id_user) FROM etudiant,enseigner,users,enseignant WHERE etudiant.id_user = enseigner.id_etudiant AND enseignant.id_user = enseigner.id_enseignant AND enseignant.id_user = users.id AND users.email = "bouchra@simplon.ma";

-- isResponsable er no 

SELECT (CASE WHEN enseignant.id_user IN (SELECT responsable.id_enseignant FROM responsable ) THEN 'isResponsable' ELSE 'notResponsable' END) AS responsabilite FROM enseignant,users WHERE enseignant.id_user = users.id AND users.email = 'bouchra@simplon.ma';

-- matiere qui ensigner l'ensignant 

SELECT matiere.name FROM matiere,enseignant,users WHERE matiere.id = enseignant.id_matiere AND enseignant.id_user = users.id AND users.email = 'bouchra@simplon.ma'

-- filtrage des ensignants par dateFonction 

SELECT * FROM enseignant,users WHERE enseignant.dateFonction = '2022/09/01' AND enseignant.id_user = users.id 

-- filtrage des ensignant par matiere 

SELECT * FROM enseignant,users,matiere WHERE enseignant.id_matiere = matiere.id AND matiere.name = 'Java Angular' AND enseignant.id_user = users.id

-- filtrage des ensignants par departements 

SELECT * FROM enseignant,users,departement WHERE enseignant.id_departement = departement.id AND departement.name = 'Informatique' AND enseignant.id_user = users.id 