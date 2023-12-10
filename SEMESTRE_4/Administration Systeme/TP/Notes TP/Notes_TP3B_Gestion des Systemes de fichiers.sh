# Afficher la table de partionnnement de notre disque dur  identifie par le fichier special /dev/sda
sudo fdisk -l /dev/sda
"
	Disque /dev/sda : 476,94 GiB, 512110190592 octets, 1000215216 secteurs
	Disk model: SK hynix SC401 S
	Unités : secteur de 1 × 512 = 512 octets
	Taille de secteur (logique / physique) : 512 octets / 4096 octets
	taille d'E/S (minimale / optimale) : 4096 octets / 4096 octets
	Type d'étiquette de disque : gpt //format du disque 
	Identifiant de disque : E8B5F11F-E43B-4BAF-9B9E-8B6065D97492

	Périphérique   Début        Fin  Secteurs Taille Type
	/dev/sda1       2048    1050623   1048576   512M Système EFI
	/dev/sda2    1050624 1000214527 999163904 476,4G Système de fichiers Linux

"

#Afficher les block s#
sudo lsblk
"
	NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
	loop0    7:0    0  55,6M  1 loop /snap/core18/2667
	loop1    7:1    0     4K  1 loop /snap/bare/5
	loop2    7:2    0 243,1M  1 loop /snap/code/115
	loop3    7:3    0 116,7M  1 loop /snap/core/14399
	loop5    7:5    0  55,6M  1 loop /snap/core18/2654
	loop6    7:6    0  63,2M  1 loop /snap/core20/1695
	loop7    7:7    0  63,2M  1 loop /snap/core20/1738
	loop8    7:8    0  72,8M  1 loop /snap/core22/310
	loop9    7:9    0  72,9M  1 loop /snap/core22/444
	loop10   7:10   0 307,8M  1 loop /snap/eclipse/64
	loop11   7:11   0 314,6M  1 loop /snap/eclipse/66
	loop12   7:12   0 238,9M  1 loop /snap/firefox/2186
	loop13   7:13   0 238,4M  1 loop /snap/firefox/2211
	loop14   7:14   0 164,8M  1 loop /snap/gnome-3-28-1804/161
	loop15   7:15   0 346,3M  1 loop /snap/gnome-3-38-2004/119
	loop16   7:16   0  64,8M  1 loop /snap/gtk-common-themes/1514
	loop17   7:17   0  91,7M  1 loop /snap/gtk-common-themes/1535
	loop18   7:18   0 560,1M  1 loop /snap/pycharm-community/302
	loop19   7:19   0 590,1M  1 loop /snap/pycharm-community/310
	loop20   7:20   0 389,7M  1 loop /snap/qt515-core20/26
	loop21   7:21   0  45,9M  1 loop /snap/snap-store/599
	loop22   7:22   0  45,9M  1 loop /snap/snap-store/638
	loop23   7:23   0  49,6M  1 loop /snap/snapd/17883
	loop24   7:24   0   304K  1 loop /snap/snapd-desktop-integration/43
	loop25   7:25   0   304K  1 loop /snap/snapd-desktop-integration/49
	loop26   7:26   0 369,2M  1 loop /snap/telegram-desktop/4353
	loop27   7:27   0 369,5M  1 loop /snap/telegram-desktop/4384
	loop28   7:28   0 243,1M  1 loop /snap/code/116
	loop29   7:29   0  17,3M  1 loop /snap/whatsie/135
	loop30   7:30   0  17,3M  1 loop /snap/whatsie/136
	sda      8:0    0 476,9G  0 disk 
	├─sda1   8:1    0   512M  0 part /boot/efi
	└─sda2   8:2    0 476,4G  0 part /var/snap/firefox/common/host-hunspell
                                 /
	sdb      8:16   1  29,3G  0 disk 

"
#Afficher la table de partionnement de notre cle
sudo fdisk -l /dev/sdb
"
	Disque /dev/sdb : 29,3 GiB, 31457280000 octets, 61440000 secteurs
	Disk model: Flash Disk      
	Unités : secteur de 1 × 512 = 512 octets
	Taille de secteur (logique / physique) : 512 octets / 512 octets
	taille d'E/S (minimale / optimale) : 512 octets / 512 octets
	Type d'étiquette de disque : dos
	Identifiant de disque : 0xa88151d5
"
