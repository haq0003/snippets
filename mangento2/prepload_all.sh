#!/bin/bash

# URL du sitemap
SITEMAP_URL="https://www.XXXXXXX.com/wp-sitemap-posts-property-1.xml"

# Récupération des URLs dans un tableau
mapfile -t URLS < <(curl -s "$SITEMAP_URL" | grep -oP '(?<=<loc>).*?(?=</loc>)')

TOTAL=${#URLS[@]}  # Nombre total d'URLs

# Paramètres de la barre de progression
BAR_SIZE=50

# On stocke l'heure de début (en secondes) pour calculer la vitesse
START_TIME=$(date +%s)

# Fonction d'affichage de la barre de progression
progress_bar() {
  local current="$1"
  local total="$2"
  local bar_size="$3"

  # Calcule la proportion d'avancement en pourcentage
  local percent=$(( 100 * current / total ))
  # Nombre de caractères "remplis" dans la barre
  local filled=$(( bar_size * current / total ))

  # Construit la barre : (remplie) + (vide)
  local bar
  bar="$(printf '%*s' "$filled" | tr ' ' '#')"
  bar+=$(printf '%*s' $(( bar_size - filled )) | tr ' ' '-')

  # Calcul du temps écoulé (en secondes)
  local now=$(date +%s)
  local elapsed=$(( now - START_TIME ))
  if (( elapsed > 0 )); then
    # URLs traitées / minute
    # On fait : (current * 60) / elapsed
    # Pour avoir un résultat flottant, on utilise bc
    local speed
    speed=$(echo "scale=2; $current * 60 / $elapsed" | bc -l)
    # On affiche la barre + le pourcentage + la vitesse
    echo -ne "Progress: [${bar}] ${percent}% (${current}/${total}) - ${speed} URLs/min\r"
  else
    # Si elapsed == 0 (très rapide), on évite la division par zéro
    echo -ne "Progress: [${bar}] ${percent}% (${current}/${total}) - 0.00 URLs/min\r"
  fi

  # Quand on a fini, on passe à la ligne
  if (( current == total )); then
    echo
  fi
}

CURRENT=0

for url in "${URLS[@]}"; do
  # Vérifie la charge moyenne (load)
  load=$(uptime | awk '{print $10}' | cut -d',' -f1)

  # Si la charge < 5
  if (( $(echo "$load < 5" | bc -l) )); then
    # On précharge l'URL
    taskset -c 0 curl -s -I -o /dev/null "$url"
    sleep 0.3 # TTFB
  else
    # Charge trop élevée, on attend
    echo -e "\nLoad too high ($load), pausing 10s..."
    sleep 10
  fi

  # On incrémente et on affiche la barre avec vitesse
  (( CURRENT++ ))
  progress_bar "$CURRENT" "$TOTAL" "$BAR_SIZE"
done

echo "Warm cache terminé !"
