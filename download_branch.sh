#!/bin/bash

# Si no se pasa la rama como parámetro, pedirla
if [ -n "$1" ]; then
    branch="$1"
else
    read -p 'Branch: ' branch
fi

# Leer módulos desde el archivo
while IFS= read -r repo; do
    [ -z "$repo" ] && continue  # saltar líneas vacías

    echo "Clonando $repo (rama: $branch)..."
    cloned=false
    retries=3
    count=0

    while [ "$cloned" = false ] && [ $count -lt $retries ]; do
        if git clone --depth=1 --single-branch --branch="$branch" "$repo"; then
            cloned=true
        else
            count=$((count + 1))
            echo "Error al clonar $repo (intento $count/$retries). Reintentando en 3s..."
            sleep 3
        fi
    done

    if [ "$cloned" = false ]; then
        echo "Falló clonar $repo después de $retries intentos. Saltando..."
    fi
done < oca_modules_odoo12.txt

# Renombrar carpetas clonadas
for dir in */; do
    [ -d "$dir" ] || continue
    dirname=$(basename "$dir")
    mv -v "$dirname" "${branch}-${dirname}-oca"
done
