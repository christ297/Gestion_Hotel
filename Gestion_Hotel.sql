-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 31 oct. 2023 à 11:31
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Gestion_Hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte_fidelite`
--

CREATE TABLE `carte_fidelite` (
  `id_carte_fidelite` int(11) NOT NULL,
  `point_fidelite` int(11) DEFAULT NULL,
  `date_delivrer` datetime DEFAULT NULL,
  `date_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_client`
--

CREATE TABLE `categorie_client` (
  `id_categorie_client` int(11) NOT NULL,
  `type_client` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `id_chambre` int(11) NOT NULL,
  `caracteristiques_chambre` enum('ventilée','climatisée') DEFAULT NULL,
  `type_chambre` enum('single','double','triple') DEFAULT NULL,
  `situation_chambre` enum('vue mer','vue jardin','vue rue','vue montagne') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `nom_client` varchar(50) DEFAULT NULL,
  `prenon_client` varchar(50) DEFAULT NULL,
  `telephone` int(20) DEFAULT NULL,
  `id_carte_fidelite` int(11) DEFAULT NULL,
  `id_pays` int(11) DEFAULT NULL,
  `status_etranger` enum('oui','non') DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  `id_categorie_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id_connexion` int(11) NOT NULL,
  `nom_utilisateur` varchar(50) DEFAULT NULL,
  `mot_de_passe_utilisateur` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL,
  `libelle_pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_rservation` int(11) NOT NULL,
  `id_chambre` int(11) DEFAULT NULL,
  `date_reservation` datetime DEFAULT NULL,
  `date_arrive` datetime DEFAULT NULL,
  `date_depart` datetime DEFAULT NULL,
  `durer_reservation` int(11) DEFAULT NULL,
  `date_durer_reservation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carte_fidelite`
--
ALTER TABLE `carte_fidelite`
  ADD PRIMARY KEY (`id_carte_fidelite`);

--
-- Index pour la table `categorie_client`
--
ALTER TABLE `categorie_client`
  ADD PRIMARY KEY (`id_categorie_client`);

--
-- Index pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD PRIMARY KEY (`id_chambre`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_pays` (`id_pays`),
  ADD KEY `id_categorie_client` (`id_categorie_client`),
  ADD KEY `id_carte_fidelite` (`id_carte_fidelite`),
  ADD KEY `id_carte_fidelite_2` (`id_carte_fidelite`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`id_connexion`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_rservation`),
  ADD KEY `id_chambre` (`id_chambre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carte_fidelite`
--
ALTER TABLE `carte_fidelite`
  MODIFY `id_carte_fidelite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie_client`
--
ALTER TABLE `categorie_client`
  MODIFY `id_categorie_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chambres`
--
ALTER TABLE `chambres`
  MODIFY `id_chambre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id_connexion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_rservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id_categorie_client`) REFERENCES `categorie_client` (`id_categorie_client`),
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`id_categorie_client`) REFERENCES `categorie_client` (`id_categorie_client`),
  ADD CONSTRAINT `clients_ibfk_4` FOREIGN KEY (`id_carte_fidelite`) REFERENCES `carte_fidelite` (`id_carte_fidelite`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_chambre`) REFERENCES `chambres` (`id_chambre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
