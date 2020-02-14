-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 22 oct. 2019 à 12:11
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `id_chef` int(11) NOT NULL AUTO_INCREMENT,
  `nom_chef` varchar(45) NOT NULL,
  `prenom_chef` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `courriel` varchar(45) NOT NULL,
  PRIMARY KEY (`id_chef`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`id_chef`, `nom_chef`, `prenom_chef`, `password`, `courriel`) VALUES
(1, 'Bocuse', 'Paul', '1926', 'paul.bocuse@gmail.com'),
(2, 'Guerard', 'Michel', '1933', 'michel.guerard@gmai.com'),
(5, 'Robuchon', 'Joel', '1945', 'joe.robuchon@gmai.com');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) NOT NULL,
  `prenom_client` varchar(45) NOT NULL,
  `numero_rue` int(11) NOT NULL,
  `nom_rue` varchar(45) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `courriel` varchar(45) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `numero_rue`, `nom_rue`, `code_postal`, `ville`, `courriel`, `telephone`, `password`) VALUES
(1, 'DUPONT', 'Etienne', 4, 'Rue de l\'Abreuvoir', 96314, 'Paris', 'etienne.dupont@gmail.fr', '0665741232', '1234'),
(6, 'DUPUIS', 'Franck', 25, 'Rue des Fleurs', 92000, 'Paris', 'franck.dupuis@gmail.fr', '0665656565', '12345'),
(7, 'ROBBIE', 'Margaux', 45, 'Rue de Versailles', 71542, 'Paris', 'margot.robbie@gmail.com', '0621212121', '123456');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` datetime NOT NULL,
  `prix_total` decimal(10,2) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL,
  `statut_commande` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_commande_Client_idx` (`id_client`),
  KEY `fk_commande_Livreur1_idx` (`id_livreur`),
  KEY `fk_commande_statut_commande1_idx` (`statut_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `prix_total`, `id_client`, `id_livreur`, `statut_commande`) VALUES
(1, '2019-10-17 00:00:00', '22.00', 1, 1, 4),
(2, '2019-10-16 00:00:00', '20.90', 6, 2, 6),
(3, '2019-10-14 00:00:00', '22.00', 7, 3, 6),
(4, '2019-10-17 00:00:00', '26.40', 6, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id_livreur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_livreur` varchar(45) NOT NULL,
  `prenom_livreur` varchar(45) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `telephone_livreur` varchar(10) NOT NULL,
  `statut_livreur` int(11) NOT NULL,
  PRIMARY KEY (`id_livreur`),
  KEY `fk_livreur_statut_livreur1_idx` (`statut_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `nom_livreur`, `prenom_livreur`, `longitude`, `latitude`, `telephone_livreur`, `statut_livreur`) VALUES
(1, 'Baldassari', 'Jean ', '2.348800', '48.853400', '0606060606', 1),
(2, 'Abadie', 'René ', '2.349000', '48.965300', '0707070707', 3),
(3, 'Berthet', 'Marcel ', '2.363300', '48.858800', '0808080808', 4);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id_plat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(45) NOT NULL,
  `description_plat` varchar(255) NOT NULL,
  `prixHT_plat` decimal(10,2) NOT NULL,
  `type_plat` int(11) NOT NULL,
  `id_chef` int(11) NOT NULL,
  `TVA` float NOT NULL,
  PRIMARY KEY (`id_plat`),
  KEY `fk_Plat_TypePlat1_idx` (`type_plat`),
  KEY `fk_Plat_Editeur1_idx` (`id_chef`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`, `description_plat`, `prixHT_plat`, `type_plat`, `id_chef`, `TVA`) VALUES
(1, 'Baba au rhum', 'Savarin servi imbibé d\'un sirop au rhum.', '8.00', 1, 1, 0.1),
(5, 'Gâteau des anges', 'Gâteau moelleux et aéré à base de blancs d\'œufs montés en neige', '7.00', 1, 2, 0.1),
(7, 'Cassoulet', 'Ce n’est probablement pas le plat le plus léger que vous pourrez déguster en France. Originaire du Languedoc-Roussillon, ce plat est composé de haricots blancs, de cuisses de canard et de viande de porc (sous différentes formes).', '12.00', 2, 5, 0.1),
(9, 'Galettes bretonnes', 'Suite à un engouement gourmand, les crêperies bretonnes sont presque partout en France. Qu’est-ce qu’une galette ? Il s’agit d’une crêpe salée, réalisée avec de la farine de sarrasin, qui lui donne sa couleur grisée.', '12.00', 2, 1, 0.1);

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `id_commande` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `quantité` int(11) NOT NULL,
  `prixHT` decimal(10,2) NOT NULL,
  `TVA` float DEFAULT NULL,
  PRIMARY KEY (`id_commande`,`id_plat`),
  KEY `fk_Repas_Plat1_idx` (`id_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `repas`
--

INSERT INTO `repas` (`id_commande`, `id_plat`, `quantité`, `prixHT`, `TVA`) VALUES
(1, 1, 1, '8.00', 0.1),
(1, 7, 1, '12.00', 0.1),
(2, 1, 1, '8.00', 0.1),
(2, 5, 1, '7.00', 0.1),
(3, 1, 1, '8.00', 0.1),
(3, 9, 1, '12.00', 0.1),
(4, 9, 2, '12.00', 0.1);

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

DROP TABLE IF EXISTS `sac_livreur`;
CREATE TABLE IF NOT EXISTS `sac_livreur` (
  `id_plat` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL,
  `quantité_plat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_plat`,`id_livreur`),
  KEY `fk_SacLivreur_Livreur1_idx` (`id_livreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`id_plat`, `id_livreur`, `quantité_plat`) VALUES
(1, 1, 5),
(1, 2, 7),
(1, 3, 5),
(5, 1, 5),
(5, 2, 5),
(5, 3, 5),
(7, 1, 5),
(7, 2, 5),
(7, 3, 7),
(9, 1, 5),
(9, 2, 5),
(9, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id_statut_commande` int(11) NOT NULL AUTO_INCREMENT,
  `statut_commande` varchar(45) NOT NULL,
  PRIMARY KEY (`id_statut_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id_statut_commande`, `statut_commande`) VALUES
(1, 'En attente de paiement'),
(3, 'Paiement validé'),
(4, 'Livraison en cours'),
(5, 'Echec de livraison'),
(6, 'Livré'),
(7, 'Echec de paiement');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

DROP TABLE IF EXISTS `statut_livreur`;
CREATE TABLE IF NOT EXISTS `statut_livreur` (
  `id_statut_livreur` int(11) NOT NULL AUTO_INCREMENT,
  `statut_livreur` varchar(45) NOT NULL,
  PRIMARY KEY (`id_statut_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`id_statut_livreur`, `statut_livreur`) VALUES
(1, 'LIBRE'),
(3, 'EN LIVRAISON'),
(4, 'NON DISPONIBLE');

-- --------------------------------------------------------

--
-- Structure de la table `type_plat`
--

DROP TABLE IF EXISTS `type_plat`;
CREATE TABLE IF NOT EXISTS `type_plat` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `type_plat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_plat`
--

INSERT INTO `type_plat` (`id_type`, `type_plat`) VALUES
(1, 'Dessert'),
(2, 'Plat');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_Client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_Livreur1` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_Statut` FOREIGN KEY (`statut_commande`) REFERENCES `statut_commande` (`id_statut_commande`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_statut_livreur1` FOREIGN KEY (`statut_livreur`) REFERENCES `statut_livreur` (`id_statut_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_Plat_Editeur1` FOREIGN KEY (`id_chef`) REFERENCES `chef` (`id_chef`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Plat_TypePlat1` FOREIGN KEY (`type_plat`) REFERENCES `type_plat` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `fk_Repas_Plat1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Repas_commande1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_SacLivreur_Livreur1` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SacLivreur_Plat1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
