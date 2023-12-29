#!/bin/bash

# Chemin de base de votre projet Terraform
BASE_DIR="projet-terraform"

# Fichier README final
README="$BASE_DIR/README.md"

# Entête du README
echo "# Documentation du Projet Terraform" > $README
echo "Ce document contient la documentation pour tous les modules du projet." >> $README

# Documentation globale (par exemple, les providers utilisés dans tous les modules)
echo "## Providers" >> $README
# Ici, ajoutez la logique pour extraire et lister les providers une seule fois
# ...

# Boucle sur chaque module pour générer la documentation spécifique
for module in module1 module2 module3; do
    echo "## Module: $module" >> $README
    # Utilisez les options de terraform-docs pour exclure les sections redondantes
    terraform-docs markdown table --hide providers,inputs,outputs "$BASE_DIR/$module" >> $README
    echo "" >> $README
done

