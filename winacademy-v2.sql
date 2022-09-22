-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 22 sep. 2022 à 13:16
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `ville`, `pays`, `code_postal`, `adresse`) VALUES
(1, 'Youssoufia', 'Maroc', '46300', 'Numero 143 Mohammed El khatib Qu El Mohammadi'),
(2, 'Safi', 'Maroc', '46000', '3 rue El Manfalouti Qu El Massira'),
(3, 'Meknes', 'Maroc', '40000', 'N 43 rue sebtah Qu El Minzeh'),
(4, 'Marrakech', 'Maroc', '42300', 'Lo 32 rue Nakhil Qu Molaki'),
(5, 'Casablanca', 'Maroc', '34000', 'Lot 43 N 19 Qu El Mosteqbal Sidi Maarouf'),
(6, 'Casablanca', 'Maroc', '34500', 'adresse casa 1'),
(7, 'Taza', 'Maroc', '50000', 'adresse casa 2'),
(8, 'Berlin', 'Germany', '160000', 'adresse berlin 1'),
(9, 'Moscow', 'Russie', '20300', 'this is moscow'),
(10, 'Zenit', 'Russie', '170002', 'this is zenit san pitarsbeurg'),
(11, 'Munich', 'Germany', '232324', 'Munich MoKataa');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `college`
--

INSERT INTO `college` (`numero`, `name`, `site`, `id_adresse`) VALUES
(1, 'Moussa Ibn Tachfin', 'www.moussa.ma', 1),
(2, 'Youcode', 'www.Youcode.ma', 2),
(3, 'Kachkat', 'www.kachkat.ma', 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `name`, `description`, `id_college`) VALUES
(1, 'informatique', 'this is desc 1', 1),
(2, 'informatique', 'this is desc 2', 2),
(3, 'informatique', 'this is desc 3', 3),
(4, 'Math', 'this is desc 4', 1),
(5, 'Math', 'this is desc 4', 2),
(6, 'Math', 'this is desc 4', 3),
(7, 'Islamic', 'this is desc 5', 1),
(8, 'Islamic', 'this is desc 5', 2),
(9, 'Islamic', 'this is desc 5', 3),
(10, 'Arabe', 'this is desc 2', 1),
(11, 'Arabe', 'this is desc 2', 2),
(12, 'Arabe', 'this is desc 2', 3),
(13, 'Français', 'this is desc 10', 1),
(14, 'Français', 'this is desc 10', 2),
(15, 'Français', 'this is desc 10', 3);

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
('2022-01-05', 1, 1, 1),
('2022-11-23', 2, 2, 1),
('2022-12-12', 3, 3, 2),
('2022-12-12', 4, 4, 2),
('2022-12-12', 5, 5, 2),
('2022-12-12', 6, 4, 2),
('2022-09-12', 7, 3, 1),
('2022-12-12', 34, 2, 2),
('2022-07-12', 35, 5, 2);

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
('2020-09-01', 8),
('2020-09-01', 9),
('2020-09-01', 10),
('2020-09-01', 11),
('2020-09-01', 12),
('2020-09-01', 13),
('2020-09-01', 14),
('2020-09-01', 15),
('2020-09-01', 16),
('2020-09-01', 17),
('2020-09-01', 18),
('2020-09-01', 19),
('2020-09-01', 20),
('2020-09-01', 21),
('2020-09-01', 22),
('2020-09-01', 23),
('2020-09-01', 24),
('2020-09-01', 25),
('2020-09-01', 26),
('2020-09-01', 27),
('2020-09-01', 28),
('2020-09-01', 29),
('2020-09-01', 30),
('2020-09-01', 31),
('2020-09-01', 32),
('2020-09-01', 33);

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
(8, 1, '2021-11-12', 8),
(8, 2, '2022-01-12', 8),
(8, 3, '2021-03-12', 8),
(8, 4, '2021-04-12', 8),
(8, 5, '2021-06-12', 8),
(9, 1, '2021-11-12', 12),
(9, 2, '2022-01-12', 12),
(9, 3, '2021-03-12', 12),
(9, 4, '2021-04-12', 12),
(9, 5, '2021-06-12', 12),
(10, 1, '2021-11-12', 9),
(10, 2, '2022-01-12', 9),
(10, 3, '2021-03-12', 9),
(10, 4, '2021-04-12', 9),
(10, 5, '2021-06-12', 9),
(11, 1, '2021-11-12', 17),
(11, 2, '2022-01-12', 17),
(11, 3, '2021-03-12', 17),
(11, 4, '2021-04-12', 17),
(11, 5, '2021-06-12', 17),
(12, 1, '2021-11-12', 13),
(12, 2, '2022-01-12', 13),
(12, 3, '2021-03-12', 13),
(12, 4, '2021-04-12', 13),
(12, 5, '2021-06-12', 13),
(13, 1, '2021-11-12', 16),
(13, 2, '2022-01-12', 16),
(13, 3, '2021-03-12', 16),
(13, 4, '2021-04-12', 16),
(13, 5, '2021-06-12', 16),
(14, 1, '2021-11-12', 12),
(14, 2, '2022-01-12', 12),
(14, 3, '2021-03-12', 12),
(14, 4, '2021-04-12', 12),
(14, 5, '2021-06-12', 12),
(15, 1, '2021-11-12', 12),
(15, 2, '2022-01-12', 12),
(15, 3, '2021-03-12', 12),
(15, 4, '2021-04-12', 12),
(15, 5, '2021-06-12', 12),
(16, 1, '2021-11-12', 9),
(16, 2, '2022-01-12', 9),
(16, 3, '2021-03-12', 9),
(16, 4, '2021-04-12', 9),
(16, 5, '2021-06-12', 9),
(17, 1, '2021-11-12', 12),
(17, 2, '2022-01-12', 12),
(17, 3, '2021-03-12', 12),
(17, 4, '2021-04-12', 12),
(17, 5, '2021-06-12', 12),
(18, 1, '2021-11-12', 12),
(18, 2, '2022-01-12', 12),
(18, 3, '2021-03-12', 12),
(18, 4, '2021-04-12', 12),
(18, 5, '2021-06-12', 12),
(19, 1, '2021-11-12', 16),
(19, 2, '2022-01-12', 16),
(19, 3, '2021-03-12', 16),
(19, 4, '2021-04-12', 16),
(19, 5, '2021-06-12', 16),
(20, 1, '2021-11-12', 14),
(20, 2, '2022-01-12', 14),
(20, 3, '2021-03-12', 14),
(20, 4, '2021-04-12', 14),
(20, 5, '2021-06-12', 14),
(21, 1, '2021-11-12', 12),
(21, 2, '2022-01-12', 12),
(21, 3, '2021-03-12', 12),
(21, 4, '2021-04-12', 12),
(21, 5, '2021-06-12', 12),
(22, 1, '2021-11-12', 16),
(22, 2, '2022-01-12', 16),
(22, 3, '2021-03-12', 16),
(22, 4, '2021-04-12', 16),
(22, 5, '2021-06-12', 16),
(23, 1, '2021-11-12', 12),
(23, 2, '2022-01-12', 12),
(23, 3, '2021-03-12', 12),
(23, 4, '2021-04-12', 12),
(23, 5, '2021-06-12', 12),
(24, 1, '2021-11-12', 16),
(24, 2, '2022-01-12', 16),
(24, 3, '2021-03-12', 16),
(24, 4, '2021-04-12', 16),
(24, 5, '2021-06-12', 16),
(25, 1, '2021-11-12', 12),
(25, 2, '2022-01-12', 12),
(25, 3, '2021-03-12', 12),
(25, 4, '2021-04-12', 12),
(25, 5, '2021-06-12', 12),
(26, 1, '2021-11-12', 16),
(26, 2, '2022-01-12', 16),
(26, 3, '2021-03-12', 16),
(26, 4, '2021-04-12', 16),
(26, 5, '2021-06-12', 16),
(27, 1, '2021-11-12', 12),
(27, 2, '2022-01-12', 12),
(27, 3, '2021-03-12', 12),
(27, 4, '2021-04-12', 12),
(27, 5, '2021-06-12', 12),
(28, 1, '2021-11-12', 16),
(28, 2, '2022-01-12', 16),
(28, 3, '2021-03-12', 16),
(28, 4, '2021-04-12', 16),
(28, 5, '2021-06-12', 16),
(29, 1, '2021-11-12', 12),
(29, 2, '2022-01-12', 12),
(29, 3, '2021-03-12', 12),
(29, 4, '2021-04-12', 12),
(29, 5, '2021-06-12', 12),
(30, 1, '2021-11-12', 16),
(30, 2, '2022-01-12', 16),
(30, 3, '2021-03-12', 16),
(30, 4, '2021-04-12', 16),
(30, 5, '2021-06-12', 16),
(31, 1, '2021-11-12', 12),
(31, 2, '2022-01-12', 12),
(31, 3, '2021-03-12', 12),
(31, 4, '2021-04-12', 12),
(31, 5, '2021-06-12', 12),
(32, 1, '2021-11-12', 14),
(32, 2, '2022-01-12', 14),
(32, 3, '2021-03-12', 14),
(32, 4, '2021-04-12', 14),
(32, 5, '2021-06-12', 14),
(33, 1, '2021-11-12', 12),
(33, 2, '2022-01-12', 12),
(33, 3, '2021-03-12', 12),
(33, 4, '2021-04-12', 12),
(33, 5, '2021-06-12', 12);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `name`) VALUES
(1, 'Informatique'),
(2, 'Math'),
(3, 'Français'),
(4, 'Arabe'),
(5, 'Islamic');

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
  KEY `id_departement` (`id_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`id_enseignant`, `id_departement`, `dateDebut`, `dateFin`) VALUES
(1, 1, '2020-12-12', '2021-12-12'),
(2, 2, '2020-12-12', '2021-01-12'),
(3, 3, '2020-12-12', '2021-12-12'),
(4, 4, '2020-12-12', '2021-01-12'),
(5, 5, '2020-12-12', '2021-12-12'),
(6, 6, '2020-12-12', '2021-01-12'),
(7, 7, '2020-12-12', '2021-12-12');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Enseignant'),
(3, 'Etudiant');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `status`) VALUES
(1, 'Tayeb', 'SOUINI', 'tayebsouini@gmail.com', '0607189673', '1234', 0),
(2, 'Aymen', 'Darji', 'AymenDarji@gmail.com', '0607432661', '1234', 0),
(3, 'Abdelaziz', 'Afrakla', 'AbdelazizAfrakla@gmail.com', '0607439671', '1234', 0),
(4, 'Abdeslam', 'Loukili', 'Abdeslamloukili@gmail.com', '0607199523', '1234', 0),
(5, 'Abdessalam', 'Elboukri', 'AbdelBoukri@gmail.com', '060719532', '1234', 0),
(6, 'Maher', 'Nourdine', 'Maher@gmail.com', '0607185445', '1234', 0),
(7, 'Mourad', 'Esserakh', 'MouradEsserakh@gmail.com', '0607187806', '1234', 0),
(8, 'Fouad', 'Rawan', 'Fouadrawan@gmail.com', '0607180099', '1234', 0),
(9, 'Adil', 'Ellahya', 'AdilEllahya@gmail.com', '0607180343', '1234', 0),
(10, 'Mohamed', 'Bouzid', 'Mohamedbouzid@gmail.com', '0607089343', '1234', 0),
(11, 'hamza', 'hadmdi', 'hadmdi@gmail.com', '0607189343', '1234', 0),
(12, 'Tayeb', 'hamidi', 'hamidi@gmail.com', '0697189671', '1234', 0),
(13, 'Aymen', 'hamzawi', 'hamzaoui@gmail.com', '0607432671', '1234', 0),
(14, 'Abdelaziz', 'haki', 'Abdelazizhaki@gmail.com', '0685439671', '1234', 0),
(15, 'Abdeslam', 'souiri', 'souiri@gmail.com', '0608199593', '1234', 0),
(16, 'hamza', 'harru', 'harry55@gmail.com', '060714532', '1234', 0),
(17, 'Maher', 'ghalibi', 'ghalibiMahir@gmail.com', '0607182445', '1234', 0),
(18, 'Mourad', 'essadiq', 'Mouradessadiq@gmail.com', '0607180896', '1234', 0),
(19, 'karim', 'radwouini', 'radwouini34@gmail.com', '0607150999', '1234', 0),
(20, 'Adil', 'elahya', 'elahya345@gmail.com', '0609089343', '1234', 0),
(21, 'Mohamed', 'krimo', 'krimo@gmail.com', '0608189343', '1234', 0),
(22, 'said', 'hadmdi', 'saidham444@gmail.com', '0607589343', '1234', 0),
(23, 'houria', 'houria', 'hassouni@gmail.com', '0607183671', '1234', 0),
(24, 'kamal', 'tariq', 'Kamal@gmail.com', '0607432971', '1234', 0),
(25, 'abdellah', 'hasnaoui', 'abdohasnaoui@gmail.com', '0605439671', '1234', 0),
(26, 'fatima', 'fati', 'fati@gmail.com', '0607119523', '1234', 0),
(27, 'hassan', 'yaeqoubi', 'yaeqoubi@gmail.com', '060718532', '1234', 0),
(28, 'hamza', 'nassiri', 'ghalibi@gmail.com', '0607185495', '1234', 0),
(29, 'yassine', 'essadiq', 'yassine66@gmail.com', '0607187296', '1234', 0),
(30, 'radouane', 'raji', 'radouane665@gmail.com', '0607180909', '1234', 0),
(31, 'Adil', 'mansouri', 'mansouri978@gmail.com', '0507189343', '1234', 1),
(32, 'khadija', 'touza', 'khadija@gmail.com', '0607989343', '1234', 0),
(33, 'saida', 'hssan', 'saidahssan@gmail.com', '0607889343', '1234', 0),
(34, 'abderahman', 'zahri', 'abderahman@gmail.com', '0607789343', '1234', 0),
(35, 'hafssa', 'twinssi', 'twinssihafssa@gmail.com', '0607689343', '1234', 0);

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
(1, 1, '2021-12-12'),
(2, 2, '2021-12-12'),
(3, 2, '2021-12-12'),
(4, 2, '2021-12-12'),
(5, 2, '2021-12-12'),
(6, 2, '2021-12-12'),
(7, 2, '2021-12-12'),
(8, 3, '2021-12-12'),
(9, 3, '2021-12-12'),
(10, 3, '2021-12-12'),
(11, 3, '2021-12-12'),
(12, 3, '2021-12-12'),
(13, 3, '2021-12-12'),
(14, 3, '2021-12-12'),
(15, 3, '2021-12-12'),
(16, 3, '2021-12-12'),
(17, 3, '2021-12-12'),
(18, 3, '2021-12-12'),
(19, 3, '2021-12-12'),
(20, 3, '2021-12-12'),
(21, 3, '2021-12-12'),
(22, 3, '2021-12-12'),
(23, 3, '2021-12-12'),
(24, 3, '2021-12-12'),
(25, 3, '2021-12-12'),
(26, 3, '2021-12-12'),
(27, 3, '2021-12-12'),
(28, 3, '2021-12-12'),
(29, 3, '2021-12-12'),
(30, 3, '2021-12-12'),
(31, 3, '2021-12-12'),
(32, 3, '2021-12-12'),
(33, 3, '2021-12-12');

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
