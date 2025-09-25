# Configureer de opstartmodus in BIOS/UEFI

Binnen de BIOS/UEFI utility kun je belangrijke opstartinstellingen beheren, waaronder de `Boot Mode`, waarbij je kunt schakelen tussen UEFI (Unified Extensible Firmware Interface) voor modernere systemen met ondersteuning voor grotere schijven, snellere opstarttijden, `Secure Boot` en Legacy (CSM) modus voor compatibiliteit met oudere besturingssystemen of hardware. 

## Vereisten
- een computer met toegang tot de [BIOS of UEFI](../open-bios-uefi-setup-utility/index.md){:target="_blank"} (moderne computers hebben meestal UEFI)

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Instructies
Deze instructies zijn gebaseerd op een `HP Z2 pc`. Raadpleeg altijd de handleiding van jouw eigen hardware, want de stappen kunnen verschillen.

- Navigeer naar `Advanced` en selecteer vervolgens `Secure Boot Configuration`.
- Zorg ervoor dat de opties `Legacy Support Disable` en `Secure Boot Disable` zijn geselecteerd.
- Als er nog wijzigingen nodig zijn in de BIOS/UEFI, blijf je in de BIOS/UEFI. Ben je klaar met alle instellingen, kun je de BIOS verlaten. Meestal doe je dit door op ++esc++ te drukken en vervolgens de optie `Save and Exit` te kiezen, of door direct de `Save and Exit` optie te selecteren (vaak aangeduid met een functietoets zoals ++f10++).