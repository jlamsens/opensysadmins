#!/bin/bash
set -e

# 1. Schoon de cache op en bouw de nieuwste versie
zensical build --clean

# 2. Check of er broncode-wijzigingen zijn
git add .
if ! git diff-index --quiet HEAD --; then
  echo "Wijzigingen gevonden, broncode committen en pushen..."
  git commit -m "Update site $(date +'%Y-%m-%d %H:%M')"
  git push origin main
else
  echo "Geen wijzigingen in de broncode. Push overgeslagen."
fi

# 3. Deploy de 'site/' map altijd naar GitHub Pages
ghp-import -p -f site
