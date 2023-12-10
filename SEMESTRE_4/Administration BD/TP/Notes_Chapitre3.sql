/* Si on veut que changer le moteur de stockage d'un table qu'on veut creer  on fait */
Create Table NomTable(
	Att1 	type1
	Att2 	type2
	""	""
	""	""
	AttN 	typeN
)ENGINE= MoteurStockage;

/* A noter qu'a chaque modification de la on doit appeler ou preciser le Moteur de Stockage */
/*Exemple*/
Alter Table NomTable ENGINE = MoteurStockage;

/*si on veut changer le moteur de stockage par defaut de maniere definitive on fait */
DEFAULT_STORAGE_ENGINE=MoteurStockage;

/* Lorsque qu'on veut que le moteur de stockage s'applique sur un fichier ou bd de maniere temporelle 
ie que le moteur s'applique que lorsque qu'on ouvre le fichier on fait*/ 
Set Storage_engine = MoteurStockage;

/* le rollback  permet de faire une retour sur les operations precedentes afin de  */

/* MERGE (MRG_MYISAM)permet juste de fusionner deux tables de  base de donnees differentes. Ces deux doit avoir les memes attributs et domaines*/

/* Parmi tous ls moteurs de stockage de BD il n'y a que INODB qui gere les integrites referentielles */

/*CSV ne gere pas les contraintes CHECK et n'accepte pas les valeurs NOT NULL*/
