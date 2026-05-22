# Wis een harde schijf via Linux Mint

Binnen Linux Mint kun je een Solid State Drive (SSD) grondig en veilig wissen via de ingebouwde terminal, zonder dat je daarvoor de computer opnieuw hoeft op te starten naar de BIOS of UEFI. Door gebruik te maken van de krachtige command-line tool `nvme`, stuur je rechtstreeks een zogeheten Format of Sanitize-commando naar de controller van de schijf. Hierdoor worden alle opgeslagen gegevens op hardwareniveau definitief en onherstelbaar vernietigd. Dit is de snelste en meest betrouwbare methode om een moderne NVMe-SSD in Linux Mint weer in de fabrieksstatus te herstellen.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- een [opstartbare USB-stick voor Linux Mint](../../howtos/maak-opstartbare-usb-stick-ventoy/index.md){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Boot vanaf de USB-stick
Plaats de Ventoy USB-stick in de pc en start deze op via de F9-toets om het bootmenu te openen. Kies hier achtereenvolgens voor Ventoy en Linux Mint (normal mode) om rechtstreeks in de live-omgeving van Linux Mint te starten.

## Update pakketlijst
Vernieuw de lokale pakketlijst om je systeem op de hoogte te brengen van de nieuwste beschikbare pakketten en updates in de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"
    ...
    guru@hp:~$ 
    ```

## Install SSD tool
Installeer de `nvme-tool` op je systeem.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt install nvme-cli
    ```

=== "output"

    ``` title='' hl_lines="0"
    ...
    guru@hp:~$ 
    ```

## Wis de schijven
Doe een `User Data Erase`. Dit wist alle data.

=== "guru@hp:~$_"

    ``` title=''
    sudo nvme format /dev/nvme0n1 --ses=1 --force
    sudo nvme format /dev/nvme1n1 --ses=1 --force
    ```

=== "output"

    ``` title='' hl_lines="0"
    ...
    guru@hp:~$ 
    ```

## Verifieer
Om te controleren of de schijf nu echt een "leeg vel" is, kijken we naar de ruwe data op de eerste sectoren.

=== "guru@hp:~$_"
    - head -c 1M: Leest de eerste megabyte van de schijf (waar normaal de MBR, partitietabel en bootloader staan)
    - hexdump -C: Zet de binaire data om in leesbare hexadecimale tekens.

    ``` title=''
    sudo head -c 1M /dev/nvme0n1 | hexdump -C
    ```

=== "output"
    Als alles goed is gegaan, zie je slechts één regel met nullen en daarna een sterretje (*), wat betekent dat de rest van de data identiek is aan de eerste regel.

    ``` title='' hl_lines="0"
    ...
    guru@hp:~$ 
    ```

## Shutdown
Je schijf/schijven is/zijn nu in de best mogelijke conditie om een nieuw besturingssysteem te ontvangen, omdat de controller weet dat alle cellen "vrij" zijn en hij niet eerst oude data hoeft te wissen bij de eerste schrijfactie.

Doe een shutdown van de PC.


!!! info 
    Als het wissen van de harde schijf is gelukt, zal het systeem bij een herstart proberen om via PXE op te starten, wat zal mislukken. Dit is verwacht en geen probleem. Schakel dan de pc uit door de aan/uit-knop lang genoeg ingedrukt te houden.

