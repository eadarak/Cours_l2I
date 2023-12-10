#----------------------------DICTIONNAIRE---------------------------------------------#
'''Les dictionnaires sont utilisés pour stocker des valeurs de données dans des paires clé:valeur.
Un dictionnaire est une collection ordonnée*, modifiable et qui n'autorise pas les doublons.
Les dictionnaires sont écrits avec des accolades et ont des clés et des valeurs : '''

#--------------CREATION ET IMPRESSION UN DICTIONNAIRE-------------------------#
Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997
}
print(Mondict)

#-------------------------Éléments du dictionnaire------------------------------#
'''Les éléments du dictionnaire sont présentés dans des paires clé:valeur et peuvent être référencés à l'aide du nom de la clé.'''

#------EXEMPLE d'impression d'un element du dictionnaire-----#
Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997
}
print(Mondict["Manga"])

#------------------------ COMMANDÉ OU NON COMMANDÉ -----------------------------#
'''Lorsque nous disons que les dictionnaires sont ordonnés, cela signifie que les éléments ont un ordre défini et que cet ordre ne changera pas.

Non ordonné signifie que les éléments n'ont pas d'ordre défini, vous ne pouvez pas faire référence à un élément en utilisant un index.'''

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CHANGEABLE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
'''Les dictionnaires sont modifiables, ce qui signifie que nous pouvons modifier, ajouter ou supprimer des éléments après la création du dictionnaire'''

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Doublons non autorisés ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
'''Les dictionnaires ne peuvent pas avoir deux éléments avec la même clé :
EXEMPLE
 Les valeurs en double écraseront les valeurs existantes :'''

Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997,
  "date_creation": 1999
}
print(Mondict)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ LONGUEUR DU DICTIONNAIRE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
'''Pour déterminer le nombre d'éléments d'un dictionnaire, utilisez la len()fonction :
Cette fonction permet de determiner le nombre de clé dans une dictionnaire'''
#syntaxe:
#print(len(nom_dictionnaire))
#------EXEMPLE d'impression de la longueur du dictionnaire-----#
Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997,
  "date_fin": "none"
}
print(len(Mondict))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ LONGUEUR DU DICTIONNAIRE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
'''Les valeurs des éléments du dictionnaire peuvent être de n'importe quel type de données :

Exemple
Types de données chaîne, entier, booléen et liste :
'''
Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997,
  "date_fin": false,
  "acteur" : ["Luffy", "Zoro" ,"Sanji" , "Nami..."]
}
print(Mondict)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TAPER() ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
'''Du point de vue de Python, les dictionnaires sont définis comme des objets ou classes avec le type de données 'dict' :'''

#<class 'dict'>
'''Exemple
Imprimer le type de données d'un dictionnaire :'''

Mondict= {
  "Manga": " One piece",
  "Categorie": "action ,Shonen",
  "date_creation": 1997,
  "date_fin": "none"
}
print(type(Mondict))


#----------------------------- ACCÉDER AUX ÉlÉMENTS D'UN DICTIONNAIRE-------------------------------------#
'''Vous pouvez accéder aux éléments d'un dictionnaire en vous référant à son nom de clé, entre crochets :'''

'''Exemple
Obtenez la valeur de la clé "filiere":'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict["filiere"]

#~~~~~~~~~~~~~~~~~~ AVEC LA FONCTION GET() ~~~~~~~~~~~~~~~~~~~~~#
'''Il existe également une méthode appelée get() qui vous donnera le même résultat :
#SYNTAXE GET():
nom_dictionnaire.get("nom_cle")

Exemple
Obtenez la valeur de la clé "syntaxe":'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.get("filiere")
print(x)

#~~~~~~~~~~~~~~~~~~ OBTENIR DES CLES avec la fonction KEYS()~~~~~~~~~~~~~~~~~~~~~#
'''La méthode  keys() renverra une liste de toutes les clés du dictionnaire.
#SYNTAXE KEYS():
nom_dictionnaire.keys()
Exemple
Obtenez une liste des clés :'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.keys()
print(x)

'''
REMARQUE: La liste des clés est une vue du dictionnaire, ce qui signifie que toute modification apportée au dictionnaire 
sera reflétée dans la liste des clés.
'''

#Exemple
'''Ajoutez un nouvel élément au dictionnaire d'origine et vérifiez que la liste des clés est également mise à jour :'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.keys()
print(x) #Avant Changement
dict["Universite"] = "Assane SECK"

print(x) #Apres Changement


#~~~~~~~~~~~~~~~~~~ OBTENIR DES VALEURS avec la fonction VALUES() ~~~~~~~~~~~~~~~~~~~~~#
'''La méthode values() renverra une liste de toutes les valeurs du dictionnaire.
#SYNTAXE VALUES():
nom_dictionnaire.values()

Exemple
Obtenez une liste des valeurs :'''

x =dict.values()

'''
REMARQUE: La liste des valeurs est une vue du dictionnaire, ce qui signifie que toute modification apportée au dictionnaire 
sera reflétée dans la liste des valeurs.
'''

#Exemple
'''Modifiez le dictionnaire d'origine et vérifiez que la liste des valeurs est également mise à jour :'''
#~~~MODICATION D"UN ELEMENT DU DICTINNAIRE INITIAL

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.values()
print(x) #Avant Changement
dict["niveau"] = 1

print(x) #Apres Changement

#Exemple
'''Ajoutez un nouvel élément au dictionnaire d'origine et vérifiez que la liste des valeurs est également mise à jour :'''
#~~~AJOUT D"UN NOUVEL ELEMENT DU DICTINNAIRE INITIAL

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.values()
print(x) #Avant Changement
dict["Universite"] = "Assane SECK"

print(x) #Apres Changement

#~~~~~~~~~~~~~~~~~~ OBTENIR DES ARTICLES avec la fonction ITEMS() ~~~~~~~~~~~~~~~~~~~~~#
'''La méthode items() renverra chaque élément d'un dictionnaire, sous forme de tuples dans une liste.
#SYNTAXE ITEMS():
nom_dictionnaire.items()

Exemple
Obtenir une liste des paires clé:valeur'''

x = dict.items()

'''
REMARQUE: La liste renvoyée est une vue des éléments du dictionnaire, ce qui signifie que toute modification apportée au
dictionnaire sera reflétée dans la liste des éléments.
'''

#Exemple
'''Modifiez le dictionnaire d'origine et vérifiez que la liste des éléments est également mise à jour :'''
#~~~MODICATION D"UN ELEMENT DU DICTINNAIRE INITIAL

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.items()
print(x) #Avant Changement
dict["niveau"] = 1

print(x) #Apres Changement

#Exemple
'''Ajoutez un nouvel élément au dictionnaire d'origine et vérifiez que la liste des éléments est également mise à jour :'''
#~~~AJOUT D"UN NOUVEL ELEMENT DU DICTINNAIRE INITIAL

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
x = dict.items()
print(x) #Avant Changement
dict["Universite"] = "Assane SECK"

print(x) #Apres Changement

#~~~~~~~~~~~~~~~~~~ VÉRIFIER SI LA CLÉ EXISTE avec IN ~~~~~~~~~~~~~~~~~~~~~#
'''Pour déterminer si une clé spécifiée est présente dans un dictionnaire, utilisez le mot-clé "in" :

Exemple
Vérifiez si "modèle" est présent dans le dictionnaire :'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
if "niveau" in thisdict:
  print("OUI, 'niveau' fait parti des clés du dictionnaire 'dict' ")


#----------------------------- CHANGER LES VALEURS -------------------------------------#
'''Vous pouvez modifier la valeur d'un élément spécifique en vous référant à son nom de clé :
Exemple
Remplacez "le niveau" par 3 :
'''

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict["niveau"]=3

#~~~~~~~~~~~~~~~~~~ METTRE A JOUR LE DICTIONNAIRE AVEC LA FONCTION UPDATE() ~~~~~~~~~~~~~~~~~~~~~#
'''
La méthode update() mettra à jour le dictionnaire avec les éléments de l'argument donné.
L'argument doit être un dictionnaire ou un objet itérable avec des paires clé:valeur.

#SYNTAXE Update():
nom_dictionnaire.update({"nom_clé":nouvelle_valeur})

#Exemple
Mettez à jour "le cycle" de la voiture en utilisant la update() méthode :
'''
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict.update({"cycle":"Master"})

#----------------------------- AJOUT D'ÉLÉMENTS -------------------------------------#
'''
L'ajout d'un élément au dictionnaire se fait en utilisant une nouvelle clé d'index et en lui attribuant une valeur :
'''
#Exemple
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict["promotion"]="Premiere"
print(dict)

#~~~~~~~~~~~~~~~~~~ AJOUT D'UN ÉLÉMENT DANS LE DICTIONNAIRE AVEC LA FONCTION UPDATE() ~~~~~~~~~~~~~~~~~~~~~#
#Mettre à jour le dictionnaire
'''La méthode update() mettra à jour le dictionnaire avec les éléments d'un argument donné. Si l'élément n'existe pas, l'élément sera ajouté.

L'argument doit être un dictionnaire ou un objet itérable avec des paires clé:valeur.'''
#Exemple
# Ajoutez un élément de couleur au dictionnaire en utilisant la update() méthode :

ddict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict.update({"Universite": "ASSANE SECK"})


#----------------------------- SUPPRESSION D'ÉLÉMENTS -------------------------------------#
#Suppression d'éléments
'''Il existe plusieurs méthodes pour supprimer des éléments d'un dictionnaire :'''

#~~~~~~~~~~~~~~~~~~ SUPPRIMER UN ÉLÉMENT DANS LE DICTIONNAIRE AVEC LA FONCTION POP() ~~~~~~~~~~~~~~~~~~~~~#
'''SYNTAXE POP():
    nom_dictionnaire.pop("nom_clé")
'''
#Exemple
'''La méthode pop() supprime l'élément avec le nom de clé spécifié :'''
#suppression de l'element 'cycle'

dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict.pop("cycle")
print(dict)

#Exemple avec la fonction POPITEM()
'''La méthode popitem() supprime le dernier élément inséré (dans les versions antérieures à 3.7, un élément aléatoire est supprimé à la place).
Sytaxe :
    nom_dictionnaire.popitem()
 '''
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict.popitem()
print(dict)

#Exemple avec le mot cle DEL
'''Le mot-clé del supprime l'élément avec le nom de clé spécifié.
 Syntaxe:
  del nom_dictionnaire["nom_clé"]
'''
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
del dict["niveau"]
print(dict)

#~~~~~~~~~~~~~~~~~~ SUPPRESSION DU DICTIONNAIRE AVEC LE MOT-CLÉ DEL ~~~~~~~~~~~~~~~~~~~~~#
#Exemple
'''Le mot-clé del peut également supprimer complètement le dictionnaire.
Syntaxe:
  del nom_dictionnaire
'''
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
del dict
print(dict) #ERREUR car ce dictionnaire n'existe plus.

#supprime les elements du dictionnaire avec la fonction clear()
'''
La méthode clear()vide le dictionnaire
syntaxe:
  nom_dictionnaire.clear()
'''
#Exemple supprimer les elements du dictionnaire 'dict'
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}
dict.clear()
print(dict)


#----------------------------BOUCLE DANS UN DICTIONNAIRE---------------------------#
'''
Vous pouvez parcourir un dictionnaire en boucle en utilisant une boucle for.

Lors d'une boucle dans un dictionnaire, la valeur de retour sont les clés du dictionnaire, mais il existe également des méthodes pour renvoyer les valeurs .
'''
#Exemple
#Imprimez tous les noms de clé dans le dictionnaire, un par un :

for x in dict: #dict est le dictionnaire sur lequel on travaillais durant les exemples précédents
  print(x)

#Exemple
#Imprimer toutes les valeurs du dictionnaire, une par une :

for x in dict:
  print(dict[x])

#Exemple avec values()
#Vous pouvez également utiliser la méthode values() pour renvoyer les valeurs d'un dictionnaire :

for x in dict.values():
  print(x)

#Exemple avec keys()
#Vous pouvez utiliser la méthode keys() pour renvoyer les clés d'un dictionnaire :

for x in dict.keys():
  print(x)

#Exemple ave items()
#Boucle à la fois sur keys et values , en utilisant la méthode items().

for x, y in dict.items():
  print(x, y)

#----------------------------COPIER UN DICTIONNAIRE----------------------------#
'''
Vous ne pouvez pas copier un dictionnaire simplement en tapant dict2 = dict1, car : dict2 ne sera qu'une référence à dict1,
 et les modifications apportées dans dict1le seront également automatiquement dans dict2.

Il existe plusieurs façons de faire une copie, l'une consiste à utiliser la méthode Dictionary intégrée copy().
'''
#Exemple, on copiera le dictionnaire avec la fonction copy()
#Faites une copie d'un dictionnaire avec la méthode copy().
dict = {
  "Departement": "Informatique",
  "Filiere": "L2I",
  "Cycle": "Licence",
  "niveau" : 2
}

classe = dict.copy()
print(classe)

#Une autre façon de faire une copie consiste à utiliser la fonction intégrée dict().
#Exemple
#Faire une copie d'un dictionnaire avec la fonction dict() :

dictio = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
classes = dict(dictio)
print(classes)

#---------------DICTIONNAIRES IMBRIQUÉS--------------------#
'''
Un dictionnaire peut contenir des dictionnaires, c'est ce qu'on appelle des dictionnaires imbriqués.
'''
#Exemple
#Créez un dictionnaire contenant cinq dictionnaires :

ufr = {
  "filiere1" : {
    "nom": "l2i"
  },
  "filiere2" : {
    "nom": "mpi"
  },
  "filiere3": {
    "nom": "geographie"
  },
  "filiere4" : {
    "nom": "pc"
  },
  "filiere5" : {
    "nom": "agroforesterie"
  }
}

#Ou, si vous souhaitez ajouter trois dictionnaires dans un nouveau dictionnaire :
#Exemple
#Créez plusieurs dictionnaires, puis créez un dictionnaire qui contiendra les trois autres dictionnaires :
filiere1= {
  "nom": "l2i"
}
filiere2= {
  "nom": "mpi"
}
filiere3= {
  "nom": "geographie"
}
filiere4= {
  "nom": "pc"
}
filiere5= {
  "nom": "agroforesterie"
}


ufr = {
  "filiere1" : filiere1,
  "filiere2" : filiere2,
  "filiere3" : filiere3,
  "filiere4" : filiere4,
  "filiere5" : filiere5,
}
