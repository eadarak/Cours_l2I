#------------------------------ NOTES TP FTP -------------------------------------------------#

#DEMARRER LE SERVICE FTP
sudo /etc/init.d/vsftpd start 
'
  ==> Starting vsftpd (via systemctl): vsftpd.service.
'
# Autoriser le port 20
sudo ufw allow 20/tcp
Les règles ont été mises à jour
Les règles ont été mises à jour (IPv6)

# Autoriser le port 21 
sudo ufw allow 21/tcp
Les règles ont été mises à jour
Les règles ont été mises à jour (IPv6)

# Autoriser les plages de port 40000-50000
sudo ufw allow 40000:50000/tcp
Les règles ont été mises à jour
Les règles ont été mises à jour (IPv6)

#Activer le pare-feu
sudo ufw enable
Le pare-feu est actif et lancé au démarrage du système
# donner le statut du pare-feu
sudo ufw status

"
==>
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
"

# creer l'utilisateur ftpuser
sudo adduser ftpuser

# creer le repertoire ftp dans /home/ftpuser
sudo mkdir /home/ftpuser/ftp

# changer les proprietes nobody:nogroup
sudo chown nobody:nogroup /home/ftpuser/ftp

#voir les proprietes du repertoires du ftp
ls -ld /home/ftpuser/ftp/

# enlever le droit d'ecriture a tout le monde pour le repertoire ftp
sudo chmod a-w /home/ftpuser/ftp

# creer le repertoire Docs dans le repertoire
sudo mkdir /home/ftpuser/ftp/Docs

# changer les proprietes ftpuser:ftpuser
sudo chown ftpuser:ftpuser /home/ftpuser/ftp/Docs

# changer le repertoire courant en /etc
cd /etc/

#editer le fichier de configuration
sudo gedit vsftpd.conf 

#voir le status
sudo /etc/init.d/vsftpd status

# redemarrer le service ftp
sudo /etc/init.d/vsftpd restart
"
==> sortie
	● vsftpd.service - vsftpd FTP server
	     Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset: enabled)
	     Active: active (running) since Sat 2023-01-21 10:10:29 GMT; 2h 29min ago
	    Process: 779 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited, status=0/SUCCESS)
	   Main PID: 782 (vsftpd)
	      Tasks: 1 (limit: 18972)
	     Memory: 1.0M
		CPU: 5ms
	     CGroup: /system.slice/vsftpd.service
		     └─782 /usr/sbin/vsftpd /etc/vsftpd.conf

	san 21 10:10:29 eadarak-latitude-7490 systemd[1]: Starting vsftpd FTP server...
	san 21 10:10:29 eadarak-latitude-7490 systemd[1]: Started vsftpd FTP server.
	sudo /etc/init.d/vsftpd restart
	Restarting vsftpd (via systemctl): vsftpd.service.
"
sudo /etc/init.d/vsftpd status
"
==>sorite
		● vsftpd.service - vsftpd FTP server
		     Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset: enabled)
		     Active: active (running) since Sat 2023-01-21 12:39:41 GMT; 5s ago
		    Process: 49111 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited, status=0/SUCCESS)
		   Main PID: 49112 (vsftpd)
		      Tasks: 1 (limit: 18972)
		     Memory: 852.0K
			CPU: 11ms
		     CGroup: /system.slice/vsftpd.service
			     └─49112 /usr/sbin/vsftpd /etc/vsftpd.conf

		san 21 12:39:41 eadarak-latitude-7490 systemd[1]: Starting vsftpd FTP server...
		san 21 12:39:41 eadarak-latitude-7490 systemd[1]: Started vsftpd FTP server.

"

