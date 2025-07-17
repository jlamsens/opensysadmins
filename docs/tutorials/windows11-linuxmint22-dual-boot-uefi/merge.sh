#!/bin/bash

# Bepaal de naam van het uitvoerbestand
OUTPUT_FILE="index.md"

# Wis de inhoud van het uitvoerbestand als het al bestaat
> "$OUTPUT_FILE"

# Vlag om bij te houden of de initiële YAML-header al is verwerkt
header_processed=false

# Haal een natuurlijk gesorteerde lijst op van alle Markdown-bestanden die beginnen met twee cijfers.
# Dit zorgt ervoor dat bestanden in numerieke volgorde worden verwerkt (01, 02, ..., 10)
# en verwerkt robuust potentiële spaties of speciale tekens in bestandsnamen.
files=()
while IFS= read -r -d $'\0' file; do
  files+=("$file")
done < <(find . -maxdepth 1 -name '[0-9][0-9]-*.md' -print0 | sort -zV)

# Haal het totale aantal gevonden bestanden op
num_files=${#files[@]}
# Initialiseer een teller voor het huidige bestand dat wordt verwerkt (1-gebaseerd)
current_file_index=0

# Loop door elk bestand in de gesorteerde lijst
for file in "${files[@]}"; do
  # Verhoog de bestandsteller
  current_file_index=$((current_file_index + 1))

  # Voeg een blanco regel toe vóór de nieuwe inhoud als het niet het allereerste bestand is.
  # Dit zorgt voor de juiste afstand tussen de '---' en de inhoud van het volgende bestand.
  if [ "$current_file_index" -gt 1 ]; then
    echo "" >> "$OUTPUT_FILE"
  fi

  # Verwerk de bestandsinhoud
  if [ "$header_processed" = false ]; then
    # Voor het eerste bestand, kopieer de volledige inhoud zoals die is.
    # Dit omvat de YAML-header en de bijbehorende blanco regel.
    cat "$file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    header_processed=true
  else
    # Voor de volgende bestanden, verwijder hun YAML-header.
    # Dit AWK-commando zal alles overslaan vanaf het begin tot en met
    # de blanco regel direct na de tweede '---'.
    awk '
      BEGIN {
        # past_header status:
        # 0: Nog steeds binnen de YAML-header (vóór de tweede ''---'').
        # 1: Net de tweede ''---'' tegengekomen, verwacht een blanco regel erna.
        # 2: Voorbij de blanco regel na de tweede ''---'', klaar om inhoud af te drukken.
        past_header = 0;
        dash_count = 0; # Telt ''---''-regels
      }
      /---/ {
        dash_count++;
        if (dash_count == 2) {
          past_header = 1; # Tweede ''---'' gevonden.
        }
        next; # Sla altijd regels die ''---'' bevatten zelf over.
      }
      # Als we net de tweede ''---'' zijn gepasseerd (past_header is 1) EN de huidige regel is blanco,
      # dan is dit de blanco regel die moet worden overgeslagen.
      NF == 0 && past_header == 1 {
          past_header = 2; # Overgang naar status waarin we inhoud beginnen af te drukken.
          next; # Sla deze blanco regel over.
      }
      {
        # Druk alleen regels af als we voorbij het volledige headerblok zijn (inclusief de blanco regel).
        if (past_header == 2) {
          print;
        } else if (past_header == 1 && NF > 0) {
          # Dit behandelt gevallen waarin er mogelijk geen blanco regel direct na de header is,
          # of als de eerste inhoudsregel niet blanco is. Druk deze af en maak de overgang.
          print;
          past_header = 2;
        }
      }
    ' "$file" >> "$OUTPUT_FILE"
  fi

  # Voeg een horizontale lijn (---) toe na de inhoud van elk bestand,
  # maar NIET na het allerlaatste bestand.
  if [ "$current_file_index" -lt "$num_files" ]; then
    echo "" >> "$OUTPUT_FILE" # Zorg voor een blanco regel vóór de '---'
    echo "---" >> "$OUTPUT_FILE"
  fi
done

echo "Bestanden succesvol samengevoegd in $OUTPUT_FILE"