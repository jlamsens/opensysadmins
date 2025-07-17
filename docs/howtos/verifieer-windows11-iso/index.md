# Verifieer de authenticiteit en integriteit van een Windows 11 ISO bestand

Een gedownload Windows 11 ISO-bestand verifiëren op authenticiteit en integriteit is cruciaal om er zeker van te zijn dat het bestand niet is gewijzigd of beschadigd. Dit doe je door de hashwaarde van het gedownloade bestand te vergelijken met de officiële hashwaarde die door Microsoft wordt verstrekt. Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Vanaf Windows
1. Open PowerShell als administrator.
    1. Klik met de rechtermuisknop op de Startknop (of druk op Windows-toets + X).
    2. Kies "Terminal (Admin)".

2. Navigeer naar de map waar het ISO-bestand is opgeslagen.
    1. Gebruik het `cd` commando. Bijvoorbeeld, als je ISO in de map "Downloads" staat

    === "PS C:\Users\admin>_"
        Vervang `guru` door je daadwerkelijke gebruikersnaam.

        ``` title=''
        cd C:\Users\guru\Downloads
        ```

    === "output"

        ``` title='' hl_lines="0"
        PS C:\Users\admin> cd C:\Users\guru\Downloads
        PS C:\Users\guru\Downloads>
        ```

3. Bereken de SHA256-hashwaarde van het ISO-bestand
    1. Gebruik het `Get-FileHash` commando.

    === "PS C:\Users\admin>_"
        Vervang `Win11_24H2_English_x64.iso` door de exacte naam van je gedownloade ISO-bestand.

        ``` title=''
        Get-FileHash -Algorithm SHA256 .\Win11_24H2_English_x64.iso
        ```

    === "output"

        ``` title='' hl_lines="0"
        PS C:\Users\guru\Downloads> Get-FileHash -Algorithm SHA256 .\Win11_24H2_English_x64.iso

        Algorithm       Hash                                                                   Path
        ---------       ----                                                                   ----
        SHA256          C8DBC96B61D04C8B01FAF6CE0794FDF33965C7B350EAA3EB1E6697019902945C       C:\Users\guru\Downloads\Win11_24H2_...
        ```    

4. Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
    1. Ga naar de officiële Microsoft-website en zoek de SHA256-hashwaarde voor de specifieke Windows 11 ISO-versie die je hebt gedownload.
    2. Vergelijk de waarde die je in stap 3 bij tabblad "output" hebt staan, teken voor teken, met de officiële waarde.

## Vanaf Linux Mint
1. Open de Terminal
    1. Je kunt dit doen via het toepassingenmenu (meestal onder "Systeemhulpprogramma's" of door te zoeken naar "Terminal").
    2. Of gebruik de sneltoets Ctrl + Alt + T.

2. Navigeer naar de map waar het ISO-bestand is opgeslagen
    1. Gebruik het `cd` commando. Bijvoorbeeld, als je ISO in de map "Downloads" staat
    
    === "guru@hp:~$_"
        De `~` staat voor je home-directory.

        ``` title=''
        cd ~/Downloads 
        ```

    === "output"

        ``` title='' hl_lines="0"
        guru@hp:~$ cd ~/Downloads
        guru@hp:~/Downloads$
        ```

3. Bereken de SHA256-hashwaarde van het ISO-bestand
    1. Gebruik het `sha256sum` commando.

    === "guru@hp:~$_"
        Vervang `Win11_24H2_English_x64.iso` door de exacte naam van je gedownloade ISO-bestand.

        ``` title=''
        sha256sum Win11_24H2_English_x64.iso
        ```

    === "output"

        ``` title='' hl_lines="0"
        guru@hp:~/Downloads$ sha256sum Win11_24H2_English_x64.iso
        c8dbc96b61d04c8b01faf6ce0794fdf33965c7b350eaa3eb1e6697019902945c  Win11_24H2_English_x64.iso
        guru@hp:~/Downloads$ 
        ```    

4. Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
    1. Ga naar de officiële Microsoft-website en zoek de SHA256-hashwaarde voor de specifieke Windows 11 ISO-versie die je hebt gedownload.
    2. Vergelijk de waarde die je in stap 3 bij tabblad "output" hebt staan, teken voor teken, met de officiële waarde.

## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. [Download het bestand](../download-windows11-iso/index.md) opnieuw en herhaal het verificatieproces.