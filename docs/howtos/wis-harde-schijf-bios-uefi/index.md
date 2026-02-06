# Wis de harde schijf via de BIOS/UEFI Setup Utility

Veel moderne UEFI-firmware (vooral op laptops en desktops van fabrikanten zoals bv. HP, Dell, Lenovo en bij sommige moederbordfabrikanten) bevat een functie genaamd `Secure Erase` of een vergelijkbare term. Deze functie is specifiek ontworpen voor Solid State Drives (SSD's) en gebruikt ATA Secure Erase-commando's om alle gegevens op de SSD veilig en permanent te wissen, zodat ze onherstelbaar zijn. Dit is de meest effectieve manier om een SSD "schoon" te maken.

## Vereisten
- een computer met toegang tot de [BIOS of UEFI](../open-bios-uefi-setup-utility/index.md){:target="_blank"} (moderne computers hebben meestal UEFI)

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/u5u_fb5T-fE?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Instructies
Raadpleeg altijd de handleiding van jouw eigen hardware, want de stappen kunnen verschillen. Niet alle systemen bieden namelijk de mogelijkheid om de harde schijf direct vanuit de BIOS/UEFI te wissen.

=== "HP Z2 Tower G1i"

    - Bij de oudere Z2-modellen had je vaak de keuze voor een Secure Erase (Format NVM), wat betekent wissen in enkele seconden.
    - In de nieuwere BIOS/UEFI-versies van HP (zoals op de G1i) is deze snelle standaardmethode niet meer beschikbaar maar gewijzigd naar NIST-compliant wiping (of herkent de BIOS/UEFI de SSD niet als een schijf die het specifieke NVMe-erase commando ondersteunt). In plaats van alleen de 'sleutel' weg te gooien, gaat het systeem nu vaak de volledige schijf bit-voor-bit overschrijven met patronen (bijv. nullen of willekeurige data).
    - Daarom gaan we de erase procedure voor HP Z2 Tower G1i toestellen niet uitvoeren. We wissen eventueel aanwezige partities wel via de installer.

=== "HP Z2 PC"

    - Ga naar het tabblad `Security` en selecteer `Hard Drive Utilities`.
    - Kies `Secure Erase`.
    - Bevestig de schijf die je wilt wissen.
    - Lees de getoonde waarschuwing zorgvuldig door. Selecteer vervolgens `Secure Erase (Format NVM) Clear`.
    - Bevestig je keuze.
    - Bevestig nogmaals.
    - Zodra het wissen is voltooid, druk je op ++esc++.
    - Als er nog wijzigingen nodig zijn in de BIOS/UEFI, blijf je in de BIOS/UEFI. Ben je klaar met alle instellingen, kun je de BIOS verlaten. Meestal doe je dit door op ++esc++ te drukken en vervolgens de optie `Save and Exit` te kiezen, of door direct de `Save and Exit` optie te selecteren (vaak aangeduid met een functietoets zoals ++f10++).

!!! info 
    Als het wissen van de harde schijf is gelukt, zal het systeem proberen om via PXE op te starten, wat zal mislukken. Dit is verwacht en geen probleem.
    Als het wissen niet mogelijk was, kan het zijn dat het systeem wel of niet opstart (afhankelijk van de aan/afwezigheid van een besturingssysteem). Maak je hier geen zorgen over. Eventuele partities kunnen worden gewist, tijdens [installatie van een besturingssysteem](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md){:target="_blank"}

- Schakel de pc uit door de aan/uit-knop lang genoeg ingedrukt te houden.