/*
	pour execuuter le script , il faudriat faire la commande suivant :
	--> Soure chemin_du_Script
*/
Create Database Scolarite;
Use Scolarite;

/* 1_Creation des tables dans la base de donnee */

Create table Enseignant(
	Matricule char(7), 
/* le Nom ne devrait pas  etre vide c'est pourquoi not nul */
	Nom varchar(20) NOT NULL, 
	Prenom varchar(20) NOT NULL, 
	Grade varchar(20)  default 'Assistant' check(Grade in ('Assistant', 'Maitre-Assistant', 'Maitre de conference', 'Professeur')), 
	Specialite varchar(25), 
	Constraint pkensei primary key(Matricule)
);

Create table Departement(
	Nom varchar(25) , 
	UFR varchar(10),
/* oubien utiliser la Contrainte : Containt addres UNIQUE(Address) car chaque address ne doit pas etre vide*/	 
	Address varchar(30) UNIQUE,
	AnneOuverture integer check(AnneOuverture between 2006 and 2012),
	Constraint pkdep primary key(Nom, UFR)
);

Create table Servir(
	Nom_dep varchar(25), 
	UFR_dep varchar(10),
	Enseignant varchar(7), 
	Constraint pkserv primary key(Nom_dep, UFR_dep, Enseignant),
	Constraint fkserv_dep foreign key (Nom_dep, UFR_dep) references Departement(Nom, UFR),
	Constraint fkserv_ensei foreign key (Enseignant) references Enseignant(Matricule)
);

Create table Matiere(
	Nom varchar(20),
	VoHoraire smallInt,
	Coefficient smallInt,
	Type varchar(3),
	Constraint pkmat primary key(Nom)
);

/*on pourrait utiliser ces commande ci-dessous pour que lorsque des changement sont faites sur 
	 la table Ensegnant cela s'effectue dans la table Dispenser :
	1-	ON DELETE CASCADE ,la suppresion dans enseignant supprime le cle entrangere
	2-	ON UPDATE CASCADE ,les changement effectue dans enseignant seront prise en compte*/
Create table Dispenser(
	Enseignant char(7),
	Matiere varchar(20),
	Type varchar(3) check (Type in ('CM', 'TD', 'TP')),
	Constraint pkdisp primary key(Enseignant, Matiere),
	Constraint fkdisp_ensei foreign key(Enseignant) references Enseignant(Matricule),
	Constraint fkdisp_mat foreign key(Matiere) references Matiere(Nom)
);

/* Creation d'une vue Informaticien */
Create View Informaticien As Select matricule, nom , prenom from Enseignant where Specialite='Informatique';

/* inserer  dans la table Departement les valeurs ('informatique' , 'UFR ST' ,2007) */
Insert Into Departement (Nom, UFR, AnneOuverture) values ('informatique' , 'UFR ST' ,2007);

/* inserer  dans la table Departement les valeurs ('Geographie' , 'UFR ST' ,'Diabir', 2007) */
Insert Into Departement values ('Geographie' , 'UFR ST' ,'Diabir', 2007);

/* inserer  dans la table Departement les valeurs ('Tourisme' , 'UFR SES' ,'Elevage', 2008) */
Insert Into Departement values ('Tourisme' , 'UFR SES' ,'Elevage', 2008);

/* Impossible d'inserer  dans la table Enseignant les valeurs ('2007 02' , 'DIOP' ,'Assistant', 'Anglais') 
car le prenom est obligatoire*/


/* inserer  dans la table Enseignant les valeurs ('2014 05' , 'DIATTA' ,'Astou', 'Droit') */
Insert Into Enseignant (Matricule, Nom, Prenom, Specialite) values ('2014 05' , 'DIATTA' ,'Astou', 'Droit');

/* Impossible d'inserer les  valeurs ('Droit', 'CM')  dans la table Dispenser car une partie de la cle primaire
n'est pas connue a savoir le matricule de l'enseignant */

/*Creer deux utilisateur user1 	et user2 */
create user user1@localhost identified by 'Passer';
create user user2@localhost identified by 'Entrer';

/* donner a user1 la possibility de lire toutes les tables et de redonner ces possibilite */
grant select on scolarite.* to user1@localhost with grant option;

/*donner a user2 la possibilite de supprimer des departements et des matieres*/
grant delete on  Matiere, Departement to user2@localhost;

/*donner a user2 la possibilite de modifier des matieres donnes par les professeurs*/
grant update on Dispenser to user2@localhost;

/*supprimer la privilege de supprimer des departements a user2 */
revoke delete on Departement from user2@localhost;

/* Ajouter un attribut Credit qui ne prend que les valeurs de 2 à 5 à la table Matiere */
Alter Table Matiere add credit smallint CHECK  (credit in (2,3,4,5));

/* Renommer la table Dispenser en Charger */
Rename table Dispenser to Changer;

/* Renommer l’attribut Type de la table Matiere en Categorie */
Alter table Matiere change type Categorie varchar(20);

/* L’attribut Coefficient de la table Matiere ne prend que les valeurs de 1 à 3  */
Alter table Matiere Modify coefficient smallint CHECK (Coefficient between 1 and 3);

/* La clé primaire de la table Departement n’est constituée que de l’attribut Nom. */
/* 1- la cle primary de Departement est referencer dans la table servir */
/*on supprime la cle etrangere referencant la cle primaire de departement dans table; */
alter Table Servir Drop Constraint fkserv_dep;

/* on supprime le cle primaire de Servir */
alter Table Servir Drop primary key;

/* Supprimer la cle primaire du Table Departement */
alter Table Departement Drop primary key;

/* Rajouter la contrainte de la cle primaire  de departement */
alter Table Departement Add Constraint PK_Dept Primary key(Nom);
/*supprimer l'attribut UFR dept de Servir */
Alter Table Servir drop UFR_dep;

/*Ajouter les cle primaires de la table Servir */
Alter Table Servir Add Constraint pkserv Primary Key (Nom_dep,Enseignant);
/*Ajouter la contrainte de cle etrangere de Nom_dep */
Alter Table Servir Add Constraint fkserv_dep foreign key (Nom_dep) references Departement (Nom);