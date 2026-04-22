# Configureer Linux Mint 22 basisinstellingen

Na de installatie van Linux Mint 22 configureer je de basisinstellingen door direct de Updatebeheerder te openen om alle beschikbare systeemupdates en beveiligingspatches te installeren, wat cruciaal is voor een stabiel en veilig systeem. Vervolgens kun je via de Welkomstscherm sneltoetsen vinden voor populaire aanpassingen zoals het selecteren van een systeemmomentopnamepunt met Timeshift, het installeren van stuurprogramma's voor hardware, en het aanpassen van de bureaubladomgeving (zoals thema's en pictogrammen) naar je persoonlijke voorkeur.

## Vereisten
- een werkend [Linux Mint 22 systeem](../installeer-linuxmint22/index.md){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/O4he80akvWw?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Casper
Mogelijks krijg je nog een rode systemd fout bij `shutdown` omdat `casper` iets probeert te doen wat alleen in een live omgeving bestaat. Dit lossen we eenvoudig op door het pakket te de-installeren.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt purge casper -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt purge casper -y
    [sudo] password for guru:     
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following packages will be REMOVED:
      casper*
    0 upgraded, 0 newly installed, 1 to remove and 2 not upgraded.
    After this operation, 222 kB disk space will be freed.
    (Reading database ... 544281 files and directories currently installed.)
    Removing casper (1.498) ...
    Processing triggers for man-db (2.12.0-4build2) ...
    (Reading database ... 544220 files and directories currently installed.)
    Purging configuration files for casper (1.498) ...
    guru@hp:~$
    ```

## Grub
Verwijder de standaard opstartopties "quiet splash", waardoor tijdens het opstarten van Linux alle systeemmeldingen zichtbaar worden in plaats van een stil logo.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT=""/g' /etc/default/grub
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT=""/g' /etc/default/grub
    guru@hp:~$ 
    ```

Verkort de wachttijd van het GRUB-keuzemenu tot 2 seconden.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=2/g' /etc/default/grub
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=2/g' /etc/default/grub
    guru@hp:~$
    ```

Pas de configuratie toe, zodat deze wijzigingen effectief worden bij de volgende opstart.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo update-grub
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo update-grub
    Sourcing file `/etc/default/grub'
    Sourcing file `/etc/default/grub.d/50_linuxmint.cfg'
    Sourcing file `/etc/default/grub.d/oem-flavour.cfg'
    Generating grub configuration file ...
    Found linux image: /boot/vmlinuz-6.17.0-1017-oem
    Found initrd image: /boot/initrd.img-6.17.0-1017-oem
    Found linux image: /boot/vmlinuz-6.17.0-20-generic
    Found initrd image: /boot/initrd.img-6.17.0-20-generic
    Found linux image: /boot/vmlinuz-6.14.0-37-generic
    Found initrd image: /boot/initrd.img-6.14.0-37-generic
    Warning: os-prober will be executed to detect other bootable partitions.
    Its output will be used to detect bootable binaries on them and create new boot entries.
    Found Windows Boot Manager on /dev/nvme0n1p1@/EFI/Microsoft/Boot/bootmgfw.efi
    Adding boot menu entry for UEFI Firmware Settings ...
    done
    guru@hp:~$
    ```

Herstart.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo reboot
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo reboot
    ...
    ```