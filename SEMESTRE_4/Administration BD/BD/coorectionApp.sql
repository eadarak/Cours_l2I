Create database LocationVoiture;
use LocationVoiture;

Create Table Client(
       NumPermis Integer;
       
       
       
);

/* Fonction qui retourne le prix a payer */
create Function A_Payer( c Integer, v char(9) , d Date) Returns Integer
Begin
   Declare s Integer;
   Declare nj smallint;
   Declare p Integer;
 
   Select NbJour, PrixJour Into nj, p From Louer where Client = c and Voiture = v and DateDebut = d;
   Set s= nj *p;
   Return s;
 
End;

/* Procedure qui affiche la liste des clients qui ont loue une voiture donnee pour une duree depassant 7jours consecutif  */
Create Procedure ClientVoiture ( In v char(9))
Begin
   Declare np Integer;
   Declare nv Varchar(15);
   Declare pr Varchar(25);
   Declare sex Varchar(8);
   Declare adr Varchar(25);
   Declare ag SmallInt;
   Declare tel Char(12);
   Declare i,j Integer Default 0;
   
   
   
   Declare C1 Cursor for Select Client.* From Client, Louer Where Numpermis = Client and Voiture = v and NbJour > 7;
   Declare Continue Handler For Not Found Set i=1;
   Open C1;
       B1: loop
           Fetch C1 Into np, nv, pr, sex, adr, ag, tel;
           If i=1 then 
              If j=0 then 
                 Select ' Cette voiture n''a jamais ete louee plus de 7jours ';
              End If;
              Leave B1;
           End If;
           Set j=j+1;
           Select np, nv, pr, sex, adr, ag, tel;
      End loop;
   Close C1;
End;

/* Creer un trigger  */
Create TRIGGER InsertFidelite  After Insert On Louer For each row;

 
