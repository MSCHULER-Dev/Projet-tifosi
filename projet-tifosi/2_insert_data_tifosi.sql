-- =========================================================================
-- LIVRABLE 2 : SCRIPT D'INSERTION DES DONNÉES DE TEST
-- Projet : Tifosi
-- =========================================================================

USE tifosi;

-- Insertion des marques
INSERT INTO marque (nom) VALUES 
('Cola'),
('Schweppes'),
('Pepsico'),
('Oasis');

-- Insertion des ingrédients
INSERT INTO ingredient (nom) VALUES 
('Ail'), ('Ananas'), ('Artichaut'), ('Bacon'), ('Base tomate'), ('Base crème'), 
('Champignon'), ('Chèvre'), ('Cresson'), ('Emmental'), ('Gorgonzola'), 
('Jambon cru'), ('Jambon cuit'), ('Lardons'), ('Mozzarella'), ('Œuf'), 
('Oignon'), ('Olive noire'), ('Olive verte'), ('Parmesan'), ('Piment'), 
('Poivron'), ('Pomme de terre'), ('Raclette'), ('Salami'), ('Tomate cerise');

-- Insertion des boissons
INSERT INTO boisson (nom, id_marque) VALUES 
('Coca-cola zéro', 1), ('Coca-cola original', 1), ('Fanta citron', 1), 
('Fanta orange', 1), ('Capri-sun', 1), ('Schweppes agrumes', 2), 
('Pepsi max zéro', 3), ('Pepsi', 3), ('Lipton ice tea', 3), 
('Oasis tropical', 4), ('Oasis pomme cassis', 4), ('Oasis pomme poire', 4);

-- Insertion des focaccias
INSERT INTO focaccia (nom, prix) VALUES 
('Mozza', 9.80), ('Gorgonzola', 10.50), ('Raclaccia', 11.00), 
('Emmental', 9.50), ('Chèvre-miel', 10.00), ('Campagnarde', 11.50), 
('Italienne', 12.00), ('Végétarienne', 10.20);

-- Insertion des associations focaccias / ingrédients
INSERT INTO contient (id_focaccia, id_ingredient) VALUES 
(1, 5), (1, 15), (1, 26),
(2, 6), (2, 11), (2, 17),
(3, 6), (3, 24), (3, 23), (3, 1),
(4, 6), (4, 10), (4, 7),
(5, 6), (5, 8),
(6, 6), (6, 14), (6, 23), (6, 7),
(7, 5), (7, 12), (7, 15), (7, 20),
(8, 5), (8, 7), (8, 3), (8, 17);

-- Insertion des associations focaccias / boissons
INSERT INTO est_constitué (id_focaccia, id_boisson) VALUES 
(1, 1), (1, 2), (2, 3), (2, 4), (3, 6), 
(4, 7), (4, 8), (5, 9), (6, 10), (7, 11), (8, 12);

-- Insertion de clients de test
INSERT INTO client (nom, prenom, email, code_postal) VALUES 
('Dupont', 'Jean', 'jean.dupont@email.com', '75001'),
('Martin', 'Sophie', 'sophie.martin@email.com', '69002'),
('Durand', 'Pierre', 'pierre.durand@email.com', '13008');

-- Insertion des achats
INSERT INTO achete (id_client, id_focaccia, date_achat) VALUES 
(1, 1, '2026-10-01'), (1, 3, '2026-10-05'), 
(2, 2, '2026-10-10'), (3, 7, '2026-10-15');