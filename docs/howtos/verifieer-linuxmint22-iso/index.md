# Verifieer de authenticiteit en integriteit van een Linux Mint ISO-bestand

Een gedownload Linux Mint 22 ISO-bestand verifiëren op authenticiteit en integriteit is cruciaal om er zeker van te zijn dat het bestand niet is gewijzigd of beschadigd. Dit doe je door de hashwaarde van het gedownloade bestand te vergelijken met de officiële hashwaarde die door Linux Mint wordt verstrekt. Hieronder vind je een stappenplan voor zowel Windows als Linux Mint.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Vereisen
- Het [Linux Mint 22 ISO-bestand](../download-linuxmint22-iso/index.md)
- Download de verificatiebestanden; op dezelfde downloadpagina waar je het ISO-bestand vindt, zoek je naar links om `sha256sum.txt` en `sha256sum.txt.gpg` te downloaden. Zorg ervoor dat je deze bestanden via "Opslaan als..." opslaat en niet alleen de inhoud kopieert. Bewaar alle drie de bestanden (ISO, .txt, en .gpg) in dezelfde map, bv. `Downloads`
- Op Windows 11 heb je extra software nodig om de GPG (GNU Privacy Guard) handtekening te verifiëren. Download en installeer [Gpg4win](https://www.gpg4win.org/download.html){:target="_blank"}. Kies de "Kleopatra" optie tijdens de installatie, dit maakt het verifiëren makkelijker.

## Vanaf Windows

### Integriteitscontrole
1. Open PowerShell
    1. Klik met de rechtermuisknop op de Startknop (of druk op Windows-toets + X).
    2. Kies "Terminal"

2. Navigeer naar de map waar het ISO-bestand is opgeslagen.
    1. Gebruik het `cd` commando. Bijvoorbeeld, als je ISO in de map "Downloads" staat

    === "PS C:\Users\guru>_"
        Vervang `guru` door je daadwerkelijke gebruikersnaam.

        ``` title=''
        cd C:\Users\guru\Downloads
        ```

    === "output"

        ``` title='' hl_lines="0"
        PS C:\Users\guru> cd C:\Users\guru\Downloads
        PS C:\Users\guru\Downloads>
        ```

3. Bereken de SHA256-hashwaarde van het ISO-bestand
    1. Gebruik het `Get-FileHash` commando.

    === "PS C:\Users\guru>_"
        Vervang `linuxmint-22-cinnamon-64bit.iso` door de exacte naam van je gedownloade ISO-bestand.

        ``` title=''
        Get-FileHash -Algorithm SHA256 .\linuxmint-22-cinnamon-64bit.iso | Select-Object -ExpandProperty Hash
        ```

    === "output"

        ``` title='' hl_lines="0"
        PS C:\Users\guru\Downloads> Get-FileHash -Algorithm SHA256 .\linuxmint-22-cinnamon-64bit.iso | Select-Object -ExpandProperty Hash
        CCF482436DF954C0AD6D41123A49FDE79352CA71F7A684A97D5E0A0C39D7F39F
        PS C:\Users\guru\Downloads>
        ```

4. Vergelijk de berekende hashwaarde met de officiële waarde van Linux Mint
    1. Open het sha256sum.txt bestand met Kladblok. Zoek de SHA256-hash die overeenkomt met jouw ISO-bestandsnaam.
    2. Vergelijk de waarde die je in stap 3 bij tabblad "output" hebt staan, teken voor teken, met de officiële waarde.

### Authenticiteitscontrole (GPG Handtekening)

1. Importeer de Linux Mint publieke sleutel
    1. Start `Kleopatra` (onderdeel van Gpg4win)
    2. Klik op `Import`
    3. De officiële Linux Mint signing key is `27DEB15644C6B3CF3BD7D291300F846BA25BAE09`. Zoek op deze ID (of de volledige vingerafdruk: `27DE B156 44C6 B3CF 3BD7 D291 300F 846B A25B AE09`) op een betrouwbare sleutelserver (bijv. keyserver.ubuntu.com). Klik met de rechtermuisknop op de gevonden sleutel en kies "Import". Bevestig de import.
    4. Belangrijk: Markeer deze sleutel als "vertrouwd" (Certify in Kleopatra) nadat je hebt geverifieerd dat het de juiste sleutel is (bijv. door de vingerafdruk te vergelijken met de officiële Linux Mint documentatie).

2. Verifieer de sha256sum.txt.gpg handtekening
    1. In Kleopatra, klik op Decrypt/Verify.
    2. Navigeer naar de map waar je sha256sum.txt en sha256sum.txt.gpg hebt opgeslagen. Selecteer sha256sum.txt.gpg.
    3. Kleopatra zal nu de handtekening van sha256sum.txt verifiëren met de geïmporteerde publieke sleutel.
    4. Output: Je zou een bericht moeten zien dat de handtekening "Good Signature" is en dat deze afkomstig is van "Linux Mint" (met de sleutel ID die je hebt geïmporteerd).

## Vanaf Linux Mint
Linux Mint heeft ingebouwde tools om dit proces te vereenvoudigen.

### Integriteits- en Authenticiteitscontrole (Geautomatiseerd)
1. Ingebouwde verificatie: Open de bestandsbeheerder (Nemo).
2. Navigeer naar de map waar je het ISO-bestand hebt gedownload.
3. Rechtsklik op het ISO-bestand zelf.
4. Kies in het contextmenu de optie "Verifieer" of "Verify integrity and authenticity".
5. Linux Mint zal nu automatisch de SHA256-hash berekenen, de GPG-handtekening verifiëren en de resultaten presenteren. Het kan even duren.
6. Output: Een pop-up venster zal verschijnen met de resultaten. Je zou berichten moeten zien zoals "Integrity check: OK" en "Authenticity check: Good signature from 'Linux Mint'".

### Integriteitscontrole (Handmatig via Terminal)
1. Open de Terminal
    1. Je kunt dit doen via het toepassingenmenu (meestal onder `Systeemhulpprogramma's` of door te zoeken naar `Terminal`).
    2. Of gebruik de sneltoets Ctrl + Alt + T.

2. Navigeer naar de map waar het ISO-bestand is opgeslagen
    1. Gebruik het `cd` commando. Bijvoorbeeld, als alle drie de bestanden (ISO, .txt, en .gpg) in de map "Downloads" staan
    
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

    === "guru@hp:~/Downloads$_"
        Vervang `linuxmint-22-cinnamon-64bit.iso` door de exacte naam van je gedownloade ISO-bestand.

        ``` title=''
        sha256sum linuxmint-22-cinnamon-64bit.iso
        ```

    === "output"

        ``` title='' hl_lines="0"
        guru@hp:~/Downloads$ sha256sum linuxmint-22-cinnamon-64bit.iso
        ccf482436df954c0ad6d41123a49fde79352ca71f7a684a97d5e0a0c39d7f39f  linuxmint-22-cinnamon-64bit.iso
        guru@hp:~/Downloads$ 
        ```    

4. Vergelijk de berekende hashwaarde met de officiële waarde
    1. Open het sha256sum.txt bestand met een teksteditor (bijv. Xed)
    2. Vergelijk de output van sha256sum met de hashwaarde in het .txt bestand die overeenkomt met je ISO. Ze moeten exact overeenkomen.

### Authenticiteitscontrole (Handmatig via Terminal)

1. Importeer de Linux Mint publieke sleutel
    1. Gebruik het `gpg` commando.
    
    === "guru@hp:~/Downloads$"
        Deze opdracht haalt de sleutel op van een sleutelserver. De sleutel-ID "27DEB15644C6B3CF3BD7D291300F846BA25BAE09" is de officiële Linux Mint signing key.

        ``` title=''
        gpg --keyserver hkps://keys.openpgp.org --recv-key "27DEB15644C6B3CF3BD7D291300F846BA25BAE09"
        ```

    === "output"

        ``` title='' hl_lines="0"
        guru@hp:~/Downloads$ gpg --keyserver hkps://keys.openpgp.org --recv-key "27DEB15644C6B3CF3BD7D291300F846BA25BAE09"
        gpg: key 300F846BA25BAE09: public key "Linux Mint ISO Signing Key <root@linuxmint.com>" imported
        gpg: Total number processed: 1
        gpg:               imported: 1
        ```

2. Verifieer de `sha256sum.txt.gpg` handtekening
    1. Gebruik het `gpg` commando.

    === "guru@hp:~/Downloads$"
        
        ``` title=''
        gpg --verify sha256sum.txt.gpg sha256sum.txt
        ```

    === "output"
        De term "Good signature" is cruciaal. [unknown] kan voorkomen als je de sleutel nog niet als "vertrouwd" hebt gemarkeerd, maar de "Good signature" bevestigt de authenticiteit.
        
        ``` title='' hl_lines="0"
        guru@hp:~/Downloads$ gpg --keyserver hkps://keys.openpgp.org --recv-key "27DEB15644C6B3CF3BD7D291300F846BA25BAE09"
        gpg: Signature made di 14 jan 2025 12:35:18 CET
        gpg:                using RSA key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
        gpg: Good signature from "Linux Mint ISO Signing Key <root@linuxmint.com>" [unknown]
        gpg: WARNING: This key is not certified with a trusted signature!
        gpg:          There is no indication that the signature belongs to the owner.
        Primary key fingerprint: 27DE B156 44C6 B3CF 3BD7  D291 300F 846B A25B AE09
        ```

## Conclusie
Door deze uitgebreide stappen te volgen, weet je zeker dat jouw Linux Mint 22 ISO-bestand zowel intact als afkomstig van de officiële bron is, wat cruciaal is voor een veilige en succesvolle installatie.
