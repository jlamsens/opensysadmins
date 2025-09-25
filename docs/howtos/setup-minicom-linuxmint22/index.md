# Setup minicom op Linux Mint 22

Minicom is een populair terminalprogramma voor Unix-achtige besturingssystemen dat wordt gebruikt om te communiceren met seriële apparaten, zoals modems, routers en embedded systemen.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Setup
<img src="console-access.png"/>

## Update pakketlijst
Vernieuw de lokale pakketlijst om je systeem op de hoogte te brengen van de nieuwste beschikbare pakketten en updates in de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"
    ...
    ```

## Installeer minicom
=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install minicom -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    ...
    ```

## Identificeer de seriële poort
In dit voorbeeld is een Cisco switch met een seriële kabel verbonden met een Linux Mint PC. Voer op die PC de volgende opdracht uit om de beschikbare seriële poorten weer te geven. Noteer de naam van de seriële poort (bv. `/dev/ttyUSB0`) die bij je apparaat hoort.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    dmesg | grep tty
    ```

=== "output"

    ``` title='' hl_lines="3"
    guru@hp:~$ dmesg | grep tty
    [    0.206150] printk: console [tty0] enabled
    [18977.539042] usb 1-4: pl2303 converter now attached to ttyUSB0
    guru@hp:~$ 
    ```

## Configureer minicom

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo minicom -s
    ```

=== "output"
    Gebruik in het configuratiemenu van Minicom de pijltjestoetsen om te navigeren en de instellingen te configureren.

    - Selecteer "Serial port setup"
    - Stel het seriële apparaat in op het apparaat dat je eerder hebt genoteerd (bv. "/dev/ttyUSB0")
    - Stel de baudrate in volgens de specificaties van je apparaat (bijv. "9600")
    - Laat de overige instellingen op de standaardwaarden staan, tenzij je specifieke vereisten hebt.
    - Klik op "Save setup as dfl" om de configuratie op te slaan.
    - Klik op "Exit from Minicom".

    Deze instellingen worden opgeslagen in het bestand `/etc/minicom/minirc.dfl` voor alle toekomstige uitvoeringen.

## Start minicom

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo minicom
    ```

=== "output"

    Druk op ++enter++ om de switch/router-prompt te openen. Om Minicom af te sluiten, druk je op de sneltoets ++ctrl++ ++a++ gevolgd door de letter ++x++.

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 14:06:27

    Press CTRL-A Z for help on special keys


    <press ENTER>

    Switch>
    ```

## Alternatieve werkwijze
In plaats van eerst de configuratie uit te voeren, kan je ineens de juiste parameters opgeven via de opdrachtregel.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo minicom -b 9600 -D /dev/ttyUSB0
    ```

=== "output"

    Druk op ++enter++ om de switch/router-prompt te openen. Om Minicom af te sluiten, druk je op de sneltoets ++ctrl++ ++a++ gevolgd door de letter ++x++.

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 14:06:27

    Press CTRL-A Z for help on special keys


    <press ENTER>

    Switch>
    ```
