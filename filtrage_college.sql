-- filrage de college
--par ville 
SELECT college.name FROM college, adresse
WHERE college.id_adresse = adresse.id 
AND adresse.ville = 'Youssoufia'
-- par pays 
SELECT college.name FROM college, adresse
WHERE college.id_adresse = adresse.id 
AND adresse.pays = 'Maroc'

-- nombre des etudiant par college
SELECT  COUNT(DISTINCT etudiant.id_user) FROM etudiant, evaluation, matiere, enseignant, departement, college
WHERE etudiant.id_user = evaluation.id_etudiant 
AND evaluation.id_matiere = matiere.id AND enseignant.id_matiere = matiere.id
AND enseignant.id_departement = departement.id AND departement.id_college = 3

-- moyenne par college 
