####################### Notes TP 5A - Processus et tâches ###############################

#~ Affichage des processus
# ==> ps : processus active ;
ps
" ===> sortie

  PID TTY          TIME CMD
   4192 pts/0    00:00:00 bash
   4200 pts/0    00:00:00 ps

   PID : l'identifiant du processus
   TTY: le terminal associé au processus cela change par rapport au nombre de terminal ouvert
   CMD : le nom de l'exécutable
-------------------------------------------------------------------------------------------------------------------
Par défaut, ps sélectionne tous les processus avec le même identifiant utilisateur effectif (euid=EUID) 
que l'utilisateur en cours et associés au même terminal que l'appelant. Il affiche l'identifiant de processus 
(pid=PID), le terminal associé au processus (tname=TTY), le temps CPU cumulé au format [JJ-]HH:MM:SS
(time=TIME) et le nom de l'exécutable (ucmd=CMD). La sortie n'est pas ordonnée par défaut.
"
  
# ==> ps  -f :Faire une liste au format complet des processus aactive
ps -f
" ===> Sortie
    UID          PID    PPID  C STIME TTY          TIME CMD
    eadarak     4192    4168  0 17:24 pts/0    00:00:00 bash
    eadarak     4426    4192  0 17:32 pts/0    00:00:00 ps -f

    PPID: l'identifiant du processus parent
    C : 
    STIME : la date d'execution du processus
"

# ==> ps -T : Montrer les processus légers, si possible avec la colonne SPID.
ps -T
"
    PID    SPID TTY          TIME CMD
    4192    4192 pts/0    00:00:00 bash
    4473    4473 pts/0    00:00:00 ps

"

# ==> ps -TF
ps -Tf
"
    UID          PID    SPID    PPID  C STIME TTY          TIME CMD
    eadarak     4192    4192    4168  0 17:24 pts/0    00:00:00 bash
    eadarak     4737    4737    4192  0 17:43 pts/0    00:00:00 ps -Tf
"

# ==> ps -A :Sélectionner tous les processus.
ps -A

# ==> top : affiche les processus linux.
top

# ==> ps -e : identique a ps -A
ps -e

# ==> ps -u nomUtilisateur : affiche les processus associe au nom entre;
top -u root 


"
REMARQUE 
-----------------------------------------------------------------------------------------
 CLÉ   LONGUE       DESCRIPTION
       c     cmd          juste le nom de l'exécutable
       C     pcpu         utilisation du CPU
       f     attributs    indicateurs comme le champ F du format long
       g     pgrp         GID du processus
       G     tpgid        GID du processus contrôlant le tty
       j     cutime       temps utilisateur cumulé
       J     cstime       temps système cumulé
       k     utime        temps utilisateur
       m     min_flt      nombre de défauts de page mineurs
       M     maj_flt      nombre de défauts de page majeurs
       n     cmin_flt     défauts de page mineurs cumulés
       N     cmaj_flt     défauts de page majeurs cumulés
       o     session      identifiant de session
       p     pid          identifiant de processus (PID)
       P     ppid         PID du processus parent
       r     rss          taille de mémoire résidente
       R     resident     pages résidentes
       s     size         taille mémoire en kilooctets
       S     share        nombre de pages partagées
       t     tty          numéro de périphérique du tty contrôlant
       T     start_time   heure de démarrage du processus
       U     uid          identifiant utilisateur (UID)
       u     user         nom d'utilisateur
       v     vsize        taille totale de mémoire virtuelle en kibioctets
       y     priority     priorité d'ordonnancement du noyau
"