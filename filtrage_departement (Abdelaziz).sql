/*caclcule moyen des note par departements*/

SELECT AVG(note) FROM evaluation,etudiant,enseignant,departement WHERE evaluation.id_etudiant = etudiant.id_user AND evaluation.id_matiere = enseignant.id_matiere AND departement.id = enseignant.id_departement AND departement.name = "Informatique" AND departement.id_college=5;

-- list des ensignants par departement

SELECT firstname FROM users,enseignant,departement WHERE users.id = enseignant.id_user AND departement.id = enseignant.id_departement AND departement.name = 'Informatique' AND departement.id_college = 5;

-- responsable de departements 

SELECT firstname, lastname FROM users,enseignant,responsable,departement WHERE users.id = enseignant.id_user AND responsable.id_enseignant = enseignant.id_user AND responsable.id_departement = departement.id AND departement.name = 'Informatique' AND departement.id_college = 5

-- matieres par deparetement 

SELECT matiere.name FROM matiere,departement,enseignant WHERE matiere.id = enseignant.id_matiere AND enseignant.id_departement = departement.id AND departement.name = 'Informatique' AND departement.id_college = 5

-- nomber des etudiants par departement 

SELECT COUNT(etudiant.id_user) FROM etudiant,departement,enseigner,enseignant WHERE enseigner.id_etudiant = etudiant.id_user AND enseignant.id_user = enseigner.id_enseignant AND enseignant.id_departement = departement.id AND departement.id_college = 5 AND departement.name = 'Maths'

-- filtrage des departements par name 

SELECT * FROM departement WHERE departement.name = 'Informatique'

-- filtrage des deartements par college 

SELECT * FROM departement,college WHERE departement.id_college = college.numero AND college.name = "Youcode Youssoufia"

