#!/bin/bash
set -e

# 1. Controleer of de virtual environment actief is, zo niet: activeer hem
if [ -z "$VIRTUAL_ENV" ]; then
  if [ -f ".venv/bin/activate" ]; then
    echo ">>> Virtual environment activeren..."
    source .venv/bin/activate
  else
    echo ">>> Fout: Geen actieve .venv gevonden in deze map!"
    exit 1
  fi
fi

# 2. Stage alle bestanden om wijzigingen te detecteren
git add .

# 3. Controleer of er effectief iets gewijzigd is in de broncode
if [ -n "$(git status --porcelain)" ]; then
  echo ">>> Wijzigingen gevonden! Start build process..."
  
  # Bouw de site met een schone cache
  zensical build --clean
  
  echo ">>> Broncode committen en pushen naar main..."
  git commit -m "Update site $(date +'%Y-%m-%d %H:%M')"
  git push origin main
  
  echo ">>> Website deployen naar GitHub Pages..."
  ghp-import -p -f site
  
  echo ">>> Deploy succesvol afgerond!"
else
  echo ">>> Geen wijzigingen gevonden in de broncode. Niets om te bouwen of te pushen."
fi
