-- filrage de college
--par ville 
SELECT college.name FROM college, adresse
WHERE college.id_adresse = adresse.id 
AND adresse.ville = 'Youssoufia'
-- par pays 
SELECT college.name FROM college, adresse
WHERE college.id_adresse = adresse.id 
AND adresse.pays = 'Maroc'

-- Departement par college 
SELECT departement.name FROM departement, college
WHERE departement.id_college = college.numero AND college.numero = 5


-- nombre des etudiant par college
SELECT  COUNT(DISTINCT etudiant.id_user) FROM etudiant, evaluation, matiere, enseignant, departement, college
WHERE etudiant.id_user = evaluation.id_etudiant 
AND evaluation.id_matiere = matiere.id AND enseignant.id_matiere = matiere.id
AND enseignant.id_departement = departement.id AND departement.id_college = 3

-- Nombe d'étudiant par college
SELECT COUNT(DISTINCT etudiant.id_user) FROM etudiant, enseigner, enseignant, departement, college
WHERE etudiant.id_user = enseigner.id_etudiant AND enseigner.id_enseignant = enseignant.id_user
AND enseignant.id_departement = departement.id AND departement.id_college = 5

-- moyenne par college 
SELECT AVG(evaluation.note) FROM etudiant, enseigner, enseignant, departement, college, evaluation
WHERE etudiant.id_user = evaluation.id_etudiant AND etudiant.id_user = enseigner.id_etudiant AND enseigner.id_enseignant = enseignant.id_user
AND enseignant.id_departement = departement.id AND departement.id_college = 5


-- les enseignants par college 
SELECT DISTINCT users.firstname, users.lastname FROM users, enseignant, departement, college
WHERE college.numero = 4 AND departement.id_college = college.numero AND 
enseignant.id_departement = departement.id

-- matiere non evaluer
SELECT DISTINCT matiere.name FROM matiere, etudiant, evaluation, users
WHERE matiere.id NOT IN (SELECT evaluation.id_matiere FROM evaluation, etudiant
                         WHERE evaluation.id_etudiant = etudiant.id_user AND etudiant.id_user = 38)