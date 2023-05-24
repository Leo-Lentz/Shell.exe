#!/bin/bash

# Chemin du fichier CSV contenant les informations des utilisateurs
csv_file="/home/heren/Shell_Userlist.csv"

# Fonction pour créer un utilisateur
create_user() {
    username=$1
    password=$2
    role=$3

    # Création de l'utilisateur
    useradd "$username" -m -p "$password"

    # Attribution du rôle de super utilisateur si l'utilisateur est un admin
    if [ "$role" = "admin" ]; then
        usermod -aG sudo "$username"
    fi

    echo "Utilisateur $username créé avec succès."
}

# Lecture du fichier CSV et création des utilisateurs
while IFS=',' read -r username password role
do
    # Vérification si les champs sont vides
    if [ -n "$username" ] && [ -n "$password" ] && [ -n "$role" ]; then
        # Appel de la fonction pour créer l'utilisateur
        create_user "$username" "$password" "$role"
    fi
done < "$csv_file"
