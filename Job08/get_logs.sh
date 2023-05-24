#!/bin/bash

# Extraction du nombre de connexions à la session
num_connections=$(last | grep "$(whoami)" | wc -l)

# Création du nom de fichier avec la date actuelle
filename="number_connection-$(date +"%d-%m-%Y-%H:%M")"

# Écriture du nombre de connexions dans le fichier
echo "$num_connections" > "$filename"

# Création du dossier Backup s'il n'existe pas déjà
mkdir -p Backup

# Archivage du fichier avec tar
tar -czvf "Backup/$filename.tar.gz" "$filename"

# Suppression du fichier original
rm "$filename"
