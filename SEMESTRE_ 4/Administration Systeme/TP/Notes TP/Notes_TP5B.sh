#~~ 2Le shell
#~ 2.1Métacaractères et substitution de noms de fichiers
# Activité 1
cd /dev/

#- affiche tous les fichiers commencant par tt;
ls -l tt*

#- affiche tous les fichiers commencant par tty et suivi de 3 caractere (tty???)
ls -l tty???

#- affiche tous les fichiers commencant par a ou b
ls -l [ab]*

#- affiche tous les fichiers ne commencant pas par les lettres comprise entre b et z
ls -l [^b-z]*

#- cela fait la meme chose que ls -l tt*
ls -l ''tt*''

#- affiche tous les fichiers se terminant par 0
ls -l *0

#- affiche tous les fichiers ou toutes les repertoires commencant par a ou b 
ls -ld [ab]*

#-affiche toutes les fichiers contenant un ou des chiffre [0-9]
ls -l *[0-9]*

#-  affiche toutes les fichiers commencant par tty et suivi d'une caractere
ls -l tty?

#- affiche  toutes les fichiers contenant "y"
ls -l *y*

#- affiche le nombre de terminal ouverte 
ls -l pts

#- affiche tous les fichiers ayant 5 caracteres
ls -l ?????
## !! Placez vous dans le répertoire /etc qui contient les fichiers de configuration. Que font les commandes suivantes :

mkdir ~/TP4

#- copier tous fichers qui sont dans /etc/systemd et se terminant par .conf dans /home/eadarak/TP4.
cp systemd/*.conf ~/TP4

#- copie de facon recursive toutes les fichiers de /etc commencant par cron dans ~/TP4
cp -r cron* ~/TP4


#~~Activité 2
#~ 2.2 Redirections et tubes
#- Le répertoire /usr/include contient les fichiers d’entête standards en langage C (stdlib.h, . . . ). placez vous dans ce répertoire et
#-- exécutez les commandes suivantes, que font elles?

#- affiche tous les fichiers commencant par std
ls -ld std*
#- affiches tous les fichiers commencant par std*
echo std*

#- recuperer la sortie de `echo std*` dans ~/TP4/stdfiles
echo std*> ~/TP4/stdfiles

#- afficher tous les fichiers commencant par a ou b
ls -ld [ab]*

#- affichage de tous les fichies commencant par a ou b ; s'il existe pas de fichiers commencanmt par a ou b il affiche la chaine([ab]*)
echo [ab]*

#-  afficher tous les fichiers commencant par a ou b et transformer les espaces en saut de lignes
echo [ab]* | tr ' ' '\n'

#==> Ici tr transforme les espaces (' ') en ('\n')

#- afficher le nombre de ligne de tous les fichiers commencant par a ou b et transformer les espaces en saut de lignes
echo [ab]* | tr ' ' '\n' | wc -l

#==> wc -l : compte le nbre de ligne et wc : compte le nombre de mot

#- redirige la sortie de la commande ` echo [ab]* | tr ” ” ”\n” ` dans le fichier /home/eadarak/TP4/abcfiles
echo [ab]* | tr ' ' '\n'> ∼/TP4/abcfiles

#- ajouter la sortie de la commande 'echo c* | tr ' ' '\n'` dans le fichier /home/eadarak/TP4/abcfiles
echo c* | tr ' ' '\n'>> ~/TP4/abcfiles
