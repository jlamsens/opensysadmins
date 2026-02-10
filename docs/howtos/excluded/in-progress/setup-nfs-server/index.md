# Setup van een NFS server op Linux Mint 22

Het opzetten van NFSv4 (zonder legacy-ondersteuning voor v2/v3) is een slimme keuze voor de veiligheid en eenvoud. Linux Mint 22 (gebaseerd op Ubuntu 24.04) gebruikt standaard al een moderne kernel, maar we moeten de configuratie dwingen om alleen versie 4 te gebruiken.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Setup
Tekening van hoe het eruit ziet.

## Installeer NFS
Installeer eerst de benodigde pakketten op de machine die de bestanden gaat delen.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    sudo apt install nfs-kernel-server
    ```

=== "output"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```

## Schakel NFSv2 en v3 uit
Om te zorgen dat de server alleen v4 spreekt, bewerk je het NFS configuratiebestand.

=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo vi /etc/default/nfs-kernel-server
    ```

=== "output"
    Optionele uitleg.

    ``` title='/etc/default/nfs-kernel-server' hl_lines="0"
    ...
    RPCNFSDOPTS="-N 2 -N 3"
    ...
    RPCMOUNTDOPTS="--manage-gids -N 2 -N 3"
    ...
    ```

## Directory en permissies instellen
NFSv4 gebruikt een "root export" (vaak een pseudo-bestandssysteem).

=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo mkdir -p /mnt/nfs4/shared
    sudo chown nobody:nogroup /mnt/nfs4/shared
    sudo chmod 777 /mnt/nfs4/shared
    ```

=== "output"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```

## Stap X
Installeer eerst de benodigde pakketten op de machine die de bestanden gaat delen.

=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <execute some command>
    ```

=== "output"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```

## Stap X
Installeer eerst de benodigde pakketten op de machine die de bestanden gaat delen.

=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <execute some command>
    ```

=== "output"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```
