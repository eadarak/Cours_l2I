# Cas où X et Y sont quantitatifs
# Exemple : Etude de la liaison entre Age et Diamètre
age = 1:7
diam = c(3,5,10,11,17,18,20)
# Nuage de points
plot(age,diam,xlab="Age (ann�es)",ylab = "Diamétre (cm)",col="red")
cor(age,diam) 
# Le nuage montre que les variables age et diam�tre sont lin�aire.
# Si l'une des variables augmente l'autre augmente aussi
# le coefficient de corrélation r= 0.9844952 qui est tr�s 
# proche de 1 montre les deux variables sont fortement
# positivement corrélées.

# On veut tester H0 : r=0 (pas de liaison linéaire) 
# contre H1 : r¡=0 (liaison linéaire) au seuil de 5%  

cor.test(age,diam)

# la p.value du test est �gale à 5.702.10^-5 qui est inf�rieure
# à 5%, donc on rejette H0. 
# Avec un risque de 5%, les deux variables sont li�es
#linéairement

# Cas o� X qualitatif et Y quantitatif
femme =c(2.8,3,3,3.2,3.3)
homme=c(3,3.2,3.4,3.6)
#contruire le diagramme en moustache avec la fonction boxplot(V1,V2)
boxplot(femme,homme,col=c("green","orange"))
# Au vue de ce graphique, on observe une diff�rence visible 
#entre les boites à moustaches, donc il y a bien une influence
# de la variable sexe sur la variable poids.


#cas o� X et Y sont qualitatif.
Mat1= rbind(c(16,22,46,14),c(20,12,85,6),c(34,8,24,12))
#transformer la matrice Mat1 en table avec la fonction Nom_table=as.table(Nom_Matrice)
tabcont = as.table(Mat1)
#remommer les axes du tableau avec la fonction dimnames(nom_table)= list().
dimnames(tabcont) = list( Division = c("D1","D2","D3"),Type=c("A","B","C","D") )
#construire une diagramme en barre avec la fonction barplot(nom_table)
barplot(tabcont,col=c(2,5,8))
#Au vue de ce graphique, les deux variables 
#division et type de defectuosit� sont li�es.

# Notons par X:Variable division, et Y:le type de defectuosit�
# On veut tester l'hypothese H0: X et Y sont independants 
# Contre l'hypothese H1: X et Y sont d�pendants au seuil de 5%
chisq.test(tabcont)
#la p.value du test est egale � 2.281e-08 qui est inferieure � 5%
# donc on rejette H0.
# Donc, avec un  risque de 5% la division et le type de defectuosit� sont li�es.
