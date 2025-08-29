# Setup VirtualBox 7 op Linux Mint 22 (Oracle repository)

VirtualBox stelt je in staat om andere besturingssystemen (zoals Windows of een andere Linux-distributie) te draaien als virtuele machines binnen je bestaande Linux Mint 22-omgeving. Dit gebeurt in een geïsoleerde en veilige virtuele omgeving, waardoor je software kunt testen of applicaties kunt gebruiken die niet native op Linux Mint draaien, zonder je hoofdinstallatie te beïnvloeden.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding

<iframe width="560" height="315" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Je kan kiezen tussen VirtualBox 7.0 (laatste stabiele maintenance release) of VirtualBox 7.1 (actief onderhouden).

## VirtualBox 7.0.X

### Voeg Oracle GPG-sleutel toe

=== "guru@hp:~$_"

    ``` title=''
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
    OK
    guru@hp:~$ 
    ```

### Voeg de Oracle repository toe

=== "guru@hp:~$_"

    ``` title=''
    echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian noble contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian noble contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian noble contrib
    guru@hp:~$ 
    ```

### Update pakketlijst
Vernieuw de lokale pakketlijst om je systeem op de hoogte te brengen van de nieuwste beschikbare pakketten en updates in de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

### Verifieer versie in repository
Bekijk welke versies van het pakket virtualbox beschikbaar zijn en uit welke software repository elke versie afkomstig is.

=== "guru@hp:~$_"

    ``` title=''
    apt-cache policy virtualbox-7.0
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ apt-cache policy virtualbox-7.0
    virtualbox-7.0:
      Installed: (none)
      Candidate: 7.0.26-168464~Ubuntu~noble
      Version table:
         7.0.26-168464~Ubuntu~noble 500
            500 https://download.virtualbox.org/virtualbox/debian noble/contrib amd64 Packages
    guru@hp:~$ 
    ```

### Installeer VirtualBox
Installeer VirtualBox uit de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt install virtualbox-7.0 -y
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

## VirtualBox 7.1.X

### Download en converteer de Oracle GPG-sleutel naar een keyring-bestand

=== "guru@hp:~$_"

    ``` title=''
    wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
    ```

=== "output"

    ``` title='' hl_lines="0"
    
    ```

### Voeg Oracle repository toe met sleutelverwijzing

=== "guru@hp:~$_"

    ``` title=''
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    ```

### Update pakketlijst
Vernieuw de lokale pakketlijst om je systeem op de hoogte te brengen van de nieuwste beschikbare pakketten en updates in de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

### Verifieer versie in repository
Bekijk welke versies van het pakket virtualbox beschikbaar zijn en uit welke software repository elke versie afkomstig is.

=== "guru@hp:~$_"

    ``` title=''
    apt-cache policy virtualbox-7.1
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

### Installeer VirtualBox
Installeer VirtualBox uit de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt install virtualbox-7.1 -y
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

## Setup Extension Pack (optioneel)
### Installeer
Het installeren van het [Extension Pack](../../explanations/todo/index.md) is nodig om extra functionaliteit zoals USB 2.0/3.0-ondersteuning, RDP-server, disk-encryptie en PXE boot toe te voegen aan VirtualBox.

=== "guru@hp:~$_"

    ``` title=''
    VERSION=$(VBoxManage --version | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+).*/\1/')

    # Bepaal correcte bestandsnaam afhankelijk van major.minor versie
    BASE=$(echo "$VERSION" | cut -d. -f1-2)
    if [ "$BASE" = "7.0" ]; then
        FILENAME="Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack"
    else
        FILENAME="Oracle_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack"
    fi

    URL="https://download.virtualbox.org/virtualbox/${VERSION}/${FILENAME}"

    # Download, installeer en verwijder
    wget -q "$URL" -O "/tmp/${FILENAME}" && \
    sudo VBoxManage extpack install --replace "/tmp/${FILENAME}" && \
    rm "/tmp/${FILENAME}"
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```
### Verifieer
=== "guru@hp:~$_"

    ``` title=''
    VBoxManage list extpacks
    ```

=== "output VirtualBox 7.0"

    ``` title='' hl_lines="0"
    guru@hp:~$ VBoxManage list extpacks

    ```

=== "output VirtualBox 7.1"

    ``` title='' hl_lines="0"
    guru@hp:~$ VBoxManage list extpacks
    Extension Packs: 1
    Pack no. 0:   Oracle VirtualBox Extension Pack
    Version:        7.1.12
    Revision:       169651
    Edition:        
    Description:    Oracle Cloud Infrastructure integration, Host Webcam, VirtualBox RDP, PXE ROM, Disk Encryption, NVMe, full VM encryption.
    VRDE Module:    VBoxVRDP
    Crypto Module:  VBoxPuelCrypto
    Usable:         true
    Why unusable:   
    guru@hp:~$ 
    ```

## Maak de Guest Additions ISO beschikbaar (optioneel)
Het voorzien van de [Guest Additions](../../explanations/todo/index.md) in een virtuele machine zorgt voor betere integratie tussen host en gast, zoals naadloze muisaanwijzer, gedeelde klemborden, schermresolutie-aanpassing en gedeelde mappen.

=== "guru@hp:~$_"

    ``` title=''
    VERSION=$(VBoxManage --version | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
    ISO_URL="https://download.virtualbox.org/virtualbox/$VERSION/VBoxGuestAdditions_${VERSION}.iso"
    ISO_TMP="/tmp/VBoxGuestAdditions_${VERSION}.iso"
    ISO_DEST="/usr/share/virtualbox/VBoxGuestAdditions.iso"

    wget -q -O "$ISO_TMP" "$ISO_URL" && \
    sudo mkdir -p /usr/share/virtualbox && \
    if [ -f "$ISO_DEST" ]; then
      sudo mv "$ISO_DEST" "${ISO_DEST}.bak.$(date +%s)"
    fi && \
    sudo install -m 644 "$ISO_TMP" "$ISO_DEST" && \
    echo "VBoxGuestAdditions $VERSION geïnstalleerd in $ISO_DEST"
    ```

=== "output"

    ``` title='' hl_lines="0"

    ```

## Voeg gebruiker toe aan vboxusers groep
Voeg je ingelogde gebruiker toe aan de groep `vboxusers`, zodat die toegang krijgt tot VirtualBox USB-apparaten en bepaalde virtuele hardwarefunctionaliteiten.

=== "guru@hp:~$_"

    ``` title=''
    sudo usermod -aG vboxusers guru
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo usermod -aG vboxusers guru
    guru@hp:~$ 
    ```

## Reboot en start VirtualBox
