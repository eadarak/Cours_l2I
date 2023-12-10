#------------------------------- LES LISTES EN PYTHON ------------------------------------#
'''Régler
Les ensembles sont utilisés pour stocker plusieurs éléments dans une seule variable.

Set est l'un des 4 types de données intégrés à Python utilisés pour stocker des collections de données, les 3 autres sont List , Tuple et Dictionary , tous avec des qualités et une utilisation différentes.

Un ensemble est une collection non ordonnée , non modifiable* et non indexée .

* Remarque : les éléments de l' ensemble ne sont pas modifiables, mais vous pouvez supprimer des éléments et en ajouter de nouveaux.

Les ensembles sont écrits avec des accolades.

* Remarque : les ensembles ne sont pas ordonnés, vous ne pouvez donc pas être sûr de l'ordre dans lequel les éléments apparaîtront.

** Définir les éléments
Les éléments d'ensemble ne sont pas ordonnés, ne peuvent pas être modifiés et n'autorisent pas les valeurs en double.

** Non ordonné
Non ordonné signifie que les éléments d'un ensemble n'ont pas d'ordre défini.

Les éléments d'ensemble peuvent apparaître dans un ordre différent chaque fois que vous les utilisez et ne peuvent pas être référencés par un index ou une clé.

** Non modifiable
Les éléments de l'ensemble sont immuables, ce qui signifie que nous ne pouvons pas modifier les éléments une fois l'ensemble créé.

Une fois qu'un ensemble est créé, vous ne pouvez pas modifier ses éléments, mais vous pouvez supprimer des éléments et en ajouter de nouveaux.


'''


########### Créer un ensemble #######################
'''
Pour créer un ensemble, on écrit ses éléments entre accolades {} et séparés par des virgules
'''
ensemble = {"cahier", "stylo", "regle","ardoise"}
print('Mon ensemble est : ' ,ensemble)
##CREATION AVEC LE CONSTRUCTEUR SET()
'''
Du point de vue de Python, les ensembles sont définis comme des objets avec le type de données 'set' :
'''
<class 'set'>
#Exemple
ensemble = {"cahier", "stylo", "regle","ardoise"}
print(type(ensemble))

#Le constructeur set()
'''
Il est également possible d'utiliser le constructeur set() pour créer un ensemble.
SYNTAXE :
      Nom_ensemble=set((Element de l'ensemble))
**NB: on note l'apparition des doubles parentheses
'''
#Exemple
#Utilisation du constructeur set() pour créer un ensemble :

Mon_ensemble = set(("cahier", "stylo", "regle","ardoise"))
print(Mon ensemble)


######### Doublons non autorisés #############
'''
Les ensembles ne peuvent pas avoir deux éléments avec la même valeur.
'''
#Exemple
#Les valeurs en double seront ignorées :

ensemble = {"cahier", "stylo", "regle","ardoise","stylo"}
print('Mon ensemble est : \n' ,ensemble) # l'element stylo en double est ignoré

### Ensemble de types
'''
Les éléments d'ensemble peuvent être de n'importe quel type de données (chaîne, int et booléen).
'''
#Exemple
#Types de données

E1 = {"apple", "banana", "cherry"}
E2 = {1, 5, 7, 9, 3}
E3 = {True, False, False}

'''
*** Remarque :
Un ensemble peut contenir différents types de données :
'''

#Exemple
#Un ensemble avec des chaînes, des entiers et des valeurs booléennes :
E = {"abc", 34, True, 40, "male"}

################## Accéder aux éléments #############################
'''
Il n’est pas possible d’accéder aux éléments d’un ensemble avec l’opérateur [] ou en vous référant à un index ou à une clé. 
En revanche, nous verrons avec les structures de contrôle qu’il est possible de parcourir un ensemble.
'''
#-------------------- OPERATIONS SUR LES ENSEMBLES -------------#
######## Obtenir la longueur d'un ensemble ###############
'''
pour connaître le nombre d’éléments d’un ensemble, il faut utiliser la fonction len() (qui est la contraction de length).
Syntaxe :
       len(nom_ensemble)
'''
#Exemple
#Obtenir le nombre d'éléments dans un ensemble :

ensemble = {"cahier", "stylo", "regle","ardoise"}
print(len(ensemble))
# affiche 4
################### Savoir si un élément est présent dans un ensemble ############
''''
Pour savoir si un élément est présent dans un ensemble, on peut utiliser le mot-clé in 
'''
#EXEMPLE
mon_ensemble = {1, 2, 3}
2 in mon_ensemble
# affiche True
12 in mon_ensemble
#affiche False
12 not in mon_ensemble
#Affiche True

#########Comparer deux ensembles ##############
'''
On peut utiliser tous les opérateurs de comparaison entre deux ensembles.
'''
#EXEMPLE
mon_ensemble = {1, 2, 3}
#comparaison d'egalite
mon_ensemble == {1, 2, 3}
#affiche True

#comparaison de difference
mon_ensemble != {}
#affiche True

#Comparaison d'inegalité
mon_ensemble < {1, 2, 3, 4}
#Affiche True

mon_ensemble > {2}
#Affiche True
'''
*Remarque :
   Pour que deux ensembles soient égaux, il faut qu’ils contiennent les mêmes éléments.
'''

### Connaître le plus grand élément d’un ensemble ####
'''
Pour connaître le plus grand élément d’un ensemble, il faut utiliser la fonction max() 
'''

mon_ensemble = {10, 20, 30, 40}
element = max(mon_ensemble)
print(element)
# affiche 40

'''
* Remarque :
Cela suppose néanmoins que tous les éléments d’un ensemble sont comparables et donc de type similaire sinon on obtient une erreur de type TypeError.
'''

mon_ensemble = {10, "coconut"}
element = max(mon_ensemble)
'''
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'str' and 'int'
'''

### Connaître le plus petit élément d’un ensemble ###
'''
Pour connaître le plus petit élément d’un ensemble, il faut utiliser la fonction min().
Comme pour la méthode max(), cela suppose que tous les éléments d’un ensemble sont comparables et donc de type similaire.
'''
mon_ensemble = {"a", "b", "c"}
element = min(mon_ensemble)
print(element)

# affiche a

############# Quelques méthodes pour les ensembles ################################

#-----------Copie un ensemble pour créer un nouvel ensemble---------------#
mon_ensemble = {10, 20, 30}
nouvel_ensemble = mon_ensemble.copy()

#-----------Ajoute un élément à un ensemble---------------#
mon_ensemble = {10, 20, 30}
mon_ensemble.add(40)
print(mon_ensemble)
# affiche {10, 20, 30, 40}

#-----------Supprime un élément à un ensemble---------------#
mon_ensemble = {10, 20, 30}
mon_ensemble.remove(20)
print(mon_ensemble)
# affiche {10, 30}

#------------Supprime tous les éléments d’un ensemble--------------#
mon_ensemble = {10, 20, 30}
mon_ensemble.clear()
print(mon_ensemble)
# affiche {}

#--------------UNION DE DEUX ENSEMBLE-------------#
'''
Avec le fonction union():
Crée un ensemble représentant l’union entre deux ou plusieurs ensembles .
'''
#Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1.union(e2)
print(e3)
# affiche {1, 2, 3}
'''
L’union peut également se représenter avec l’opérateur |.
'''
#Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1 | e2
print(e3)
# affiche {1, 2, 3}

#--------------INTRSECTION DE DEUX ENSEMBLE-------------#
'''
Avec le fonction intersection():
Crée un ensemble représentant l’intersection entre deux ou plusieurs ensembles .
'''
#Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1.intersection(e2)
print(e3)
# affiche {2}
'''
*Remarque:
L’intersection peut également se représenter avec l’opérateur & :
'''
# Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1 & e2
print(e3)
# affiche {2}

#--------------DIFFENCE DE DEUX ENSEMBLE-------------#
'''
Avec le fonction diffence():
Crée un ensemble représentant la différence entre deux ou plusieurs ensembles :
'''
#exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1.difference(e2)
print(e3)
# affiche {1}
'''
*Remarque:
La différence peut également se représenter avec l’opérateur - :'''
# Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1 - e2
print(e3)
# affiche {1}

#--------------DIFFENCE  SYMETRIQUE DE DEUX ENSEMBLE-------------#
'''
Avec le fonction symmetric_difference():
Crée un ensemble contenant les éléments présents dans un des ensembles mais pas dans les deux :
'''
#Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1.symmetric_difference(e2)
print(e3)
# affiche {1, 3}

'''
*Remarque:
La différence symétrique peut également se représenter avec l’opérateur ^ :
'''
# Exemple
e1 = {1, 2}
e2 = {2, 3}
e3 = e1 ^ e2
print(e3)
# affiche {1, 3}
