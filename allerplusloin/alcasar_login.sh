#!/bin/bash

# Vérification des arguments
if [ $# -ne 2 ]; then
    echo "Usage: ./alcasar_login.sh email password"
    exit 1
fi

# URL de connexion d'Alcasar
login_url="Https://alcasar.laplateforme.io/intercept.php"

# Données de connexion
email="$1"
password="$2"

# Effectuer la requête POST pour se connecter à Alcasar
response=$(curl -s -X POST -d "login=$email&password=$password&submit=Login" "$login_url")

# Vérifier la réponse pour déterminer si la connexion a réussi
if [[ $response =~ "successful" ]]; then
    echo "Connexion réussie à Alcasar."
else
    echo "Échec de la connexion à Alcasar."
fi
