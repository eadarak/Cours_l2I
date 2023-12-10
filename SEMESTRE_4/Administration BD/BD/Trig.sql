/* La declaration se fait avant le begin si on est sous oracle*/
/*Si la valeur qu'on veut recuperer est deja dans la table on met select 
Si la valeur qu'on veut recuperer est appele par une requete on met set */

/*Creer un trigger qui calcule et attribut un volume horaire*/
/*Insertion du volume horaire se fait avant l'insertion de la table *
Delimiter &
/* Ce delimiteur dit a mysql que l'instruction se termine quand il voit le delimireur*
Create TRIGGER InsertVolumeHoraire  Before Insert on Matiere for Each Row
Begin
  Declare Vh smallint;
  Declare cr smallint;
  set cr =NEW.Credit;
  Set Vh = 12*cr;
  Set NEW.voHoraire = Vh;

End;
&
*/
/*Creer un trigger qui cree et attribut un numero de matricule achaque nouvel enseignant.
Les matricules sont de la forme 1/2 (Homme ou Femme) NUM qui est le numero de l enseignant
*
/*Ajouter l'attribut sexe avant de creer le Trigger
Alter Table Enseignant Add Sexe Varchar(8) CHECK(Sexe in ('Homme','Femme'));

Delimiter |
Create TRIGGER AttMatricule Before Insert on Enseignant for Each Row
Begin
  Declare n,s smallint;
  Declare c  char(1);
  Declare m char(7);

  Select Count(*) into n From Enseignant;
  Set n =n+1;
  Set c = Substring(NEW.Nom,1,1);

  If NEW.Sexe = 'Femme' then
    Set s=2;
  Else
    Set s=1;
  End If;

  If n<10 then
    set m = concat(s,' ','00',n,' ',c);
  ElseIF n<100 and n>=10 then
    set m = concat(s,' ','0',n,' ',c);
  ElseIf n>=100 and n<1000 then
    set m = concat(s,' ',n,' ',c);
  Else
    set n='a';
  End If;

  Set NEW.Matricule=m;   

End;
|*/

/*Delimiter ;
Supprimer l'enseignante Astou DIATTA *
select * from Enseignant;

/* inserer les enseignants dans la table Enseignant
Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Amadou','Homme','Maitre de conference','Lettres modernes');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('NDIAYE','Aissatou','Femme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('DIEDHIOU','Cheikh','Homme','Assistant','Informatiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Jean Paul','Homme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('FALL','Fatoumata','Femme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('NDIAYE','Cheikh','Homme','Assistant','Physique');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('SECK','Diariatou','Femme','Maitre-Assistant','Geographie');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Jean Paul','Homme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Moustapha','Homme','Maitre-Assistant','Informatiques');
 */
/*Creer un trigger qui donne le nom du departement d'un enseignant selon sa specialite
Delimiter //
Create TRIGGER getDepartement After Insert on Enseignant for Each Row
begin
  Declare idEns char(7);
  Declare spe varchar(25);
  set idEns = NEW.Matricule;
  set spe = New.specialite;
  Insert Into Servir (Nom_dep,Enseignant) values (spe, idEns);
End;
//  
*/
/*Créer un trigger qui annule l’insertion d’un enseignant si sa spécialité ne correspond à aucun département.
Delimiter //
Create TRIGGER AnnulInsert Before Insert On Enseignant for Each Row
Begin
  Declare spec varchar(25);
  Declare nbs smallInt default 0;

  Set spec = NEW.specialite;
  Select Count(*) into nbs from Departement , Enseignant where spec = Departement.Nom;
  if nbs = 0 then
    set nbs ='z';
  end if;
End;
//

/* Delimiter ;
Supprimer toutes les valeurs des tables
delete from Servir;
delete from Departement;
delete from Dispenser;
delete from Changer;
delete from Matiere; */


/*  Trigger qui annule l'insertion avec le curseur 
Delimiter //
Create TRIGGER AnnulInsert Before Insert On Enseignant for Each Row
Begin
  Declare s,d varchar(25);
  Declare nbs, i smallInt default 0;
  Declare cursor NomD for Select Nom  From Departement;
  Declare continue Handler For Not found set nbs = 1;

  Set s= NEW.specialite;
  Open NomD;
  B : loop
    fetch NomD into d;
    if d=s then
      set i=1;
    End If;
    If nbs = 1 then
      leave B;
    End If;

  end loop;

  close NomD;
  if i = 0 then
    set nbs ='z';
  end if;
End;
//*/

/*inserer les enregistrements suivants
Insert Into Departement values ('Mathematiques','UFR ST','Diabir',2007);
Insert Into Departement values ('Lettres modernes','UFR LASHU','Elevage',2008);
Insert Into Departement values ('Droit des affaires','UFR SES','Diabir0',2008);
Insert Into Departement values ('Physique','UFR ST' ,'Diabir1',2008);
Insert Into Departement values ('Histoire','UFR LASHU','Elevage0',2020);

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Amadou','Homme','Maitre de conference','Lettres modernes');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('NDIAYE','Aissatou','Femme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('DIEDHIOU','Cheikh','Homme','Assistant','Informatiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Jean Paul','Homme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('FALL','Fatoumata','Femme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('NDIAYE','Cheikh','Homme','Assistant','Physique');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('SECK','Diariatou','Femme','Maitre-Assistant','Geographie');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Jean Paul','Homme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Moustapha','Homme','Maitre-Assistant','Informatiques');
 */

/*Procédures stockées et Fonctions
1. Fonctions
a. Créer une fonction qui renvoie le volume horaire total d’un enseignant donné si pour
chaque matière le CM, le TD et TP ont le même volume horaire ;
*/

delimiter //
Create function volHoraireTotal (idEns varchar(7)) Returns smallInt
Begin
  Declare i,volt,som smallInt default 0;
  Declare ma varchar(35);
  Declare t char(2);

  /*on divise la volume horaire par 3 car volTP=VolCM=VolTD*/
  Declare Calcule cursor for select Matiere,Type,VoHoraire/3 from Changer, Matiere where Matiere=nom and idEns = Enseignant;
  Declare continue Handler for not found set i=1;
  Open Calcule;
  boucle : loop
    fetch Calcule into ma,t,som;
    if i=1 then
      leave boucle;
    End If;

    set volt := volt+som;
  End loop;
  close Calcule;

  Return volt;
End;
/* si le log_bin ne marche pas  faire :
set Global log_bin_trust_Function_creators =1 */
//

/* Créer une fonction qui renvoie le grade de l’enseignant qui dispense le CM du cours de
probabilité ;*/
delimiter //
Create function GradeEnseignant() Returns varchar (20)
Begin
  Declare grad varchar(20);
  select grade into grad from Enseignant,Changer where Matiere ='Probabilite' and Type = 'CM' and Matricule=enseignant;
  Return grad;
End;
//

/* Créer une fonction qui renvoie le nom du département qui a le plus d’assistant. */
delimiter //
Create function MaxAssistant() Returns varchar(25)
Begin
  Declare dep,d varchar(25);
  Declare nb,i,n smallInt default 0;
  Declare Maxi cursor for
  select Nom_dep, Count(*) from Servir, Enseignant where Matricule=enseignant 
  and Grade = 'Assistant' Group By Nom_dep;
  Declare continue Handler for NOT found set i=1;
  Open Maxi;
  boucle :loop
    fetch Maxi into dep,nb;
    if(i=1) then
      leave boucle;
    end if;
    if (nb>n) then
     set n:= nb;
     set d:=dep;
    end if;
  end loop; 
  close Maxi;
  Return d;

End;
//

-- 2. Procédures stockées 
/* a. Créer une procédure qui affiche le numéro de matricule, le nom et le prénom de
l’enseignant qui fait le TD d’Algorithme est programmation ;*/

Delimiter ***
create procedure ListeEns(In mat varchar(20))
BEGIN
  Declare num char(7);
  Declare name varchar(20);
  Declare pname varchar(20);
  Declare i,j smallint DEFAULT 0;
  Declare C cursor for select Matricule,Nom,Prenom from Enseignant , Changer 
  where Matricule = Changer.Enseignant and Matiere = mat and Type = "TD";
  Declare continue Handler for not found set i=1;
  
  Open C;
  boucle : loop
    fetch C into num,name, pname;
    If (i=1) then
      if(j=0) then
        Select 'Aucun enseignant ne fait ce TD';
      end if;
      leave boucle;
    end if ;
    set j:=j+1;
    SELECT num,name,pname;
  end loop ;
  close C;
End;
***

/* Créer une procédure qui affiche la liste des enseignants de chaque département d’une UFR donnée ;*/
create or Replace Procedure listeEnsUFR(In UFRDep varchar(10))
Begin
  Declare nam,pnam varchar(20);
  declare mat char(7);
  Declare i smallint DEFAULT 0;
  Declare C cursor for SELECT Matricule, E.Nom, Prenom from Servir As S, Enseignant As E, Departement As D where
  D.Nom=S.Nom_dep and E.Matricule= S.Enseignant and D.UFR = UFRDep;
  Declare continue handler for not found set i=1;
  Open C;
  boucle : loop
    fetch C into mat, nam, pnam;
    if (i=1) then
     leave boucle;
    end if;
  SELECT mat, nam, pnam;
  End loop;
  Close C;
end;

/* Créer une procédure qui affiche la liste des UFR avec leurs départements.*/
--DISTINCT ==> FONCTION EST UNE FONCTION QUI NE PREND PAS EN COMPTE LES OCCURENCES
--ORDER BY ==> FONCTION QUI PERMET DE TRIER SELON LES NOMS
--GROUP_CONCAT ==> permet de regrouper les valeurs
--SELECT faculte;
Delimiter $$
CREATE PROCEDURE ListeUfrDept()
BEGIN
  DECLARE i,j SMALLINT DEFAULT 0;
  DECLARE Nm VARCHAR(25);
  DECLARE faculte VARCHAR(10);
  DECLARE Addr VARCHAR(30);
  DECLARE A integer;
  DECLARE nb,n SMALLINT DEFAULT 0;
  DECLARE D CURSOR FOR SELECT DISTINCT(UFR),COUNT(*) AS NbDept  FROM Departement GROUP BY UFR;
  
  DECLARE B CURSOR FOR SELECT Nom,Address FROM Departement ORDER BY UFR;
  SELECT COUNT(DISTINCT(UFR)) INTO nb from Departement;
  Open D;
    Open B;
      while (j<nb) DO
        FETCH D INTO faculte,n;
        SELECT faculte;
        set i:=0;
        WHILE (i<n) Do 
          FETCH B INTO Nm,Addr;
          SELECT Nm,Addr;
          Set i:=i+1;
        END WHILE;
        set j :=j+1;
      End WHILE;
    CLOSE B;
  CLOSE D;

END;
$$