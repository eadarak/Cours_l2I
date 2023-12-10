#lorsque qu'on branche une cle , il est considere comme block
# pour partition on utilise la commande 
fdisk /dev/sdc

#Quelle commande permet de formater en ext4 la première partition du disque?
mkfs.ext4 /dev/sdc1

#Quelle commande permet de formater en ntfs la deuxième partition du disque?
mkfs.ntfs /dev/sdc2

#Quelle commande permet de formater en fat la troisième partition du disque?
mkfs.fat /dev/sdc3

#Supposons que Moussa a pour répertoire de travail son répertoire personnel(/home/moussa). Donner la suite de commandes qui permettra
#à moussa de créer les répertoires suivants : /home/moussa/donnees, /mnt/donneesntfs et /media/donneesfat.
mkdir donnees /mnt/donneesntfs/ /media/donneesfat

#on ne monte que dans un repertoire vide sinon les donnees du repertoire se cachent.
#Commande pour la partition formatée en ext sur le répertoire /home/moussa/donnees.
mount -t ext4 /dev/ sdc1 donnees

#la partition formatée en ntfs sur le répertoire /mnt/donneesntfs.
mount -t ntfs /dev/sdc2 /mnt/donnees

#Quelles commandes permettront à Moussa de démonter les deux partitions montées?
umount donnees
umount /mnt/donneesntfs

#Dans quel fichier Moussa devra t’il consigner un montage automatique des partitions de son disque.
/etc/fstab

#on peut pas monter sans formater

