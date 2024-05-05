#Connection au serveur en tant qu'administrateur et création d'une BD et d'une table
CREATE DATABASE ING2;
#ING2 table des utilisateurs
USE ING2;

#creation de la table [ utilisateurs ]
CREATE or REPLACE TABLE utilisateurs(
    id INT NOT NULL,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    login VARCHAR(20),
    password VARCHAR(30),
    CONSTRAINT PK_Utilisateur PRIMARY KEY (id)
); 

#inserer 4 [utilisateurs]
INSERT INTO utilisateurs VALUES(111,'Yous','FAYE','free', 'aaa') ;
INSERT INTO utilisateurs VALUES(222,'Abdoul','MAJID','orange','bbb') ;
INSERT INTO utilisateurs VALUES(333, 'Jean','MARI','express', 'ccc') ;
INSERT INTO utilisateurs VALUES(444, 'Talla','MBOUP','promo', 'ddd') ;
INSERT INTO utilisateurs VALUES(13, 'Sagnane','Ndiaye','l2i', 'sss') ;


# voir la liste des utilisateurs
SELECT * FROM utilisateurs ;

#inserer un utilisateur avec un mot de passe chiffre
INSERT INTO utilisateurs VALUES (555,'Marie','BA','ipsl',password('eee')) ;

#changer la taille du champs du mot de passe
ALTER TABLE utilisateurs MODIFY password VARCHAR (41) ;

#mettre a jourles mot de passe
UPDATE utilisateurs SET password=password('eee') ;

#trouver un mot de passe en claire
SELECT * FROM utilisateurs WHERE id='222' and password='bbb';

# -- Etape 3 : Gestion des utilisateurs via phpmyadmin -- #

# creer un utilisateur avec un acces limite
CREATE USER 'Talla'@'localhost' IDENTIFIED BY 'Talla';
GRANT SELECT, INSERT, UPDATE, DELETE ON ING2.* TO 'Talla'@'localhost';

SELECT nom, prenom FROM utilisateurs WHERE login='free' AND password=' '  UNION SELECT login, password FROM utilisateurs # ;

SELECT nom, prenom FROM utilisateurs  WHERE login = 'free' AND password = ' ' UNION  SELECT login, password FROM utilisateurs # ;
