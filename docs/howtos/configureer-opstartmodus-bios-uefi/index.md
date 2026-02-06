# Configureer de opstartmodus in BIOS/UEFI

In de BIOS/UEFI-instellingen kun je de Boot Mode beheren, waarbij je doorgaans kiest tussen de moderne UEFI-standaard of de oudere Legacy (CSM) modus. Het is echter belangrijk om te weten dat steeds meer moderne systemen geen Legacy-modus (CSM) meer ondersteunen. In dat geval ben je gebonden aan UEFI, wat overigens de nodige voordelen biedt: ondersteuning voor schijven groter dan 2 TB, snellere opstarttijden en Secure Boot (beveiligingsfunctie of een manier om de controle over hardware te beperken?) De Legacy-modus is enkel nog aanwezig op specifieke systemen om compatibiliteit met verouderde hardware of besturingssystemen te garanderen.

## Vereisten
- een computer met toegang tot de [BIOS of UEFI](../open-bios-uefi-setup-utility/index.md){:target="_blank"} (moderne computers hebben meestal UEFI)

## Demo
Raadpleeg altijd de handleiding van jouw eigen hardware, want de stappen kunnen verschillen. Deze video toont de UEFI van een HP Z2 PC.

<iframe width="854" height="480" src="https://www.youtube.com/embed/ABi_3ibxxAI?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Instructies

=== "HP Z2 Tower G4i PC"

    - Navigeer naar `Security` en selecteer vervolgens `Secure Boot Configuration`.
    - Verwijder het vinkje bij `Secure Boot`.
    - Als er nog wijzigingen nodig zijn in de BIOS/UEFI, blijf je in de BIOS/UEFI. Ben je klaar met alle instellingen, kun je de BIOS verlaten. Meestal doe je dit door op ++esc++ te drukken en vervolgens de optie `Save and Exit` te kiezen, of door direct de `Save and Exit` optie te selecteren (vaak aangeduid met een functietoets zoals ++f10++).

=== "HP Z2 PC"

    - Navigeer naar `Advanced` en selecteer vervolgens `Secure Boot Configuration`.
    - Zorg ervoor dat de opties `Legacy Support Disable` en `Secure Boot Disable` zijn geselecteerd.
    - Als er nog wijzigingen nodig zijn in de BIOS/UEFI, blijf je in de BIOS/UEFI. Ben je klaar met alle instellingen, kun je de BIOS verlaten. Meestal doe je dit door op ++esc++ te drukken en vervolgens de optie `Save and Exit` te kiezen, of door direct de `Save and Exit` optie te selecteren (vaak aangeduid met een functietoets zoals ++f10++).