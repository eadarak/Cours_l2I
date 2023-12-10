########################################## CONFIG AUTOFS ################################################################
cd /etc/

#~ EDITER  LE FICHIER AUTO.MASTER
sudo gedit auto.master

"
 ===> METTRE
 /<point_de_montage_parent> /etc/auto.nfs --ghost,--timeout=30
 
 <point_de_montge_parents>==> dossier qu'on veut partager en local
 </etc/auto.nfs>==> le fichier qui contient le partage
 
 /media/Serveur-Local /etc/auto.nfs --ghost,--timeout=30
"

# EDITER le fichier auto.nfs
sudo gedit auto.nfs

"
autofs utilise le port 445
"

