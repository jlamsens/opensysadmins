# Verifieer de authenticiteit en integriteit van een Windows ISO bestand

Een gedownload Windows ISO-bestand verifiëren op authenticiteit en integriteit is cruciaal om er zeker van te zijn dat het bestand niet is gewijzigd of beschadigd. Dit doe je door de hashwaarde van het gedownloade bestand te vergelijken met de officiële hashwaarde die door Microsoft wordt verstrekt. Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

## Vereisten
- een [PC met Windows of Linux](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding
- een ([multi-versie](../download-windows11-multi-versie-iso/index.md){:target="_blank"} of [enterprise evaluation](../download-windows11-evaluation-iso/index.md){:target="_blank"}) Windows 11 ISO bestand of een [Windows Server 2025 Evaluation](../download-windows-server2025-evaluation-iso/index.md) ISO bestand.
- de SHA256-hashwaarde voor de specifieke Windows 11 ISO-versie die je hebt gedownload (Microsoft website)


## Demo
<iframe width="560" height="315" src="https://www.youtube.com/embed/_VsDvEMNRjo?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Instructies vanaf Windows

### Open PowerShell als administrator

- Klik met de rechtermuisknop op de Startknop (of druk op Windows-toets + X).
- Kies "Terminal (Admin)".

### Navigeer naar de map waar het ISO-bestand is opgeslagen
Gebruik het `cd` commando. Bijvoorbeeld, als je ISO in de map "Downloads" staat

=== "PS C:\Users\guru06>_"
    In dit voorbeeld ben ik ingelogd met gebruiker `guru06`.

    ``` title=''
    cd Downloads
    ```

=== "output"

    ``` title='' hl_lines="0"
    PS C:\Users\guru06> cd Downloads
    PS C:\Users\guru06\Downloads>
    ```

### Bereken de SHA256-hashwaarde van het ISO-bestand
Gebruik het `Get-FileHash` commando.

=== "PS C:\Users\guru06\Downloads>_"
    Vervang `Win11_24H2_English_x64.iso` door de exacte naam van je gedownloade ISO-bestand.

    ``` title=''
    Get-FileHash -Algorithm SHA256 .\Win11_24H2_English_x64.iso
    ```

=== "output"

    ``` title='' hl_lines="0"
    PS C:\Users\guru06\Downloads> Get-FileHash -Algorithm SHA256 .\Win11_24H2_English_x64.iso

    Algorithm       Hash                                                                   Path
    ---------       ----                                                                   ----
    SHA256          B56B911BF18A2CEAEB3904D87E7C770BDF92D3099599D61AC2497B91BF190B11       C:\Users\guru06\Downloads\Win...


    PS C:\Users\guru06\Downloads>
    ```    

### Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
- Ga naar de officiële Microsoft-website en zoek de SHA256-hashwaarde voor de specifieke Windows ISO-versie die je hebt gedownload.
- Vergelijk de waarde die je in stap 3 bij tabblad "output" hebt staan, teken voor teken, met de officiële waarde.

## Instructies vanaf Linux Mint
### Open de Terminal
- Je kunt dit doen via het toepassingenmenu (meestal onder "Systeemhulpprogramma's" of door te zoeken naar "Terminal").
- Of gebruik de sneltoets Ctrl + Alt + T.

### Navigeer naar de map waar het ISO-bestand is opgeslagen
Gebruik het `cd` commando. Bijvoorbeeld, als je ISO in de map "Downloads" staat
    
=== "guru@hp:~$_"

    ``` title=''
    cd Downloads 
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ cd Downloads
    guru@hp:~/Downloads$
    ```

### Bereken de SHA256-hashwaarde van het ISO-bestand
Gebruik het `sha256sum` commando.

=== "guru@hp:~/Downloads$_"
    Vervang `Win11_24H2_English_x64.iso` door de exacte naam van je gedownloade ISO-bestand.

    ``` title=''
    sha256sum Win11_24H2_English_x64.iso
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~/Downloads$ sha256sum Win11_24H2_English_x64.iso
    b56b911bf18a2ceaeb3904d87e7c770bdf92d3099599d61ac2497b91bf190b11  Win11_24H2_English_x64.iso
    guru@hp:~/Downloads$ 
    ```    

### Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
- Ga naar de officiële Microsoft-website en zoek de SHA256-hashwaarde voor de specifieke Windows ISO-versie die je hebt gedownload.
- Vergelijk de waarde die je in stap 3 bij tabblad "output" hebt staan, teken voor teken, met de officiële waarde.

## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. Download het ([multi-versie](../download-windows11-multi-versie-iso/index.md){:target="_blank"} of [enterprise evaluation](../download-windows11-evaluation-iso/index.md){:target="_blank"}) ISO bestand opnieuw en herhaal het verificatieproces.