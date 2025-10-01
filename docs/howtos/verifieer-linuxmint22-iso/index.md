# Verifieer de authenticiteit en integriteit van een Linux Mint ISO-bestand

Een [gedownload Linux Mint 22 ISO-bestand](../download-linuxmint22-iso/index.md){:target="_blank"} kan je best verifiëren op [authenticiteit en integriteit](../../explanations/authenticiteit-integriteit/index.md){:target="_blank"}. Deze stappen maken gebruik van cryptografische sleutels en hashes om zeker te zijn dat het bestand van de juiste bron komt (authenticiteit, via de digitale handtekening) en onderweg niet gewijzigd is (integriteit, via de hash-waarde). Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

## Vereisten
- een [PC met Windows of Linux](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding
- het [Linux Mint 22 ISO-bestand](../download-linuxmint22-iso/index.md){:target="_blank"}
- de Linux Mint verificatiebestanden; op dezelfde downloadpagina waar je het ISO-bestand vindt, zoek je naar links om `sha256sum.txt` en `sha256sum.txt.gpg` te downloaden. Zorg ervoor dat je deze bestanden via "Opslaan als..." opslaat en niet alleen de inhoud kopieert. Bewaar alle drie de bestanden (ISO, .txt, en .gpg) in dezelfde map, bv. `Downloads`
- indien op Windows: [GNU Privacy Guard voor Windows](../setup-gnupg-windows11/index.md){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/iVh_-AbC2GY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

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
Gebruik het `gpg` commando. Je downloadt de Linux Mint publieke sleutel (geïdentificeerd door de lange reeks tekens, de key ID) van een betrouwbare sleutelserver (keyserver). Deze sleutel met de naam "Linux Mint ISO Signing Key" wordt in jouw lokale GPG-sleutelring opgeslagen.

=== "Windows"

    ``` title='' hl_lines="3"
    PS C:\Users\guru06\Downloads> gpg --keyserver hkps://keyserver.ubuntu.com:443 --recv-key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
    gpg: C:\\Users\\guru06\\AppData\\Roaming\\gnupg\\trustdb.gpg: trustdb created
    gpg: key 300F846BA25BAE09: public key "Linux Mint ISO Signing Key <root@linuxmint.com>" imported
    gpg: Total number processed: 1
    gpg:               imported: 1
    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

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
GPG vergelijkt de digitale handtekening in sha256sum.txt.gpg met de inhoud van sha256sum.txt met behulp van de geïmporteerde publieke sleutel. "Good signature..." betekent dat de handtekening geldig is en van de verwachte bron komt. De WARNING over de sleutel die niet is gecertificeerd, betekent dat je (of jouw Web of Trust) de sleutel niet expliciet hebt gemarkeerd als volledig vertrouwd, maar de handtekening zelf is technisch gezien wel correct en geldig.

=== "Windows"

    ``` title='' hl_lines="4 5"
    PS C:\Users\guru06\Downloads> gpg --verify sha256sum.txt.gpg sha256sum.txt
    gpg: Signature made 01/14/25 12:35:18 Romance Standard Time
    gpg:                using RSA key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
    gpg: Good signature from "Linux Mint ISO Signing Key <root@linuxmint.com>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: 27DE B156 44C6 B3CF 3BD7  D291 300F 846B A25B AE09
    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"
    

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
    PS C:\Users\guru06\Downloads> Get-FileHash -Algorithm SHA256 .\linuxmint-22.1-cinnamon-64bit.iso

    Algorithm       Hash                                                                   Path
    ---------       ----                                                                   ----
    SHA256          CCF482436DF954C0AD6D41123A49FDE79352CA71F7A684A97D5E0A0C39D7F39F       C:\Users\guru06\Downloads\lin...


    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="2"
    guru@hp:~/Downloads$ sha256sum linuxmint-22.1-cinnamon-64bit.iso
    ccf482436df954c0ad6d41123a49fde79352ca71f7a684a97d5e0a0c39d7f39f  linuxmint-22.1-cinnamon-64bit.iso
    guru@hp:~/Downloads$ 
    ```

### Vergelijk de berekende hashwaarde met de officiële waarde van Linux Mint
- Open bestand `sha256sum.txt` met een tekstverwerker.
- Vergelijk deze berekende hash (CCF482436DF954C0AD6D41123A49FDE79352CA71F7A684A97D5E0A0C39D7F39F) met de hash-waarde die in het geverifieerde bestand sha256sum.txt staat. Als ze exact overeenkomen, is het ISO-bestand 100% zeker zowel authentiek als ongewijzigd.


## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. [Download het bestand](../download-linuxmint22-iso/index.md) opnieuw en herhaal het verificatieproces.