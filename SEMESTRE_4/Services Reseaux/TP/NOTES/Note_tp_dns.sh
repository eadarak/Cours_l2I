#~~ NOTES DU TP DNS ~~#
#Installer bind9
sudo apt-get install bind9


## La commande ci-dessus pour voir ce qui dans le bind si ce n'est pas installer cela ne va pas afficher 
ls /etc/bind/
## ==>(sortie) bind.keys  db.0  db.127  db.255  db.empty  db.local  named.conf  named.conf.default-zones  named.conf.local  named.conf.options  rndc.key  zones.rfc1918 ##

## On veut declarer une zone l2i.sn 
:'~ Pour cela
1-on declare la zone
2- configurer la zone

Remarque : pour configurer il faut etre en mode administrateur
NB : named.conf.default-zones --> configuration de fichier zone
':

# aller dans  /etc/bind 
cd /etc/bind/

#Afficher ce qui dans le bind
ls
:'bind.keys  db.0  db.127  db.255  db.empty  db.local  named.conf  named.conf.default-zones  named.conf.local  named.conf.options  rndc.key  zones.rfc1918':

#creer un fichier pour configurer notre zone (default-zones c'est pour la declaration de la zone par defaut)
sudo gedit named.conf.default-zones 
#Ne touchez pas a la fichier qu'on vient de creer  c'est juste pour copier la zone localhost //

# Comment declarer la zone ? #
:" zone "NomZone" {
	type master; #le type master est le serveur maitre et le type slave est le serveur esclave ( qui ne fonctionne que quand le serveur maitre ne fonctione pas )#
	file "/etc/bind/db.Nomzone";
};":

#la declaration du zone on le met dans le named.conf.local
sudo gedit named.conf.local 

#Maintenant on declare la zone l2i.sn 
:'zone "l2i.sn" {
	type master;
	file "/etc/bind/db.l2i.sn";
}; ':


#~ on va tester si le fichier de zone qu'on vient de creer marche ou pas ~#
#verifier si la zone est correcte ou marche 
named-checkconf named.conf.local 

#~ Remarque : si cela marche rien ne va s'afficher ~#

#~ A chaque qu'on configure il faut le redemarrer le service ~#

#redemarrer le service de nom avec :
service named 
# * Usage: /etc/init.d/named {start|stop|reload|restart|force-reload|status}
#~ Apres le service named par rapport a l'operation qu'on veut faire on utilise les operations ci-dessus ~#
 
service named status
:" named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2022-12-03 10:25:40 GMT; 2h 34min ago
       Docs: man:named(8)
    Process: 940 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)
   Main PID: 993 (named)
      Tasks: 18 (limit: 18972)
     Memory: 15.3M
        CPU: 795ms
     CGroup: /system.slice/named.service
             └─993 /usr/sbin/named -u bind

des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:2::c#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:dc3::35#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:2d::d#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:1::53#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:9f::42#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:a8::e#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: network unreachable resolving './DNSKEY/IN': 2001:500:200::b#53
des 03 11:25:40 eadarak-latitude-7490 named[993]: managed-keys-zone: Key 20326 for zone . is now trusted (acceptance timer complete)
des 03 11:35:37 eadarak-latitude-7490 named[993]: no longer listening on fe80::1248:ef72:f1:58cf%3#53
des 03 11:35:37 eadarak-latitude-7490 named[993]: no longer listening on 10.158.107.199#53

♦️eadarak@eadarak-latitude-7490:/etc/bind$ service named stop

♦️eadarak@eadarak-latitude-7490:/etc/bind$ service named status 
○ named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Sat 2022-12-03 13:04:21 GMT; 12s ago
       Docs: man:named(8)
    Process: 940 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)
    Process: 6529 ExecStop=/usr/sbin/rndc stop (code=exited, status=0/SUCCESS)
   Main PID: 993 (code=exited, status=0/SUCCESS)
        CPU: 847ms

des 03 13:04:21 eadarak-latitude-7490 systemd[1]: Stopping BIND Domain Name Server...
des 03 13:04:21 eadarak-latitude-7490 named[993]: received control channel command 'stop'
des 03 13:04:21 eadarak-latitude-7490 named[993]: no longer listening on 127.0.0.1#53
des 03 13:04:21 eadarak-latitude-7490 named[993]: no longer listening on ::1#53
des 03 13:04:21 eadarak-latitude-7490 named[993]: shutting down: flushing changes
des 03 13:04:21 eadarak-latitude-7490 named[993]: stopping command channel on 127.0.0.1#953
des 03 13:04:21 eadarak-latitude-7490 named[993]: stopping command channel on ::1#953
des 03 13:04:21 eadarak-latitude-7490 named[993]: exiting
des 03 13:04:21 eadarak-latitude-7490 systemd[1]: named.service: Deactivated successfully.
des 03 13:04:21 eadarak-latitude-7490 systemd[1]: Stopped BIND Domain Name Server.

♦️eadarak@eadarak-latitude-7490:/etc/bind$ service named start 

♦️eadarak@eadarak-latitude-7490:/etc/bind$ service named status 
● named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2022-12-03 13:04:46 GMT; 4s ago
       Docs: man:named(8)
    Process: 6570 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)
   Main PID: 6571 (named)
      Tasks: 10 (limit: 18972)
     Memory: 7.1M
        CPU: 53ms
     CGroup: /system.slice/named.service
             └─6571 /usr/sbin/named -u bind

des 03 13:04:46 eadarak-latitude-7490 named[6571]: network unreachable resolving './NS/IN': 202.12.27.33#53
des 03 13:04:46 eadarak-latitude-7490 named[6571]: network unreachable resolving './DNSKEY/IN': 199.9.14.201#53
des 03 13:04:46 eadarak-latitude-7490 named[6571]: zone 255.in-addr.arpa/IN: loaded serial 1
des 03 13:04:46 eadarak-latitude-7490 named[6571]: managed-keys-zone: Unable to fetch DNSKEY set '.': failure
des 03 13:04:46 eadarak-latitude-7490 named[6571]: network unreachable resolving './NS/IN': 199.9.14.201#53
des 03 13:04:46 eadarak-latitude-7490 named[6571]: zone localhost/IN: loaded serial 2
des 03 13:04:46 eadarak-latitude-7490 named[6571]: resolver priming query complete: failure
des 03 13:04:46 eadarak-latitude-7490 named[6571]: all zones loaded
des 03 13:04:46 eadarak-latitude-7490 named[6571]: running
des 03 13:04:46 eadarak-latitude-7490 systemd[1]: Started BIND Domain Name Server.":

#~ Resolution de nom ~#
ls
#bind.keys  db.0  db.127  db.255  db.empty  db.local  named.conf  named.conf.default-zones  named.conf.local  named.conf.options  rndc.key  zones.rfc1918

#voir le fichier de configuration localehost
sudo gedit db.local

# Creer d'une fichier de zone db.l2i.sn en copier le fichier zone de db.local
sudo cp db.local  db.l2i.sn

ls
#bind.keys  db.0  db.127  db.255  db.empty  db.l2i.sn  db.local  named.conf  named.conf.default-zones  named.conf.local  named.conf.options  rndc.key  zones.rfc1918

#editer le fichier de zone db.l2i.sn pour les modif veuillez suivre le fiche de tp
sudo gedit db.l2i.sn
#~ CNAME permet de creer de alias ~#

#After modication on sauvegarde et on fait un checkzone(verification) pour voir si la configuration de la zone c'est bien passe.
named-checkzone  l2i.sn db.l2i.sn
:"zone l2i.sn/IN: loaded serial 2
OK //Youpi!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ca marche //"

#redemarrer le service
service named restart 

# ouvrir le fichier zone
gedit db.l2i.sn

"
 on doit configurer le reseau filaire ou connexion filaire .
pour cela on clique sur la connexion filaire puis appuie sur parametre 
aller a IPV4  qu'on configure manuellement;
Configurer l'adresse Ip : 192.168.1.1
configurer le masque de sous reseau : 255.255.255.0
Configurer le passerelle : 255.255.255.254

Puis on desactive le dns automatique 
En configurant soit le dns est configure en tant que server ou client (cela est configurer dans la fichier zone db.l2i.sn);

puis on desactive les routes automatique;

cliquez sur 'appliquez'

puis redemarrer le serveur cela se fait sur ligne de commande  dans n'importe qu'elle repertoire qu'on est

"


# redemarrer le service network
service NetworkManager restart

#pinger le reseau 192.168.1.2
ping 192.168.1.2
"PING 192.168.1.2 (192.168.1.2) 56(84) bytes of data.
64 bytes from 192.168.1.2: icmp_seq=1 ttl=64 time=0.541 ms
64 bytes from 192.168.1.2: icmp_seq=2 ttl=64 time=1.44 ms
64 bytes from 192.168.1.2: icmp_seq=3 ttl=64 time=1.44 ms
64 bytes from 192.168.1.2: icmp_seq=4 ttl=64 time=1.43 ms
64 bytes from 192.168.1.2: icmp_seq=5 ttl=64 time=1.44 ms
^C
--- 192.168.1.2 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4035ms
rtt min/avg/max/mdev = 0.541/1.257/1.440/0.358 ms"
#le reseau marche car des paquets imcp sont envoyer.

#cela correspond aussi au pingage machine1.l2i.sn
ping machine1.l2i.sn
"PING machine1.l2i.sn (192.168.1.2) 56(84) bytes of data.
64 bytes from 192.168.1.2 (192.168.1.2): icmp_seq=1 ttl=64 time=1.30 ms
64 bytes from 192.168.1.2 (192.168.1.2): icmp_seq=2 ttl=64 time=1.43 ms
64 bytes from 192.168.1.2 (192.168.1.2): icmp_seq=3 ttl=64 time=0.753 ms
64 bytes from 192.168.1.2 (192.168.1.2): icmp_seq=4 ttl=64 time=1.28 ms
64 bytes from 192.168.1.2 (192.168.1.2): icmp_seq=5 ttl=64 time=1.22 ms

--- machine1.l2i.sn ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 0.753/1.197/1.432/0.232 ms
"

#Mettre le CNAME dans le fichier zone "db.l2i.sn"
#redemarrer le serveur de nom avec 
service named restart 

#faire un checkconf 
named-checkconf named.conf.local 

#faire un checkzone 
#named-checkzone l2i.sn db.l2i.sn 
'==>zone l2i.sn/IN: loaded serial 2
OK'
"-----------------------------------------------------------------------------------------"
# on reouvre la fichier zone(named.conf.local) pour declare une zone inverse(qui est un dans le tp_dns Q7)
sudo gedit named.conf.local 

#on copie la configuration de db.127 sur le db.192
sudo cp db.127 db.192

#on configure le db.192 (zone inverser)
sudo gedit db.192

# faire un checkzone de la zone inverse
named-checkzone 1.168.192.in-addr.arpa db.192
"zone 1.168.192.in-addr.arpa/IN: loaded serial 201809121
OK"

#redemarrer le service de nom
service named restart

# verifie si le serveur dns est ok
nslookup 192.168.1.1
"
1.1.168.192.in-addr.arpa	name = eadarak-latitude-7490.
1.1.168.192.in-addr.arpa	name = eadarak-latitude-7490.local
"

#nslookup verifie s'il ya un serveur associe a l'addresse entree

#dig verifie si la resolution de nom est ok  dig et nslookup font la meme chose mais dig est plus bavard et complet
dig @192.168.1.1 -x 192.168.1.2
# SYNTAXE DU DIG : dig @IPSERVER -x @IP
# l’option -x à la commande dig pour pouvoir demander au serveur DNS de résoudre une adresse IP.
"
; <<>> DiG 9.18.1-1ubuntu1.2-Ubuntu <<>> @192.168.1.1 -x 192.168.1.2
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 29858
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: 39fd3057f662ca8a01000000639dbfeb83b5539ec340a11a (good)
;; QUESTION SECTION:
;2.1.168.192.in-addr.arpa.	IN	PTR  // ligne ou on a resolu l'adresse;

;; Query time: 0 msec
;; SERVER: 192.168.1.1#53(192.168.1.1) (UDP)
;; WHEN: Sat Dec 17 13:11:07 GMT 2022
;; MSG SIZE  rcvd: 81
"

" 
NSLOOKUP
donne le nom du serveur qui a fait la resolution inverse  si on entre la une adresse IP,
si on entre un nom ce la donne la resolution du serveur dns correspondant 
"

"
==================================================================================
si C'est un serveur debian:

/etc/network/interfaces ==> pour la configurations du reseau

/etc/resolve.conf ==> c'est la ou fait les configurations de zone

==================================================================================
Network manager sur ubuntu  a simplifier les repertoire ci-dessus sur ubuntu;
"

"Le bind n'a pas besoin de lire sur une interface d'ecoute "

