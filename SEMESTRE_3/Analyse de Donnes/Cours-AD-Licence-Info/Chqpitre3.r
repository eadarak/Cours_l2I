basePIB = read.csv2("C:/Users/El Abdou DRAME/Desktop/L2I-2021_officiel/DEUXIEME ANNEE/Analyse de Donnes/Cours-AD-Licence-Info/Donnees/basePIB.csv")
DATA = basePIB[-1]# permet de supprimer la premiere colonne
library(lattice) # charger la bibliotheque lattice
splom(DATA) #affiche l'ensemble des nuages de points.
attach(DATA)
#Au vue de ce diagramme de dispersion, nous pouvons dire que la
#relation entre la variable PIB et toutes les autres variables est linÃ©aire.
# Calculer la matrice de correlation avec la fonction cor(nom_basedonnee)
TX = cor(DATA)
cor.test(DATA)
# on tape sur la console TX[1, ]

##########################################################
#Objectif: 
reg = lm(PIBt~FBCt+DNBt + DCFMt + DCFAPt + AVAt + RIBt)
summary(reg) # summary donne l'ensemble des information de la sortie
#### Interpretation des resultats
# l'erreur faite sur l'estimation est le std.error qui doit etre faible 
#pour avoir une bonne qualite de l'estimation
# t-value est la valeur de la statique
# Pr(> |t|) est la p-value de la test 
# On reagarde la Pr(> |t|) de l'intercepte pour verifier l'hypothese H0
# beta_i= 0 non significatif au seuil de 5% (test de significativite individuelle)
# Apres verification on constate que Pr(> |t|) est superieur a
# 5% on accepte H0 d'ou le modele est individuellement significatif

### test de significativite globale  pour cela on utilise le test de 
### Fischer ie F-statistic  on regarde le p-value qui est egale a
### 2.2eâˆ’16 < 5% donc on rejete H0 et on accepte l'hypothese alternative
### le modÃ¨le est globalement significatif


## Pourcentage de variance expliquee
# pour cela on regarde "Multiple R-squared" 
# Ainsi nous constatons que Multiple R-squared = 0.9982 
#  On peut dire que 99.82% de variance du PBI par la variance de 6 facteurs.

## variance expliquee avec la qualite de l'ajustement
# pour cela on regarde "Adjusted R-squared" 
# Ainsi nous constatons que Adjusted R-squared = 0.9979 
#  On peut dire que 99.79% de variance du PBI par la variance de 6 facteurs.

##############################################################
resid= reg$residuals # recuperer les valeurs resuduels
y = density(resid)
hist(resid,probability = T,col=5,xlab = "PIB",ylab ="fréquences",main="Histogramme")
lines(y,col=2)
qqnorm(resid)
qqline(resid,col=2)
#cette diagramme compare de la distribution des residus en fonction
# de la distribution normale
# Ce diagrame montre que les quantides des residues est tres proches des 
# quantides normales
# Graphiquement on peut voir que les residues sont distribues suivant une 
#loi normale

## test de normalite
## on veut tester H0: les residus sont distribues suivant une loi normale 
## contre H1 avec la fonction shapiro.test
shapiro.test(resid)
## p ??? value = 0.3927 > 5%, donc on accepte H0. D'où avec un risque
#de 5%, les résidus sont distribués suivant une loi normale.

##VErifier l'hypothese 2: Homocédasticité des erreurs
mean(resid)

#### hypothse de la variance constante 
# tracer le graphique
# recuperartion des valeurs predites
pred = reg$fitted.values
plot(pred,resid) # nuage de point entre pred et resid
abline(h=0,col=4)
#Cela permet de verifier l'hypothese de linearite et d'homocedasticite
## l'hypothese de linearite est verifie.

###hypothese 3:  Absence d'autocorrélation des résidus


