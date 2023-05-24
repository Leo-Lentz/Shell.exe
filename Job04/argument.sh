#!/bin/bash

# Vérification du nombre de paramètres
if [ $# -ne 2 ]; then
    echo "Usage: ./argument.sh <fichier_destination> <fichier_source>"
    exit 1
fi

# Extraction des noms de fichiers des paramètres
fichier_destination=$1
fichier_source=$2

# Vérification si le fichier source existe
if [ ! -f $fichier_source ]; then
    echo "Le fichier source '$fichier_source' n'existe pas."
    exit 1
fi

# Création du fichier de destination et copie du contenu du fichier source
cat $fichier_source > $fichier_destination

# Affichage du message de réussite
echo "Le fichier '$fichier_destination' a été créé et rempli avec le contenu du fichier '$fichier_source'."
