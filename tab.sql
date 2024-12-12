-- Création de la table CLIENT
CREATE TABLE CLIENT (
    id_client INT PRIMARY KEY,
    nom VARCHAR2(50),
    adresse VARCHAR2(100),
    email VARCHAR2(100)
);
-- Création de la table PRODUIT
CREATE TABLE PRODUIT (
    id_produit INT PRIMARY KEY,
    nom VARCHAR2(100),
    prix DECIMAL(10, 2),
    quantite_en_stock INT
);
-- Création de la table COMMANDES
CREATE TABLE COMMANDES (
    id_commande INT PRIMARY KEY,
    id_client INT,
    id_produit INT,
    date_commande DATE DEFAULT SYSDATE, -- Valeur par défaut de SYSDATE
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit)
);
-- Création de la table LIGNES_COMMANDE
CREATE TABLE LIGNES_COMMANDE (
    id_commande INT,
    id_produit INT,
    quantite INT,
    prix_unitaire DECIMAL(10, 2),
    PRIMARY KEY (id_commande, id_produit),
    FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit)
); 
-- Création de la table CATEGORIE
CREATE TABLE CATEGORIE (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR2(50)
);
-- Création de la table ASSOCIER_PRODUIT_CATEGORIE
CREATE TABLE ASSOCIER_PRODUIT_CATEGORIE (
    id_produit INT,
    id_categorie INT,
    PRIMARY KEY (id_produit, id_categorie),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit),
    FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie)
);
-- Ajout de la colonne 'categorie' dans la table PRODUIT
ALTER TABLE PRODUIT
ADD (categorie VARCHAR2(20));
-- Ajout de la colonne 'date_commande' dans la table COMMANDES
ALTER TABLE COMMANDES
ADD (date_commande DATE DEFAULT SYSDATE);