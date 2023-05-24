#!/bin/bash

# Vérification du nombre de paramètres
if [ $# -ne 2 ]; then
    echo "Usage: ./add.sh <nombre1> <nombre2>"
    exit 1
fi

# Extraction des nombres des paramètres
nombre1=$1
nombre2=$2

# Vérification si les paramètres sont des nombres
if ! [[ $nombre1 =~ ^[0-9]+$ ]] || ! [[ $nombre2 =~ ^[0-9]+$ ]]; then
    echo "Erreur : Les paramètres doivent être des nombres entiers."
    exit 1
fi

# Calcul de l'addition
resultat=$((nombre1 + nombre2))

# Affichage du résultat
echo "Le résultat de l'addition de $nombre1 et $nombre2 est : $resultat"
