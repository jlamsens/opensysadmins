# Configureer Linux Mint 22 basisinstellingen

Na de installatie van Linux Mint 22 configureer je de basisinstellingen door direct de Updatebeheerder te openen om alle beschikbare systeemupdates en beveiligingspatches te installeren, wat cruciaal is voor een stabiel en veilig systeem. Vervolgens kun je via de Welkomstscherm sneltoetsen vinden voor populaire aanpassingen zoals het selecteren van een systeemmomentopnamepunt met Timeshift, het installeren van stuurprogramma's voor hardware, en het aanpassen van de bureaubladomgeving (zoals thema's en pictogrammen) naar je persoonlijke voorkeur.

## Vereisten
- een werkend [Linux Mint 22 systeem](../installeer-linuxmint22/index.md){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/KGbG3uHShwk?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Casper
Mogelijks krijg je nog een rode systemd fout bij `shutdown` omdat `casper` iets probeert te doen wat alleen in een live omgeving bestaat. Dit lossen we eenvoudig op door het pakket te de-installeren.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt purge casper -y
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

## Grub
Verwijder de standaard opstartopties "quiet splash", waardoor tijdens het opstarten van Linux alle systeemmeldingen zichtbaar worden in plaats van een stil logo.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT=""/g' /etc/default/grub
    ```

=== "output"

    ``` title='' hl_lines="0"
 
    ```

Verkort de wachttijd van het GRUB-keuzemenu tot 2 seconden.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=2/g' /etc/default/grub
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

Pas de configuratie toe, zodat deze wijzigingen effectief worden bij de volgende opstart.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo update-grub
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```