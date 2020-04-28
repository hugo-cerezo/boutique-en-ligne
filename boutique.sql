-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 28 avr. 2020 à 15:03
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `rncp`
--
CREATE DATABASE IF NOT EXISTS `rncp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `rncp`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `qtt` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `categorie`, `title`, `description`, `price`, `qtt`, `date`) VALUES
(1, 'indÃ©', 'super meat boy', 'Super Meat Boy est un jeu de plateforme oÃ¹ vous incarnez un cube de viande animÃ© qui tente de sauver sa petite-amie (constituÃ©e de pansements) d&#039;un fÅ“tus malÃ©fique dans un bocal.\r\n\r\nNotre hÃ©ros de viande sautera depuis des murs, par dessus des ocÃ©ans de scies vrombissantes, Ã  travers des grottes qui s&#039;effondrent et des piscines remplies de vielles seringues. Sacrifiant son bien-Ãªtre pour sauver sa demoiselle en dÃ©tresse. Super Meat Boy s&#039;inspire de jeux NES Old School comme Mega Man 2, Ghost and Goblins et Super Mario Bros. 2 (la version japonaise) et en extrait l&#039;essentiel : un jeu de plateforme oÃ¹ seuls les rÃ©flexes comptent.', 25, 89, '2020-04-27'),
(2, 'indÃ©', 'faster than light', 'is a space-based top-down real-time strategy roguelike game created by indie developer Subset Games, which was released for Microsoft Windows, OS X and Linux in September 2012.[2] In the game, the player controls the crew of a single spacecraft, holding critical information to be delivered to an allied fleet, while being pursued by a large rebel fleet. The player must guide the spacecraft over eight sectors, each with planetary systems and events procedurally generated in a roguelike fashion, while facing rebel and other hostile forces, recruiting new crew, and outfitting and upgrading their ship. Combat takes place in pausable real time, and if the ship is destroyed or all of its crew lost, the game ends, forcing the player to restart with a new ship.', 10, 90, '2020-04-01'),
(3, 'indÃ©', 'dead cells', 'Dead Cells is a roguelike, Castlevania-inspired action-platformer, allowing you to explore a sprawling, ever-changing castle… assuming you’re able to fight your way past its keepers. To beat the game you’ll have to master 2D souls-like like combat with the ever present threat of permadeath looming. No checkpoints. Kill, die, learn, repeat.', 12, 90, '2020-04-27'),
(4, 'indÃ©', 'factorio', 'Factorio is a game in which you build and maintain factories.\r\n\r\nYou will be mining resources, researching technologies, building infrastructure, automating production and fighting enemies. Use your imagination to design your factory, combine simple elements into ingenious structures, apply management skills to keep it working, and protect it from the creatures who don t really like you.\r\n\r\nThe game is very stable and optimized for building massive factories. You can create your own maps, write mods in Lua, or play with friends via Multiplayer.', 18, 90, '2020-04-27'),
(5, 'AAA', 'world of warcraft', '\r\nAffrontez le Dieu très ancien N’Zoth et ses sbires à Ny’alotha, la cité en éveil, plongez au cœur d’un nouveau raid à douze boss, terrassez vos adversaires dans l’arène et sur les champs de bataille, et mettez votre courage à l’épreuve dans les donjons de pierre mythique pour gagner d’incroyables récompenses !', 60, 90, '2020-04-27'),
(6, 'AAA', 'tomb raider', 'Shadow of the Tomb Raider is an action-adventure video game developed by Eidos Montréal and published by Square Enix. It continues the narrative from the 2015 game Rise of the Tomb Raider and is the twelfth mainline entry in the Tomb Raider series. The game was released worldwide on 14 September 2018 for Microsoft Windows, PlayStation 4 and Xbox One. A macOS and Linux version of the game was released by Feral Interactive on 5 November 2019', 60, 90, '2020-04-27'),
(7, 'AAA', 'anno 1800', 'Anno 1800 is a city-building real-time strategy video game, developed by Blue Byte and published by Ubisoft, and launched on April 16, 2019 in North America.[1] It is the seventh game in the Anno series, and returns to the use of a historical setting following the last two titles, Anno 2070 and Anno 2205, taking place during the Industrial Revolution in the 19th century. Following the previous installment, the game returns to the series traditional city-building and ocean combat mechanics, but introduces new aspects of gameplay, such as tourism, blueprinting, and the effects of industrialisation influences on island inhabitants.', 60, 90, '2020-04-27'),
(12, 'retro', 'resident evil 4', 'resident evil 4 meilleur jeux par le chemin , survival horror qui definit les bases de beacoup de jeux de tir a la 3eme personnne , pillier du jeux videal. Aporte un vent de fraicheur a la serie des resident evil , pour beaucoup de monde un des meilleurs episodes', 60, 90, '2020-04-27'),
(16, 'AAA', 'dark souls III', 'description', 60, 100, '2020-04-27'),
(26, 'Play With Friends', 'super mario party', 'description', 50, 100, '2020-04-27');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `description-achat` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `id_utilisateur`, `title`, `total`, `description-achat`, `date`) VALUES
(28, 3, 'cerezo baelo', 120, '1|world of warcraft|60|2</br>', '0000-00-00'),
(20, 3, '', 111, '1|super meat boy|25|3</br>2|dead cells|12|3</br>', '0000-00-00'),
(29, 7, 'testnom', 60, 'world of warcraft|60|1</br>', '2020-04-10'),
(30, 7, 'test', 25, 'super meat boy|25|1</br>', '2020-04-10'),
(31, 7, 'test', 60, 'world of warcraft|60|1</br>', '2020-04-10'),
(32, 1, '', 25, 'super meat boy|25|1</br>', '2020-04-27'),
(33, 1, '', 25, 'super meat boy|25|1</br>', '2020-04-27'),
(34, 1, '', 540, 'factorio|18|30</br>', '2020-04-27'),
(35, 1, '', 3050, 'super meat boy|25|10</br>faster than light|10|10</br>dead cells|12|10</br>factorio|18|10</br>world of warcraft|60|10</br>tomb raider|60|10</br>anno 1800|60|10</br>resident evil 4|60|10</br>', '2020-04-27'),
(36, 1, '', 25, 'super meat boy|25|1</br>', '2020-04-27');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `title`, `login`, `commentaire`, `date`) VALUES
(1, 'super meat boy', 'hugo', '', '2020-04-09'),
(2, 'super meat boy', 'hugo', '', '2020-04-09'),
(3, 'super meat boy', 'hugo', '', '2020-04-09'),
(4, 'super meat boy', 'hugo', '', '2020-04-09'),
(5, 'super meat boy', 'hugo', '', '2020-04-09'),
(6, 'super meat boy', 'hugo', '', '2020-04-09'),
(7, 'super meat boy', 'hugo', '', '2020-04-09'),
(8, 'super meat boy', 'hugo', '', '2020-04-09'),
(9, 'super meat boy', 'hugo', '', '2020-04-09'),
(10, 'super meat boy', 'hugo', '', '2020-04-09'),
(11, 'super meat boy', 'hugo', '', '2020-04-09'),
(12, 'super meat boy', 'hugo', '', '2020-04-09'),
(13, 'super meat boy', 'hugo', '', '2020-04-09'),
(14, 'super meat boy', 'hugo', '', '2020-04-09'),
(15, 'super meat boy', 'hugo', '', '2020-04-09'),
(16, 'super meat boy', 'hugo', '', '2020-04-09'),
(17, 'super meat boy', 'hugo', '', '2020-04-09'),
(18, 'dead cells', 'hugo', 'Jeux de merde ', '2020-04-10'),
(19, 'dead cells', 'hugo', 'Best game ever <3', '2020-04-10'),
(20, 'super meat boy', '', 'test not connected', '2020-04-10'),
(21, 'super meat boy', 'test', 'test newrating ', '2020-04-10'),
(22, 'super meat boy', '', '', '2020-04-10'),
(23, 'super meat boy', '', '', '2020-04-10'),
(24, 'super meat boy', '', 'azdazd', '2020-04-10');

-- --------------------------------------------------------

--
-- Structure de la table `rating_average`
--

DROP TABLE IF EXISTS `rating_average`;
CREATE TABLE IF NOT EXISTS `rating_average` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `moy` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rating_average`
--

INSERT INTO `rating_average` (`id`, `title`, `moy`) VALUES
(1, 'super meat boy', 4.2),
(2, 'faster than light', 0),
(3, 'dead cells', 1),
(4, 'faster than light', 0),
(5, 'factorio', 0),
(6, 'world of warcraft', 0),
(7, 'tomb raider', 0),
(8, 'anno 1800', 0),
(9, 'resident evil 4', 0);

-- --------------------------------------------------------

--
-- Structure de la table `rating_table`
--

DROP TABLE IF EXISTS `rating_table`;
CREATE TABLE IF NOT EXISTS `rating_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `game_title` varchar(255) NOT NULL,
  `rating` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rating_table`
--

INSERT INTO `rating_table` (`id`, `id_utilisateur`, `game_title`, `rating`) VALUES
(1, 1, 'super meat boy', '5'),
(2, 1, 'super meat boy', '1'),
(3, 1, 'super meat boy', '4'),
(4, 1, 'super meat boy', '4'),
(5, 1, 'super meat boy', '3'),
(6, 1, 'super meat boy', '3'),
(7, 1, 'super meat boy', '4'),
(8, 1, 'super meat boy', '4'),
(9, 1, 'super meat boy', '2'),
(10, 1, 'super meat boy', '2'),
(11, 1, 'super meat boy', '3'),
(12, 1, 'super meat boy', '5'),
(13, 1, 'super meat boy', '5'),
(14, 1, 'super meat boy', '4'),
(15, 1, 'super meat boy', '4'),
(16, 1, 'super meat boy', '5'),
(17, 1, 'super meat boy', '5'),
(18, 1, 'super meat boy', '5'),
(19, 1, 'super meat boy', '5'),
(20, 1, 'super meat boy', '5'),
(21, 1, 'super meat boy', '5'),
(22, 1, 'super meat boy', '5'),
(23, 1, 'super meat boy', '5'),
(24, 1, 'super meat boy', '5'),
(25, 1, 'super meat boy', '5'),
(26, 1, 'super meat boy', '5'),
(27, 1, 'super meat boy', '5'),
(28, 1, 'super meat boy', '5'),
(29, 1, 'dead cells', '1'),
(30, 1, 'dead cells', '5'),
(31, 7, 'super meat boy', '5');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rang` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `password`, `adresse`, `email`, `rang`) VALUES
(1, 'hugo', '$2y$10$4d6OUQzz6MpesuwAJdwdP.Qosz0JTnhPfW7RsYE10j4bpz2Ro6ig2', '', '', 'admin'),
(10, 'enzo', '$2y$10$CwnKNmWKRl6HbXg941AsFeIxiNkeCAl/x4pj9OU2YjXEkrY2BCajG', 'htmlspecialchars(42 avenue du dev)', 'enzo.mandine@laplateforme.io', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
