# Verifieer de authenticiteit en integriteit van een Windows 11 ISO-bestand

Een [gedownload Windows 11 ISO-bestand](../download-windows11-multi-versie-iso/index.md){:target="_blank"} kan je best verifiëren op [authenticiteit en integriteit](../../explanations/authenticiteit-integriteit/index.md){:target="_blank"}. Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

## Vereisten
- een [PC met Windows of Linux](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding
- het [Windows 11 ISO-bestand](../download-windows11-multi-versie-iso/index.md){:target="_blank"}

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

=== "Windows"

    Bij Microsoft wordt de authenticiteit van de Windows 11 ISO (ondanks het ontbreken van een GPG-handtekening) gewaarborgd door het vertrouwen in de distributieketen en de beveiliging van de website waar de hash-code wordt gepubliceerd. We importeren hier geen sleutel.

=== "Linux"
    Gebruik het `gpg` commando. Je downloadt de Linux Mint publieke sleutel (geïdentificeerd door de lange reeks tekens, de key ID) van een betrouwbare sleutelserver (keyserver). Deze sleutel met de naam "Linux Mint ISO Signing Key" wordt in jouw lokale GPG-sleutelring opgeslagen.

    ``` title='' hl_lines="6"
    guru@hp:~/Downloads$ gpg --keyserver hkps://keyserver.ubuntu.com:443 --recv-key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
    gpg: directory '/home/guru/.gnupg' created
    gpg: keybox '/home/guru/.gnupg/pubring.kbx' created
    gpg: key 300F846BA25BAE09: 1 duplicate signature removed
    gpg: /home/guru/.gnupg/trustdb.gpg: trustdb created
    gpg: key 300F846BA25BAE09: public key "Linux Mint ISO Signing Key <root@linuxmint.com>" imported
    gpg: Total number processed: 1
    gpg:               imported: 1
    guru@hp:~/Downloads$
    ```


### De digitale handtekening verifiëren

=== "Windows"
    Dit is op Windows niet van toepassing voor een Windows 11 ISO bestand.

=== "Linux"
    GPG vergelijkt de digitale handtekening in sha256sum.txt.gpg met de inhoud van sha256sum.txt met behulp van de geïmporteerde publieke sleutel. "Good signature..." betekent dat de handtekening geldig is en van de verwachte bron komt. De WARNING over de sleutel die niet is gecertificeerd, betekent dat je (of jouw Web of Trust) de sleutel niet expliciet hebt gemarkeerd als volledig vertrouwd, maar de handtekening zelf is technisch gezien wel correct en geldig.

    ``` title='' hl_lines="4 5"
    guru@hp:~/Downloads$ gpg --verify sha256sum.txt.gpg sha256sum.txt
    gpg: Signature made Tue 14 Jan 2025 12:35:18 PM CET
    gpg:                using RSA key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
    gpg: Good signature from "Linux Mint ISO Signing Key <root@linuxmint.com>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: 27DE B156 44C6 B3CF 3BD7  D291 300F 846B A25B AE09
    guru@hp:~/Downloads$ 
    ```    

## Integriteit controleren

### Bereken de SHA256-hashwaarde van het ISO-bestand
Dit commando berekent een unieke code van het gedownloade ISO-bestand, wat de uiteindelijke integriteitscheck is. Vervang `linuxmint-22.1-cinnamon-64bit.iso` door de exacte naam van je gedownloade ISO-bestand.

=== "Windows"
    
    ``` title='' hl_lines="5"
    PS C:\Users\guru06\Downloads> Get-FileHash -Algorithm SHA256 .\Win11_24H2_Multiversion.iso

    Algorithm       Hash                                                                   Path
    ---------       ----                                                                   ----
    SHA256          B56B911BF18A2CEAEB3904D87E7C770BDF92D3099599D61AC2497B91BF190B11       C:\Users\guru06\Downloads\Win...


    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="2"
    guru@hp:~/Downloads$ sha256sum Win11_24H2_Multiversion.iso 
    b56b911bf18a2ceaeb3904d87e7c770bdf92d3099599d61ac2497b91bf190b11  Win11_24H2_Multiversion.iso
    guru@hp:~/Downloads$ 
    ```

### Vergelijk de berekende hashwaarde met de officiële waarde van Microsoft
- Vergelijk deze berekende hash (CCF482436DF954C0AD6D41123A49FDE79352CA71F7A684A97D5E0A0C39D7F39F) met de hash-waarde die op de Microsoft website gepubliceerd staat. Als ze exact overeenkomen, is het ISO-bestand 100% zeker zowel authentiek als ongewijzigd.


## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. [Download het bestand](../download-windows11-multi-versie-iso/index.md) opnieuw en herhaal het verificatieproces.