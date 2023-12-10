mx=0.308
Sx=0.267 #ecart-type 
my=0.388
Sy=0.169
# on note que la correlation est negatif
#1- 
R2=0.72
# on sait que r^2=R^2 donc la correlation r sera egale a 
# - racine carre de R^2 vu que la corellation est negatif.
r= -1 *sqrt(R2)
r= round(r, digits = 3)
## Conclusion:
## r=-0.849 ==> les deux variable sont fortement et negativement correlee

#2- Calculons l'intercept et la pente 

#on donne r=(Sx/Sy)*b donc b=r*(Sy/Sx)
b= round(((r*Sy)/Sx), digits = 3) # la pente = -0.537

# on sait que a= my-bmx;
a=round((my-b*mx),digits=3) # l'intercep = 0.533
# donc la droite de regression y = a+bx

#3- Interpretation de la valeur de l'intercept
# a=0.533 ==> a l'absence d'aide sociale, %53,3% des cyclistes portes des casques.
#  x= aide sociale , y= cycliste portant une casque.

#4- 
# b=-0.537 => l'aide sociale defavorise le port de casque.
##Interpretation de la pente en cas general:
#y=a+bx ==> Une augmentation d'une unite de x va entrainer 
# une augmentation de b unite de y(si b>0).
## Dans notre cas , l'augmentation d'une unite sociale entraine
# la dimunition de 0.537 du port de casque.Donc l'aide sociale
# defavorise le port de casque.

#5-
x13=0.4 
y13=0.4 # ceci est la valeur observee
#on sait 
y13_chapeau= a+b*y13 #  ceci est la valeur predite
#calculer la valeur de la residu 
E13= y13-y13_chapeau
# le residu mesure la valeur observe a la valeur qu'on aurait du observe
# on la residu = 0.0618
##conclusion:
# => le residu mesure l'ecart entre la valeur observe et la valeur 
#predite . La valeur du residu esr]t faible soit 6,18%


