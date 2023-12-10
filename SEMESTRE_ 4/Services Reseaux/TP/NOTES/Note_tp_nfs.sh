#~~~~~~~~~~~~~ NOTES NFS ~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# lister le /etc/ pour voir si les fichiers nfs sont visibles
ls /etc/

# aller dans /etc/
cd /etc/

# editer le exports pour juste voir
gedit exports

# creer un repertoire "L2i" dans le home  et un repertoire "serveur" dans la racine
mkdir ~/l2i
sudo mkdir /serveur

# configurer le fichier 
sudo gedit exports 

"
==> le fichier sera comme suit:
		# /etc/exports: the access control list for filesystems which may be exported
		#		to NFS clients.  See exports(5).
		#
		# Example for NFSv2 and NFSv3:
		# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
		#
		# Example for NFSv4:
		# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
		# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
		#
		#############################################################################################
		/serveur  192.168.1.2(rw,sync,no_subtree_check)
		/home/eadarak/l2i	192.168.1.2 (ro,sync,no_subtree_check)
	
"

# redemarrer le service nfs 
service nfs-kernel-server restart

# Voir le statut du service
service nfs-kernel-server status

"
==> sortie:
	     Loaded: loaded (/lib/systemd/system/nfs-server.service; enabled; vendor preset: enabled)
     Active: active (exited) since Mon 2023-01-23 15:59:13 GMT; 5s ago
    Process: 7785 ExecStartPre=/usr/sbin/exportfs -r (code=exited, status=0/SUCCESS)
    Process: 7786 ExecStart=/usr/sbin/rpc.nfsd (code=exited, status=0/SUCCESS)
   Main PID: 7786 (code=exited, status=0/SUCCESS)
        CPU: 11ms

		san 23 15:59:13 eadarak-latitude-7490 systemd[1]: Starting NFS server and services...
		san 23 15:59:13 eadarak-latitude-7490 exportfs[7785]: exportfs: No options for /home/eadarak/l2i 192.168.1.2: suggest 192.168.1.2(sync) to avoid warning
		san 23 15:59:13 eadarak-latitude-7490 exportfs[7785]: exportfs: /etc/exports [2]: Neither 'subtree_check' or 'no_subtree_check' specified for export 192.168.1.2:/home/eada>
		san 23 15:59:13 eadarak-latitude-7490 exportfs[7785]:   Assuming default behaviour ('no_subtree_check').
		san 23 15:59:13 eadarak-latitude-7490 exportfs[7785]:   NOTE: this default has changed since nfs-utils version 1.0.x
		san 23 15:59:13 eadarak-latitude-7490 exportfs[7785]: exportfs: No host name given with /home/eadarak/l2i (ro,sync,no_subtree_check), suggest *(ro,sync,no_subtree_check) to>
		san 23 15:59:13 eadarak-latitude-7490 systemd[1]: Finished NFS server and services.
"

# regarder le status des pare-feux 
sudo ufw status
"
==> sortie:
	État : actif

	Vers                       Action      De
	----                       ------      --
	10000                      ALLOW       Anywhere                  
	20/tcp                     ALLOW       Anywhere                  
	21/tcp                     ALLOW       Anywhere                  
	40000:50000/tcp            ALLOW       Anywhere                  
	10000 (v6)                 ALLOW       Anywhere (v6)             
	20/tcp (v6)                ALLOW       Anywhere (v6)             
	21/tcp (v6)                ALLOW       Anywhere (v6)             
	40000:50000/tcp (v6)       ALLOW       Anywhere (v6) 
	
	##on verra que le port 2049 n'est pas active
	
"

# ajouter le port 2049
sudo ufw allow 2049/tcp
#reverifier le status des pare-feu
sudo ufw status
"
==> sortie:
	État : actif

	Vers                       Action      De
	----                       ------      --
	10000                      ALLOW       Anywhere                  
	20/tcp                     ALLOW       Anywhere                  
	21/tcp                     ALLOW       Anywhere                  
	40000:50000/tcp            ALLOW       Anywhere                  
	10000 (v6)                 ALLOW       Anywhere (v6)             
	20/tcp (v6)                ALLOW       Anywhere (v6)             
	21/tcp (v6)                ALLOW       Anywhere (v6)             
	40000:50000/tcp (v6)       ALLOW       Anywhere (v6) 
	2049/tcp (v6)              ALLOW       Anywhere (v6)   
	
"
# on peut activer le service en faisant
sudo systemctl restart nfs-kernel-server

###############################################################################################################################
# POUR LE CLIENT

#il charge nfs-common
sudo /etc/init.d/nfs-common reload
sudo /etc/init.d/nfs-common restart

# il doit monter le dossier qu'il veut monter dans le repertoire ou il veut le monter
sudo mount @IpSERVEUR:/serveur PointDeMontage
