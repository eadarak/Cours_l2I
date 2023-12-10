#* Notes du tp de dhcp *#

# --> aller dans le fichier /etc/dhcp/
cd /etc/dhcp/
# --> editer le fichier dhcpd.conf
sudo gedit dhcpd.conf 

"
Le serveur DHCP assignera au client une adresse IP comprise entre 192.168.1.10 et 192.168.1.100 ou entre
192.168.1.150 et 192.168.1.200 pour une durée de 600 secondes. Le client peut spécifier une période de
temps spécique, dans ce cas, le temps d'allocation maximum est de 7200 secondes.
Le serveur va également informer le client qu'il doit utiliser :
 un masque de sous réseau à 255.255.255.0
 une adresse de multi-diffusion à 192.168.1.255
 une adresse de routeur/passerelle à 192.168.1.254
 des serveurs DNS à 192.168.1.1 et 192.168.1.2
 un suffixe DNS l2i.sn
"
# --> voir le statut du service pour voir 
service named status
"
-=> sortie:
● named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2023-01-07 11:23:54 GMT; 1h 24min ago
       Docs: man:named(8)
   Main PID: 824 (named)
      Tasks: 18 (limit: 18972)
     Memory: 17.1M
        CPU: 1.526s
     CGroup: /system.slice/named.service
             └─824 /usr/sbin/named -u bind

san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:500:2f::f#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:7fe::53#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:7fd::1#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:500:9f::42#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:dc3::35#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:500:1::53#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:500:12::d0d#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:503:ba3e::2:30#53
san 07 12:48:32 eadarak-latitude-7490 named[824]: network unreachable resolving '_.googleapis.com/A/IN': 2001:500:2d::d#53
san 07 12:48:34 eadarak-latitude-7490 named[824]: shut down hung fetch while resolving 'clientservices.googleapis.com/A'
"
# --> redemarrer le service et voir le status du  service
service isc-dhcp-server status
service isc-dhcp-server restart


"
● isc-dhcp-server.service - ISC DHCP IPv4 server
     Loaded: loaded (/lib/systemd/system/isc-dhcp-server.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2023-01-11 12:09:02 GMT; 7s ago
       Docs: man:dhcpd(8)
   Main PID: 6504 (dhcpd)
      Tasks: 4 (limit: 18972)
     Memory: 4.6M
        CPU: 23ms
     CGroup: /system.slice/isc-dhcp-server.service
             └─6504 dhcpd -user dhcpd -group dhcpd -f -4 -pf /run/dhcp-server/dhcpd.pid -cf /etc/dhcp/dhcpd.conf

san 11 12:09:02 eadarak-latitude-7490 sh[6504]: Listening on LPF/enp0s31f6/c8:f7:50:49:f2:02/192.168.1.0/24
san 11 12:09:02 eadarak-latitude-7490 sh[6504]: Sending on   LPF/enp0s31f6/c8:f7:50:49:f2:02/192.168.1.0/24
san 11 12:09:02 eadarak-latitude-7490 sh[6504]: Sending on   Socket/fallback/fallback-net
san 11 12:09:02 eadarak-latitude-7490 dhcpd[6504]: Sending on   LPF/enp0s31f6/c8:f7:50:49:f2:02/192.168.1.0/24
san 11 12:09:02 eadarak-latitude-7490 dhcpd[6504]: Sending on   Socket/fallback/fallback-net
san 11 12:09:02 eadarak-latitude-7490 dhcpd[6504]: Server starting service.
san 11 12:09:06 eadarak-latitude-7490 dhcpd[6504]: DHCPDISCOVER from 6c:02:e0:c8:33:a9 via enp0s31f6
san 11 12:09:07 eadarak-latitude-7490 dhcpd[6504]: DHCPOFFER on 192.168.1.10 to 6c:02:e0:c8:33:a9 (DESKTOP-58JJNUK) via enp0s31f6
san 11 12:09:07 eadarak-latitude-7490 dhcpd[6504]: DHCPREQUEST for 192.168.1.10 (192.168.1.1) from 6c:02:e0:c8:33:a9 (DESKTOP-58JJNUK) via enp0s31f6
san 11 12:09:07 eadarak-latitude-7490 dhcpd[6504]: DHCPACK on 192.168.1.10 to 6c:02:e0:c8:33:a9 (DESKTOP-58JJNUK) via enp0s31f6

"

# --> Configuration : Adresses IP fixes uniquement
sudo gedit dhcpd.conf

"
deny unknown-clients; ==>L'option deny unknown-clients interdit l'attribution d'une adresse IP à une station dont l'adresse 		MAC est inconnue du serveur.
subnet 192.168.1.0 netmask 255.255.255.0 {
       ==>fixer un adresse ip pour les clients dont les @MAC ont ete specifies
	host client1 {
		hardware ethernet 6c:02:e0:c8:33:a9;
		fixed-address 192.168.1.30;
	}	
	
	host client2 {
		hardware ethernet c8:f7:50:3d:66:bd;
		fixed-address 192.168.1.19;
	}
	
	host client3 {
		hardware ethernet c8:f7:50:36:4b:3c;
		fixed-address 192.168.1.18;
	}
	
	host client4 {
		hardware ethernet a0:1d:48:b4:9f:ee;
		fixed-address 192.168.1.170;
	}

	
}
	

}
"

" ca permet de demarrer  le service reseau de la carte ethernet	"
# --> Pour trouver l'adresse MAC d'une interface réseau, il faut taper la commande :
 ifconfig | grep HWaddr
# --> ou pour les version récentes qui n'incluent pas le paquet net-tools par défaut :
ip a

# ~~~~~ Ecoutes sur plusieurs interfaces ~~~~~~~~#
"Pour que le serveur écoute sur certaines interfaces, il faut les spécier dans /etc/default/isc-dhcp-
server :
 INTERFACES="'eth0 eth1'	"
Dans ce cas l'écoute se fait sur eth0 et eth1
"

"
	le fichier se presentera comme suit :
	# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

	# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
	#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
	#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

	# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
	#DHCPDv4_PID=/var/run/dhcpd.pid
	#DHCPDv6_PID=/var/run/dhcpd6.pid

	# Additional options to start dhcpd with.
	#	Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
	#OPTIONS=""

	# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
	#	Separate multiple interfaces with spaces, e.g. "'eth0 eth1'".
	INTERFACESv4=""
I	NTERFACESv6=""
	INTERFACES=" 'eth0 eth1' " ==> j'ai mis les '' pour mettre eth0 et eth 1 en commentaires
	 
"
