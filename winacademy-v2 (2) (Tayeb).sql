-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 22 sep. 2022 à 20:03
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `winacademy-v2`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(30) DEFAULT NULL,
  `pays` varchar(30) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `ville`, `pays`, `code_postal`, `adresse`) VALUES
(12, 'Youssoufia', 'Maroc', '46300', 'Numero 1 rue Sebtah Qu El Mohammadi'),
(13, 'Safi', 'Maroc', '40000', 'N1 Rue Zelaka Qu El Massira');

-- --------------------------------------------------------

--
-- Structure de la table `college`
--

DROP TABLE IF EXISTS `college`;
CREATE TABLE IF NOT EXISTS `college` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `id_adresse` int DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `id_adresse` (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `college`
--

INSERT INTO `college` (`numero`, `name`, `site`, `id_adresse`) VALUES
(4, 'Youcode Safi', 'www.test1.ma', 12),
(5, 'Youcode Youssoufia', 'www.test2.ma', 13);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_college` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_college` (`id_college`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `name`, `description`, `id_college`) VALUES
(16, 'Informatique', 'dep 2 eme annee Youssoufia', 5),
(17, 'Maths', 'dep 1 ere annee Youssoufia', 5),
(18, 'Informatique', 'dep 2 eme annee Safi', 4),
(19, 'Arabe', 'dep 1 ere annee Safi', 4);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `dateFonction` date DEFAULT NULL,
  `id_user` int NOT NULL,
  `id_matiere` int DEFAULT NULL,
  `id_departement` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_matiere` (`id_matiere`),
  KEY `id_departement` (`id_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`dateFonction`, `id_user`, `id_matiere`, `id_departement`) VALUES
('2022-09-01', 44, 6, 16),
('2022-09-02', 45, 8, 17),
('2022-09-01', 46, 10, 17),
('2022-09-01', 47, 9, 17),
('2022-09-01', 48, 11, 16),
('2022-09-01', 49, 10, 17),
('2022-09-01', 50, 7, 16);

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

DROP TABLE IF EXISTS `enseigner`;
CREATE TABLE IF NOT EXISTS `enseigner` (
  `id_etudiant` int NOT NULL,
  `id_enseignant` int NOT NULL,
  `annee` date NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_enseignant`,`annee`),
  KEY `id_enseignant` (`id_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`id_etudiant`, `id_enseignant`, `annee`) VALUES
(36, 44, '2022-09-01'),
(37, 49, '2022-09-14');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `anneeEntree` date DEFAULT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`anneeEntree`, `id_user`) VALUES
('2022-09-01', 36),
('2022-09-01', 37),
('2022-09-01', 38),
('2022-09-01', 39),
('2022-09-01', 40),
('2022-09-01', 41),
('2022-09-01', 42),
('2022-09-01', 43);

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_etudiant` int NOT NULL,
  `id_matiere` int NOT NULL,
  `date` date NOT NULL,
  `note` double DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`,`id_matiere`,`date`),
  KEY `id_matiere` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id_etudiant`, `id_matiere`, `date`, `note`) VALUES
(36, 10, '2022-09-01', 13),
(36, 11, '2022-09-01', 17),
(36, 11, '2022-09-23', 20),
(37, 11, '2022-09-07', 19),
(38, 6, '2022-09-09', 20),
(38, 7, '2022-09-22', 13),
(38, 8, '2022-09-15', 15),
(38, 9, '2022-09-01', 10),
(38, 10, '2022-09-01', 9),
(38, 11, '2022-09-01', 9);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `name`) VALUES
(6, 'Java Angular'),
(7, 'JavaScript MERN'),
(8, 'JavaScript MEVN'),
(9, 'JavaScript MEAN'),
(10, 'PHP'),
(11, 'C#');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `id_enseignant` int NOT NULL,
  `id_departement` int NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date DEFAULT NULL,
  PRIMARY KEY (`id_enseignant`,`id_departement`,`dateDebut`),
  UNIQUE KEY `id_departement_date_unique` (`id_departement`,`dateDebut`),
  KEY `id_departement` (`id_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES
(44, 17, '2022-09-01', '2022-09-23'),
(45, 16, '2022-09-01', '2022-09-29'),
(47, 19, '2022-09-10', '2022-09-30'),
(50, 18, '2022-09-01', '2022-09-30');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(4, 'Admin'),
(5, 'Enseignant'),
(6, 'Etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `status`) VALUES
(36, 'Tayeb', 'SOUINI', 'Tayebsouini@gmail.com', '0607189671', '123', 1),
(37, 'Abdelaziz', 'Afrakla', 'Abdelaziz@gmail.com', '0607189672', '123', 1),
(38, 'Mohammed', 'Cheqouri', 'Mohammed@gmail.com', '0607189673', '123', 0),
(39, 'Amina', 'Moultamis', 'Amina@gmail.com', '0607189674', '123', 1),
(40, 'Sabir', 'Elkhaloufi', 'Sabir@gmail.com', '0607189675', '123', 1),
(41, 'Charifa', 'Safi', 'Charifa@gmail.com', '0607189676', '123', 0),
(42, 'Asmae', 'Maitite', 'Asmae@gmail.com', '0607189677', '123', 1),
(43, 'Charaf', 'Malik', 'Charaf@gmail.com', '0607189678', '123', 1),
(44, 'Bouchra', 'Merzak', 'Bouchra@simplon.ma', '060606060606', '1234', 1),
(45, 'Aymen', 'Benhima', 'Aymen@simplon.ma', '060606070606', '1234', 1),
(46, 'Youssef', 'Ouadid', 'Youssef@simplon.ma', '060608060606', '1234', 1),
(47, 'Ahmed', 'Rafie', 'Ahmed@simplon.ma', '060606090606', '1234', 1),
(48, 'Ilyas', 'Chakir', 'Ilyas@simplon.ma', '060606010606', '1234', 0),
(49, 'Hanane', 'Jab', 'Hanane@simplon.ma', '060606020606', '1234', 1),
(50, 'Abdelhafid', 'Fakir', 'Abdelhafid@simplon.ma', '060606030606', '1234', 1),
(51, 'Mourad', 'Jouahri', 'Mourad@simplon.ma', '060604060606', '1234', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id_user` int NOT NULL,
  `id_role` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`,`date`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`id_user`, `id_role`, `date`) VALUES
(51, 4, '2022-09-01'),
(44, 5, '2022-09-01'),
(45, 5, '2022-09-01'),
(46, 5, '2022-09-01'),
(47, 5, '2022-09-01'),
(48, 5, '2022-09-01'),
(49, 5, '2022-09-01'),
(50, 5, '2022-09-01'),
(36, 6, '2022-09-01'),
(37, 6, '2022-09-01'),
(38, 6, '2022-09-01'),
(39, 6, '2022-09-01'),
(40, 6, '2022-09-01'),
(42, 6, '2022-09-01'),
(43, 6, '2022-09-01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `college`
--
ALTER TABLE `college`
  ADD CONSTRAINT `college_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`id_college`) REFERENCES `college` (`numero`);

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `enseignant_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `enseignant_ibfk_3` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `enseigner_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_user`),
  ADD CONSTRAINT `enseigner_ibfk_2` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_user`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_user`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_user`),
  ADD CONSTRAINT `responsable_ibfk_2` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
