# Créer cinq utilisateurs ousmane,mamadou, ibou, matar et dame avec la commande adduser1 ; #
sudo adduser ousmane
sudo adduser mamadou
sudo adduser ibou
sudo adduser matar
sudo adduser dame

# afficher les utilisateurs 
lslogins 

#~ La commande id vous permet de connaı̂tre les identifiants d’utilisateurs et de groupes pour un compte.
##~ Lister les identifiants de nos trois utilisateurs.
id ousmane
'
 uid=1001(ousmane) gid=1001(ousmane) groupes=1001(ousmane)
'

id mamadou
'
 uid=1002(mamadou) gid=1002(mamadou) groupes=1002(mamadou)
'

id dame
'
 uid=1005(dame) gid=1005(dame) groupes=1005(dame)
'
# --> Lister les identifiants de votre compte.
id eadarak
'
 uid=1000(eadarak) gid=1000(eadarak) groupes=1000(eadarak),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),131(lxd),132(sambashare)
'

#~ Créer les groupes suivants avec la commande groupadd  ~#

# --> l22i,l2mi, l3in, m1in, m2in qui représentent des groupes de classe;
sudo groupadd l22i
sudo groupadd l2mi
sudo groupadd l3in
sudo groupadd m1in
sudo groupadd m2in

" /etc/skel  copie  le cotenue des fichiers skel sur le repertoire de home du nouveau utilisateur qu'on vient de creer  "

# --> 2a, 3a, 4a, 5a qui représentent des groupes de niveau; 
sudo groupadd 2a && sudo groupadd 3a && sudo groupadd 4a && sudo groupadd 5a

# --> info et maths qui représentent des groupes de spécialité;
sudo groupadd info && sudo groupadd maths

# -->licence et master qui représentent des groupe de cycle de diplôme
sudo groupadd master && sudo groupadd licence


# --> Définir la configuration suivante de groupes pour chaque utilisateur avec la commande usermod2 :
sudo usermod -g l22i ousmane && sudo usermod -aG 2a,licence,info ousmane
sudo usermod -aG l2mi,2a,licence,info,maths mamadou
sudo usermod -aG l3in,3a,licence,info ibou
sudo usermod -aG m1in,4a,master,info matar
sudo usermod -aG m2in,5a,master,info dame

# --> Pour votre propre compte d’administration , vous ajouterez tous les groupes a vos groupes secondaires
sudo usermod -aG l22i,l2mi,l3in,m1in,m2in,2a,3a,4a,5a,info,maths,licence,master eadarak

# --> Créez un répertoire tp4admin dans votre home.
mkdir tp4admin

# --> Qui est propriétaire (user et groupe) du répertoire?
ls -l

' drwxrwxr-x  2 eadarak eadarak  4096 janv.  5 17:27 tp4admin
                proprio  Group
'

# --> Quels sont les droits en symbolique et en numérique sur ce répertoire
'
			Droits Standards
		user	group	other
symbolique	rwx	rwx	r-x	==>rwxrwxr-x
Numerique	7	7	5	--> 775

'

'
	le masque 002  = 777-2; le masque c''est a dire que si on a umask 044 on lui a enlever le droit de lire pour le groupe et pour les autres
'
## --> on peut aussi dans le repertoire tp4admin et faire une affichage detaillee
cd tp4admin/
ls -ld
'
	drwxrwxr-x 2 eadarak eadarak 4096 janv.  5 17:27 
'

# --> Changez de groupe actif en info:
newgrp info

#-->Dans le répertoire tp4admin, nous allons créez les répertoires suivants : rep000, rep100, rep200, rep300,rep400, rep500, rep600, rep700. 
mkdir rep000 rep100 rep200 rep300 rep400 rep500 rep600 rep700
ls
'
rep000  rep100  rep200  rep300  rep400  rep500  rep600  rep700
'
# --> Qui en est le propriétaire?
ls -lD
'
 total 32
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep000
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep100
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep200
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep300
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep400
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep500
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep600
  drwxrwxr-x 2 eadarak info 4096 janv.  5 18:25 rep700
//DIRED// 59 65 114 120 169 175 224 230 279 285 334 340 389 395 444 450
//DIRED-OPTIONS// --quoting-style=shell-escape

la propio est eadarak et le groupe proprio info.

'

# --> Changeé de groupe actif en licence.
newgrp licence

# --> Dans le répertoire tp4admin, nous allons créez les fichiers suivants : fic000, fic100, fic200, fic300, fic400, fic500, fic600, fic700. 

touch fic000 fic100 fic200 fic300 fic400 fic500 fic600 fic700

# --> Qui en est le propriétaire?
ls -ld fic* 
'
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic000
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic100
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic200
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic300
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic400
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic500
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic600
  -rw-rw-r-- 1 eadarak licence 0 janv.  5 18:30 fic700
//DIRED// 48 54 103 109 158 164 213 219 268 274 323 329 378 384 433 439
//DIRED-OPTIONS// --quoting-style=shell-escape

 proprietaire des fic* user = eadarak , group = licence
'

'
	un groupe actif est lie a la connexion
'

# --> Modifier le groupe propriétaire des fichiers fic000 et fic100 en master avec la commande chgrp.
sudo chgrp  master  fic000 fic100

# Nous souhaitons fixer les droits suivants pour les fichiers et répertoires. Utilisez la commande chmod -
# pour le faire en mode numérique pour les répertoires et en mode symbolique pour les fichiers.

# --> Pour rep000, fic000 droit 000;
chmod 000 rep000 fic000

# --> Pour rep100, fic100 droit 100;
chmod 100 rep1* fic1*

# --> Pour rep200, fic200 droit 200;
chmod u=w,go=w,o=w rep2* fic2*


# --  afficher 
cat /etc/passwd


