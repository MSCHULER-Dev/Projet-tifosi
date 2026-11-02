-- =========================================================================
-- LIVRABLE 3 : SCRIPT D'EXÉCUTION DES REQUÊTES DE TEST
-- Projet : Tifosi
-- =========================================================================

USE tifosi;

-- Requête 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom FROM focaccia ORDER BY nom ASC;

-- Requête 2 : Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients FROM ingredient;

-- Requête 3 : Afficher le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen_euros FROM focaccia;

-- Requête 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque 
FROM boisson b 
JOIN marque m ON b.id_marque = m.id_marque 
ORDER BY b.nom ASC;

-- Requête 5 : Afficher la liste des ingrédients pour une Focaccia (ex: La Raclaccia)
SELECT i.nom AS ingredient_raclaccia 
FROM contient c 
JOIN focaccia f ON c.id_focaccia = f.id_focaccia 
JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
WHERE f.nom = 'Raclaccia';

-- Requête 6 : Afficher le nom et le nombre d'ingrédients pour chaque focaccia
SELECT f.nom AS focaccia, COUNT(c.id_ingredient) AS nombre_ingredients 
FROM focaccia f 
LEFT JOIN contient c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.id_focaccia, f.nom;

-- Requête 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom AS focaccia_plus_riche 
FROM focaccia f 
JOIN contient c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.id_focaccia, f.nom 
ORDER BY COUNT(c.id_ingredient) DESC 
LIMIT 1;

-- Requête 8 : Afficher la liste des focaccia qui contiennent de l'ail
SELECT f.nom AS focaccia_avec_ail 
FROM focaccia f 
JOIN contient c ON f.id_focaccia = c.id_focaccia 
JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
WHERE i.nom = 'Ail';

-- Requête 9 : Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredient_inutilise 
FROM ingredient i 
LEFT JOIN contient c ON i.id_ingredient = c.id_ingredient 
WHERE c.id_ingredient IS NULL;

-- Requête 10 : Afficher la liste des focaccia qui n'ont pas de champignons
SELECT f.nom AS focaccia_sans_champignon 
FROM focaccia f 
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia 
    FROM contient c 
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
    WHERE i.nom = 'Champignon'
);