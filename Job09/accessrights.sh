#!/bin/bash

# Chemin du fichier CSV contenant les informations des utilisateurs
csv_file="/home/heren/Shell_Userlist.csv"

# Fonction pour créer un utilisateur
create_user() {
    local id=$1
    local prenom=$2
    local nom=$3
    local password=$4
    local role=$5
    # Création de l'utilisateur
    useradd -m "$nom.$prenom" -p "$password" -u "$id"

    # Attribution du rôle de super utilisateur si l'utilisateur est un admin
    if [[ "$role" == "Admin" ]]; then
        usermod -aG sudo "$nom.$prenom"
    fi

    echo "Utilisateur $nom.$prenom créé avec succès."
}

# Lecture du fichier CSV et création des utilisateurs
while IFS=',' read -r id prenom nom password role
do
    # Vérification si les champs sont vides
    if [[ -n "$id" && -n "$prenom" && -n "$nom" && -n "$password" && -n "$role" ]]; then
        # Appel de la fonction pour créer l'utilisateur
        create_user "$id" "$prenom" "$nom" "$password" "$role"
    fi
done < "$csv_file"

