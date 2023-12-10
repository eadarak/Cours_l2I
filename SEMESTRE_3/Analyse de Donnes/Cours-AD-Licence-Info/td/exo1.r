skidata = read.table("C:/Users/El Abdou DRAME/Desktop/L2I-2021_officiel/DEUXIEME ANNEE/Analyse de Donnes/Cours-AD-Licence-Info/td/ski.txt", header = TRUE)
ski=skidata[-1]
ski_X= ski[[1]]
ski_Y = ski[[2]]
plot(ski_X,ski_Y,xlab="Nombre de skieur",ylab="Nombre d'accident", col="red")
#d'apres le nuage de point les variables semblent etre lineaire.
cor(ski_X,ski_Y)
# le coefficient de corrélation r= 0.9766149 qui est
# proche de 1 montre les deux variables sont fortement corrélées.
cor.test(ski_X,ski_Y)
#le p_value est inferieure a 5% donc au seuil de 5 %
#l'augmentation du nombre de skieurs entraine l'augmentation du nombre d'accident
# somme des xi = 53000; somme des yi = 2200; produit xiyi = 12102000
# somme des yi^2 = 498800 ; somme des xi^2 =  294740000;
n=10
x=sum(ski_X)
y=sum(ski_Y)
xy=sum(ski_X*ski_Y)
x2=sum(ski_X*ski_X)
y2=sum(ski_Y*ski_Y)
x_bar=x/n
y_bar=y/n

# calcule de la pente 
# on donne b= cov(x,y)/var(x) 
# avec cov(x,y)=(???xiyi/n)-X_br*Y_br et var(x)=(???xi²/n )- x_bar²
covXY=(xy/n)-x_bar*y_bar
varX= (x2/n)- x_bar*x_bar
b=covXY/varX
b=round(b, digits = 4)
#num=sum((ski_Y-y_bar)*(ski_X-x_bar))
#den=sum((ski_X-x_bar)*(ski_X-x_bar))
# nous constatons que la pente b =0.0319
# calculons l'intercept a
# on donne a = x_br - b * Y_bar
a=y_bar-b*x_bar
# nous constatons que l'intercept a=50.7369


# pour retrouver ces resultats on tape la commande lm(y~x)
result=lm(ski_Y~ski_X)
result$coefficients#$coefficient permet d'afficher que les coefficient.
summary(result)

# En tapant result dans la console,Nous constatont que 
#l'ordonnée à l'origine est egale à 50.7369
#et la pente est de   0.031936 < 5%, donc la pente est significative 
# donc on peut la laisser dans la regression.
# En visualisant le R-squared ajustee on constate que 0.948
#Ainsi on peut dire que 94,8% de la variance est due à la régression
# ou encore 74,6% du nombre d'accident est expliqué par le nombre de skieurs.
##
# d'ou le modele est adequate.

abline(result, col="red")

#resid = lm(ski_Y~ski_X)$residuals
#plot(resid,ylab="Nombres d'accident ",xlab="",main="Variations
#nombre d'accident en fonction du nombre de skieurs")
#abline(h=0,col="red")

###
new=data.frame(Xi=8000,Yi=270)
AX = predict(result,newdata=new,se.fit = TRUE)
AX$fit




###################################################################
#6- on veut tester l'hypothese H0: b=0 la pente n'est pas significative
# et l'hypothese h1: la pente est significative. ==> teste de significativite de
#la pente.
#pour cela on utilisera la fonction lm(Y~X), et la fonction summary
#puis un regarde la p.value  ou Pr(>|t|);
##conclusion:
#P.value=1.27e-06 <5%, donc on rejette H0
#avec un risque de 5%, la pente est signicative

#7- L'ajustement:
# s'il s'agit d'un regression lineaire simple on peut utiliser Multiple R-squared
# Et s'il s'agit de regression lineaire multiple on prefere utiliser
# Adjusted R-squared.car la regression est sensible a l'ajout de variable.

#8-aduequation du modele
#le modele ajuste bien les donnees car le coefficient de determination=95,3% d'ou
#95% des donnees est explique par le modele 

#10- Prevision du nombre d'accident pour X=8000
#pour determiner la prevision on prend l'ordonnee a l'origine ou l'intercept
#
y11= 50.93 + 0.0319*8000

# intervalle de confiance on utilise la fonction predict
newx=data.frame(ski_X=8000)
predict(result, newdata =newx, interval = "prediction", level=0.95)

##Pour x=8000 le nombre d'accident est estimer a 306.

# la prevision ponctuelle est que 