# Verifieer de authenticiteit en integriteit van een Windows 11 ISO-bestand

Een gedownload Windows 11 [multi-versie](../download-windows11-multi-versie-iso/index.md){:target="_blank"} of [Enterprise Evaluation](../download-windows11-evaluation-iso/index.md){:target="_blank"} ISO-bestand kan je best verifiëren op [authenticiteit en integriteit](../../explanations/authenticiteit-integriteit/index.md){:target="_blank"}. Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

## Vereisten
- een [PC met Windows of Linux](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding
- het Windows 11 [multi-versie](../download-windows11-multi-versie-iso/index.md){:target="_blank"} of [Enterprise Evaluation](../download-windows11-evaluation-iso/index.md){:target="_blank"} ISO-bestand

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/_VsDvEMNRjo?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Open Terminal

=== "Windows"
    Op Windows maken we gebruik van Powershell en niet van de traditionele opdrachtprompt.

    - Ga naar de Windows Verkenner en klik links op de `Downloads` map.
    - Hou ++shift++ ingedrukt en rechtermuisklik op een leeg vlak
    - Selecteer `Open in Terminal`


=== "Linux"
    Op Linux maken we gebruik van de shell.

    - Ga naar de Nemo file manager en klik links op de `Downloads` map.
    - Rechtermuisklik op een leeg vlak
    - Selecteer `Open in Terminal`

## Authenticiteit controleren

### Importeer publieke sleutel
Bij Microsoft wordt de authenticiteit van de Windows 11 ISO (ondanks het ontbreken van een GPG-handtekening) gewaarborgd door het vertrouwen in de distributieketen en de beveiliging van de website waar de hash-code wordt gepubliceerd. We importeren hier geen sleutel.


### De digitale handtekening verifiëren
Dit is niet van toepassing voor een Windows 11 ISO bestand.


## Integriteit controleren

### Bereken de SHA256-hashwaarde van het ISO-bestand
Dit commando berekent een unieke code van het gedownloade ISO-bestand, wat de uiteindelijke integriteitscheck is. Vervang `Win11_Multiversion.iso` door de exacte naam van je gedownloade ISO-bestand.

=== "Windows"
    
    ``` title='' hl_lines="5"
    PS C:\Users\guru\Downloads> Get-FileHash -Algorithm SHA256 .\Win11_Multiversion.iso

    Algorithm       Hash                                                                   Path
    ---------       ----                                                                   ----
    SHA256          B56B911BF18A2CEAEB3904D87E7C770BDF92D3099599D61AC2497B91BF190B11       C:\Users\guru\Downloads\Win...


    PS C:\Users\guru\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="2"
    guru@lab:~/Downloads$ sha256sum Win11_Multiversion.iso 
    b56b911bf18a2ceaeb3904d87e7c770bdf92d3099599d61ac2497b91bf190b11  Win11_Multiversion.iso
    guru@lab:~/Downloads$ 
    ```

### Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
Vergelijk deze berekende hash (B56B911BF18A2CEAEB3904D87E7C770BDF92D3099599D61AC2497B91BF190B11) met de hash-waarde die op de Microsoft website gepubliceerd staat. Als ze exact overeenkomen, is het ISO-bestand 100% zeker zowel authentiek als ongewijzigd.


## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. [Download het bestand](../download-windows11-multi-versie-iso/index.md) opnieuw en herhaal het verificatieproces.