-- =========================================================================
-- LIVRABLE 1 : SCRIPT DE CRÉATION DU SCHÉMA DE LA BASE DE DONNÉES
-- Projet : Tifosi
-- =========================================================================

DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tifosi;

-- 1. Tables de base
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    code_postal VARCHAR(10) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
) ENGINE=InnoDB;

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

-- 2. Tables de liaison (relations N:M)
CREATE TABLE achete (
    id_client INT,
    id_focaccia INT,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_focaccia, date_achat),
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client),
    CONSTRAINT fk_achete_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;

CREATE TABLE contient (
    id_focaccia INT,
    id_ingredient INT,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_contient_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_contient_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
) ENGINE=InnoDB;

CREATE TABLE est_constitué (
    id_focaccia INT,
    id_boisson INT,
    PRIMARY KEY (id_focaccia, id_boisson),
    CONSTRAINT fk_est_constitue_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_est_constitue_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
) ENGINE=InnoDB;