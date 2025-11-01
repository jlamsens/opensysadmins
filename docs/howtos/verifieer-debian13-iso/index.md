# Verifieer de authenticiteit en integriteit van een Debian 13 ISO-bestand

Een [gedownload Debian ISO-bestand](../download-debian13-iso/index.md){:target="_blank"} kan je best verifiëren op [authenticiteit en integriteit](../../explanations/authenticiteit-integriteit/index.md){:target="_blank"}. Deze stappen maken gebruik van cryptografische sleutels en hashes om zeker te zijn dat het bestand van de juiste bron komt (authenticiteit, via de digitale handtekening) en onderweg niet gewijzigd is (integriteit, via de hash-waarde). Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

## Vereisten
- een [PC met Windows of Linux](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding
- het [Debian ISO-bestand](../download-debian13-iso/index.md){:target="_blank"}
- de Debian verificatiebestanden; op [dezelfde downloadpagina](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/){:target="_blank"} waar je het ISO-bestand vindt, zoek je naar links om `SHA256SUMS` en `SHA256SUMS.sign` te downloaden. Zorg ervoor dat je deze bestanden via "Opslaan als..." opslaat en niet alleen de inhoud kopieert. Bewaar alle drie de bestanden (ISO, SHA256SUMS.txt en SHA256SUMS.sign) in dezelfde map, bv. `Downloads`
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

### Zoek publieke sleutel
De sleutels die Debian gebruikt om de ISO-checksums (SHA5512SUMS) te ondertekenen, kunnen in de loop der tijd veranderen. Je vindt de meest actuele sleutels altijd op de [officiële Debian website](https://www.debian.org/CD/verify){:target="_blank"} voor verificatie. 

Het gpg commando moet eerst de handtekening lezen om te weten welke sleutel het moet zoeken.

=== "Windows"

    ``` title='' hl_lines="3 6 8"
    PS C:\Users\guru06\Downloads> gpg --list-packets .\SHA256SUMS.sign
    # off=0 ctb=89 tag=2 hlen=3 plen=563
    :signature packet: algo 1, keyid DA87E80D6294BE9B
            version 4, created 1757195668, md5len 0, sigclass 0x00
            digest algo 8, begin of digest 9a 6e
            hashed subpkt 33 len 21 (issuer fpr v4 DF9B9C49EAA9298432589D76DA87E80D6294BE9B)
            hashed subpkt 2 len 4 (sig created 2025-09-06)
            subpkt 16 len 8 (issuer key ID DA87E80D6294BE9B)
            data: [4096 bits]
    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="3 6 8"
    guru@hp:~/Downloads$ gpg --list-packets SHA256SUMS.sign 
    # off=0 ctb=89 tag=2 hlen=3 plen=563
    :signature packet: algo 1, keyid DA87E80D6294BE9B
        version 4, created 1757195668, md5len 0, sigclass 0x00
        digest algo 8, begin of digest 9a 6e
        hashed subpkt 33 len 21 (issuer fpr v4 DF9B9C49EAA9298432589D76DA87E80D6294BE9B)
        hashed subpkt 2 len 4 (sig created 2025-09-06)
        subpkt 16 len 8 (issuer key ID DA87E80D6294BE9B)
        data: [4096 bits]
    guru@hp:~/Downloads$ 
    ```



### Importeer publieke sleutel
Je downloadt de Debian publieke sleutel (geïdentificeerd door de lange reeks tekens, de key ID) van de Debian sleutelserver (keyserver). Deze sleutel met de naam "Debian CD signing key" wordt in jouw lokale GPG-sleutelring opgeslagen.

=== "Windows"

    ``` title='' hl_lines="0"
    PS C:\Users\guru06\Downloads> gpg --keyserver hkps://keyring.debian.org:443 --recv-keys DA87E80D6294BE9B
    gpg: key DA87E80D6294BE9B: public key "Debian CD signing key <debian-cd@lists.debian.org>" imported
    gpg: Total number processed: 1
    gpg:               imported: 1
    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="6"
    guru@hp:~/Downloads$ gpg --keyserver hkps://keyring.debian.org:443 --recv-keys DA87E80D6294BE9B
    gpg: key DA87E80D6294BE9B: public key "Debian CD signing key <debian-cd@lists.debian.org>" imported
    gpg: Total number processed: 1
    gpg:               imported: 1
    guru@hp:~/Downloads$ 
    ```

### De digitale handtekening verifiëren
GPG vergelijkt de digitale handtekening in SHA256SUM.sign met de inhoud van SHA256SUM.txt met behulp van de geïmporteerde publieke sleutel. "Good signature..." betekent dat de handtekening geldig is en van de verwachte bron komt. De WARNING over de sleutel die niet is gecertificeerd, betekent dat je (of jouw Web of Trust) de sleutel niet expliciet hebt gemarkeerd als volledig vertrouwd, maar de handtekening zelf is technisch gezien wel correct en geldig.

=== "Windows"

    ``` title='' hl_lines="4 5"
    PS C:\Users\guru06\Downloads> gpg --verify .\SHA256SUMS.sign .\SHA256SUMS.txt
    gpg: Signature made 09/06/25 23:54:28 Romance Daylight Time
    gpg:                using RSA key DF9B9C49EAA9298432589D76DA87E80D6294BE9B
    gpg: Good signature from "Debian CD signing key <debian-cd@lists.debian.org>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: DF9B 9C49 EAA9 2984 3258  9D76 DA87 E80D 6294 BE9B
    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"
    

    ``` title='' hl_lines="4 5"
    guru@hp:~/Downloads$ gpg --verify SHA256SUMS.sign SHA256SUMS.txt
    gpg: Signature made Sat 06 Sep 2025 11:54:28 PM CEST
    gpg:                using RSA key DF9B9C49EAA9298432589D76DA87E80D6294BE9B
    gpg: Good signature from "Debian CD signing key <debian-cd@lists.debian.org>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: DF9B 9C49 EAA9 2984 3258  9D76 DA87 E80D 6294 BE9B
    ```    

## Integriteit controleren

### Bereken de SHA256-hashwaarde van het ISO-bestand
Dit commando berekent een unieke code van het gedownloade ISO-bestand, wat de uiteindelijke integriteitscheck is. Vervang `debian-13.1.0-amd64-netinst.iso` door de exacte naam van je gedownloade ISO-bestand.

=== "Windows"
    
    ``` title='' hl_lines="5"
    PS C:\Users\guru06\Downloads> Get-FileHash -Algorithm SHA256 .\debian-13.1.0-amd64-netinst.iso

    Algorithm       Hash                                                                   Path
    ---------       ----                                                                   ----
    SHA256          658B28E209B578FE788EC5867DEEBAE57B6AAC5FCE3692BBB116BAB9C65568B3       C:\Users\guru06\Downloads\debian-13.1.0-amd64-netinst.iso


    PS C:\Users\guru06\Downloads>
    ```

=== "Linux"

    ``` title='' hl_lines="2"
    guru@hp:~/Downloads$ sha256sum debian-13.1.0-amd64-netinst.iso 
    658b28e209b578fe788ec5867deebae57b6aac5fce3692bbb116bab9c65568b3  debian-13.1.0-amd64-netinst.iso
    guru@hp:~/Downloads$ 
    ```

### Vergelijk de berekende hashwaarde met de officiële waarde van Debian
- Open bestand `SHA256SUM.txt` met een tekstverwerker.
- Vergelijk deze berekende hash (658B28E209B578FE788EC5867DEEBAE57B6AAC5FCE3692BBB116BAB9C65568B3) met de hash-waarde die in het geverifieerde bestand `SHA256SUM.txt` staat. Als ze exact overeenkomen, is het ISO-bestand 100% zeker zowel authentiek als ongewijzigd.


## Conclusie
Als de hashwaarden exact overeenkomen, is het ISO-bestand authentiek en integer. Je kunt erop vertrouwen dat het niet is gewijzigd of beschadigd.

Als de hashwaarden niet overeenkomen, is het ISO-bestand waarschijnlijk beschadigd tijdens het downloaden, of, in zeldzame gevallen, gemanipuleerd. [Download het bestand](../download-debian13-iso/index.md) opnieuw en herhaal het verificatieproces.