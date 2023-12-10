/* La declaration se fait avant le begin si on est sous oracle*/
/*Si la valeur qu'on veut recuperer est deja dans la table on met select 
Si la valeur qu'on veut recuperer est appele par une requete on met set */

/*Creer un trigger qui calcule et attribut un volume horaire*
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

/*Creer un trigger qui cree et attribut un numero de matricule achaque nouvel enseignant.
Les matricules sont de la forme 1/2 (Homme ou Femme) NUM qui est le numero de l enseignant
*
/*Ajouter l'attribut sexe avant de creer le Trigger*
Alter Table Enseignant Add Sexe Varchar(8) CHECK(Sexe in ('Homme','Femme'));

Delimiter &
Create TRIGGER AttMatricule Before Insert on Enseignant for Each Row
Begin
  Declare n,s smallint;
  Declare c  char(1);
  Declare m char(7);

  Select Count(*) into n From Enseignant;
  Set n =n+1;
  Set c = Substring (NEW.Nom,1,1);

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
&

Delimiter ;
/*Supprimer l'enseignante Astou DIATTA */
select * from Enseignant;

/* inserer les enseignants dans la table Enseignant */
Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Amadou','Homme','Maitre de conference','Lettres modernes');

/*Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('NDIAYE','Aissatou','Femme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('DIEDHIOU','Cheikh','Homme','Assistant','Informatiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Jean Paul','Homme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('FALL','Fatoumata','Femme','Assistant','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values('NDIAYE','Cheikh','Homme','Assistant','Physique');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('SECK','Diariatou','Femme','Maitre-Assistant','Geographie');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GUEYE','Jean Paul','Homme','Professeur','Mathematiques');

Insert Into Enseignant (Nom, Prenom, Sexe, Grade ,Specialite) values ('GOMIS','Moustapha','Homme','Maitre-Assistant','Informatiques');*/


