#!/bin/bash

# Vérification du nombre de paramètres
if [ $# -ne 3 ]; then
    echo "Usage: ./my_calculator.sh <nombre1> <opération> <nombre2>"
    exit 1
fi

# Extraction des paramètres
nombre1=$1
operation=$2
nombre2=$3

# Vérification de l'opération et calcul
case $operation in
    +)
        resultat=$(($nombre1 + $nombre2))
        ;;
    -)
        resultat=$(($nombre1 - $nombre2))
        ;;
    /)
        if [ $nombre2 -eq 0 ]; then
            echo "Erreur : Division par zéro."
            exit 1
        fi
        resultat=$(($nombre1 / $nombre2))
        ;;
    *)
        echo "Opération invalide. Veuillez utiliser '+', '-' ou '/' comme opération."
        exit 1
        ;;
esac

# Affichage du résultat
echo "Le résultat de l'opération $nombre1 $operation $nombre2 est : $resultat"
