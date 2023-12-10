#~~~~ NOTES TP3 ~~~~#

bash tp_systeme_fichier2022.sh 
# //cela va creer toutes les objets contenues dans le fichier.sh #
 
#//afficher la repertoire de maniere recursive (-R) en long format(-l)  et avec les inodes(-i) ==> (ls -liR)
ls -liR
 
 #//faire le commandes de l'activite 3-1

#
#//lien physique c'est une copie du fichier si on supprime le fichier le fichier creer par le lien physique ne sera pas supprimer
#// Lien symbolique creer un fichier (fichier raccourcis) qui pointe sur le fichier cible  exemple :ln -s divers1.txt divers4.txt 
#lorsque divers1 est supprimer on peut plus acceder au contenue de divers4"


#//"editer le fichier divers1.txt l' 'afficher grace a divers4.txt"'

eadarak@eadarak-latitude-7490:~/bash$ gedit divers1.txt
eadarak@eadarak-latitude-7490:~/bash$ cat divers4.txt
# ==>Bonjour, je suis divers1.txt,  j''ai un lien symbolique qui est divers4.txt'''

rm divers1.txt

cat divers4.txt
# ==>cat: divers4.txt: Aucun fichier ou dossier de ce type'

#// lorsque divers est supprimer on peut acceder au contenu de la fichier divers4.txt 
#donc le lien physique ou directe cree un clone'

###################################################################################
#Remarque
#Pour creer un lien ou un lien physique il faut mettre la commande ln
#Pour les liens symboliques c''est ln -s'
####################################################################################

# // Creer un fichier test; la commande qui le fait est touch
touch test

# // Creer un repertoire mon repertoire
mkdir monrep

# // Supprimer le repertoire VIDE
rm -d VIDE

# //Supprimer le repertoire NONVIDE
rm -dR NONVIDE

# // Creer un copie du fichier test nomme test2
cp test test2

# // Creer un copie du copie php nomme php2
cp -r  php php2

# // renommer le fichier test en test5
mv test test5
 

