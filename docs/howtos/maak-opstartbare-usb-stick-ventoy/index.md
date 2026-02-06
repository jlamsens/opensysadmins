# Maak een opstartbare USB-stick met Ventoy

Ventoy is een opensource tool die van een USB-stick een "multiboot" station maakt zonder dat je de stick telkens opnieuw hoeft te formatteren. In tegenstelling tot traditionele tools (zoals Rufus of Etcher), installeer je Ventoy één keer op de stick, waarna je simpelweg ISO-, WIM- of EFI-bestanden naar de schijf kunt slepen in je bestandsverkenner.

## Vereisten
- een USB-stick (alle data hierop zal worden gewist)
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- een internetverbinding

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Downloaden
Download het nieuwste Ventoy Linux-archief van de officiële bron.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    cd Downloads/
    wget https://github.com/ventoy/Ventoy/releases/download/v1.1.10/ventoy-1.1.10-linux.tar.gz
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ cd Downloads/
    guru@hp:~/Downloads$ wget https://github.com/ventoy/Ventoy/releases/download/v1.1.10/ventoy-1.1.10-linux.tar.gz
    --2026-02-05 21:12:30--  https://github.com/ventoy/Ventoy/releases/download/v1.1.10/ventoy-1.1.10-linux.tar.gz
    Resolving github.com (github.com)... 140.82.121.4
    Connecting to github.com (github.com)|140.82.121.4|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://release-assets.githubusercontent.com/github-production-release-asset/246335987/3facb002-d572-4ebe-8613-4af1a62237ad?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-02-05T20%3A49%3A31Z&rscd=attachment%3B+filename%3Dventoy-1.1.10-linux.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-02-05T19%3A48%3A49Z&ske=2026-02-05T20%3A49%3A31Z&sks=b&skv=2018-11-09&sig=5PQC8I%2BsKspPmYupZO%2BdPKbls6UQItGLjXrVaZMtImg%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3MDMyNDE1MSwibmJmIjoxNzcwMzIyMzUxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.bkgQBYoU0Mw1P_ne2rfBouGUOYCdJuW5-3-RlsErm6k&response-content-disposition=attachment%3B%20filename%3Dventoy-1.1.10-linux.tar.gz&response-content-type=application%2Foctet-stream [following]
    --2026-02-05 21:12:30--  https://release-assets.githubusercontent.com/github-production-release-asset/246335987/3facb002-d572-4ebe-8613-4af1a62237ad?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-02-05T20%3A49%3A31Z&rscd=attachment%3B+filename%3Dventoy-1.1.10-linux.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-02-05T19%3A48%3A49Z&ske=2026-02-05T20%3A49%3A31Z&sks=b&skv=2018-11-09&sig=5PQC8I%2BsKspPmYupZO%2BdPKbls6UQItGLjXrVaZMtImg%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3MDMyNDE1MSwibmJmIjoxNzcwMzIyMzUxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.bkgQBYoU0Mw1P_ne2rfBouGUOYCdJuW5-3-RlsErm6k&response-content-disposition=attachment%3B%20filename%3Dventoy-1.1.10-linux.tar.gz&response-content-type=application%2Foctet-stream
    Resolving release-assets.githubusercontent.com (release-assets.githubusercontent.com)... 185.199.111.133, 185.199.110.133, 185.199.108.133, ...
    Connecting to release-assets.githubusercontent.com (release-assets.githubusercontent.com)|185.199.111.133|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 20370890 (19M) [application/octet-stream]
    Saving to: ‘ventoy-1.1.10-linux.tar.gz’

    ventoy-1.1.10-linux.tar.gz                  100%[=========================================================================================>]  19,43M  30,6MB/s    in 0,6s    

    2026-02-05 21:12:31 (30,6 MB/s) - ‘ventoy-1.1.10-linux.tar.gz’ saved [20370890/20370890]

    guru@hp:~/Downloads$ 
    ```

## Uitpakken
Pak het gedownloade Ventoy bestand lokaal uit op je systeem.

=== "guru@hp:~/Downloads_"

    ``` title='' hl_lines="0"
    tar -xvf ventoy-1.1.10-linux.tar.gz
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~/Downloads$ tar -xvf ventoy-1.1.10-linux.tar.gz 
    ./ventoy-1.1.10/
    ./ventoy-1.1.10/README
    ./ventoy-1.1.10/VentoyGUI.aarch64
    ./ventoy-1.1.10/CreatePersistentImg.sh
    ./ventoy-1.1.10/Ventoy2Disk.sh
    ./ventoy-1.1.10/VentoyGUI.mips64el
    ./ventoy-1.1.10/VentoyGUI.i386
    ./ventoy-1.1.10/VentoyGUI.x86_64
    ./ventoy-1.1.10/ExtendPersistentImg.sh
    ./ventoy-1.1.10/WebUI/
    ./ventoy-1.1.10/WebUI/index.html
    ./ventoy-1.1.10/WebUI/favicon.ico
    ./ventoy-1.1.10/WebUI/static/
    ./ventoy-1.1.10/WebUI/static/img/
    ./ventoy-1.1.10/WebUI/static/img/refresh.ico
    ./ventoy-1.1.10/WebUI/static/img/dropdown.png
    ./ventoy-1.1.10/WebUI/static/img/VentoyLogo.png
    ./ventoy-1.1.10/WebUI/static/AdminLTE/
    ./ventoy-1.1.10/WebUI/static/AdminLTE/css/
    ./ventoy-1.1.10/WebUI/static/AdminLTE/css/skins/
    ./ventoy-1.1.10/WebUI/static/AdminLTE/css/skins/skin-blue.min.css
    ./ventoy-1.1.10/WebUI/static/AdminLTE/css/AdminLTE.min.css
    ./ventoy-1.1.10/WebUI/static/AdminLTE/js/
    ./ventoy-1.1.10/WebUI/static/AdminLTE/js/app.min.js
    ./ventoy-1.1.10/WebUI/static/css/
    ./ventoy-1.1.10/WebUI/static/css/font-awesome.min.css
    ./ventoy-1.1.10/WebUI/static/css/vtoy.css
    ./ventoy-1.1.10/WebUI/static/css/ionicons.min.css
    ./ventoy-1.1.10/WebUI/static/bootstrap/
    ./ventoy-1.1.10/WebUI/static/bootstrap/css/
    ./ventoy-1.1.10/WebUI/static/bootstrap/css/bootstrap.min.css
    ./ventoy-1.1.10/WebUI/static/bootstrap/css/bootstrap-theme.min.css
    ./ventoy-1.1.10/WebUI/static/bootstrap/js/
    ./ventoy-1.1.10/WebUI/static/bootstrap/js/bootstrap.min.js
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/glyphicons-halflings-regular.ttf
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/glyphicons-halflings-regular.woff2
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/glyphicons-halflings-regular.svg
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/glyphicons-halflings-regular.eot
    ./ventoy-1.1.10/WebUI/static/bootstrap/fonts/glyphicons-halflings-regular.woff
    ./ventoy-1.1.10/WebUI/static/js/
    ./ventoy-1.1.10/WebUI/static/js/jquery.vtoy.alert.js
    ./ventoy-1.1.10/WebUI/static/js/jQuery-2.1.4.min.js
    ./ventoy-1.1.10/WebUI/static/js/languages.js
    ./ventoy-1.1.10/WebUI/static/js/vtoy.js
    ./ventoy-1.1.10/WebUI/static/js/jquery.validate.min.js
    ./ventoy-1.1.10/WebUI/static/fonts/
    ./ventoy-1.1.10/WebUI/static/fonts/ionicons.eot
    ./ventoy-1.1.10/WebUI/static/fonts/glyphicons-halflings-regular.ttf
    ./ventoy-1.1.10/WebUI/static/fonts/glyphicons-halflings-regular.woff2
    ./ventoy-1.1.10/WebUI/static/fonts/fontawesome-webfont.woff
    ./ventoy-1.1.10/WebUI/static/fonts/ionicons.ttf
    ./ventoy-1.1.10/WebUI/static/fonts/glyphicons-halflings-regular.woff
    ./ventoy-1.1.10/WebUI/static/fonts/fontawesome-webfont.ttf
    ./ventoy-1.1.10/WebUI/static/fonts/fontawesome-webfont.woff2
    ./ventoy-1.1.10/VentoyWeb.sh
    ./ventoy-1.1.10/VentoyVlnk.sh
    ./ventoy-1.1.10/tool/
    ./ventoy-1.1.10/tool/ventoy_lib.sh
    ./ventoy-1.1.10/tool/VentoyGTK.glade
    ./ventoy-1.1.10/tool/mips64el/
    ./ventoy-1.1.10/tool/mips64el/V2DServer.xz
    ./ventoy-1.1.10/tool/mips64el/xzcat
    ./ventoy-1.1.10/tool/mips64el/ash.xz
    ./ventoy-1.1.10/tool/mips64el/mount.exfat-fuse.xz
    ./ventoy-1.1.10/tool/mips64el/Ventoy2Disk.qt5
    ./ventoy-1.1.10/tool/mips64el/vtoycli.xz
    ./ventoy-1.1.10/tool/mips64el/hexdump.xz
    ./ventoy-1.1.10/tool/mips64el/mkexfatfs.xz
    ./ventoy-1.1.10/tool/mips64el/Plugson.xz
    ./ventoy-1.1.10/tool/mips64el/Ventoy2Disk.gtk3
    ./ventoy-1.1.10/tool/mips64el/vlnk.xz
    ./ventoy-1.1.10/tool/mips64el/vtoygpt.xz
    ./ventoy-1.1.10/tool/plugson.tar.xz
    ./ventoy-1.1.10/tool/x86_64/
    ./ventoy-1.1.10/tool/x86_64/V2DServer.xz
    ./ventoy-1.1.10/tool/x86_64/xzcat
    ./ventoy-1.1.10/tool/x86_64/ash.xz
    ./ventoy-1.1.10/tool/x86_64/mount.exfat-fuse.xz
    ./ventoy-1.1.10/tool/x86_64/mkexfatfs_static.xz
    ./ventoy-1.1.10/tool/x86_64/Ventoy2Disk.qt5
    ./ventoy-1.1.10/tool/x86_64/vtoycli.xz
    ./ventoy-1.1.10/tool/x86_64/hexdump.xz
    ./ventoy-1.1.10/tool/x86_64/mkexfatfs.xz
    ./ventoy-1.1.10/tool/x86_64/Plugson.xz
    ./ventoy-1.1.10/tool/x86_64/Ventoy2Disk.gtk2
    ./ventoy-1.1.10/tool/x86_64/Ventoy2Disk.gtk3
    ./ventoy-1.1.10/tool/x86_64/vlnk.xz
    ./ventoy-1.1.10/tool/x86_64/vtoygpt.xz
    ./ventoy-1.1.10/tool/VentoyWorker.sh
    ./ventoy-1.1.10/tool/languages.json
    ./ventoy-1.1.10/tool/distro_gui_type.json
    ./ventoy-1.1.10/tool/aarch64/
    ./ventoy-1.1.10/tool/aarch64/V2DServer.xz
    ./ventoy-1.1.10/tool/aarch64/xzcat
    ./ventoy-1.1.10/tool/aarch64/ash.xz
    ./ventoy-1.1.10/tool/aarch64/mount.exfat-fuse.xz
    ./ventoy-1.1.10/tool/aarch64/Ventoy2Disk.qt5
    ./ventoy-1.1.10/tool/aarch64/vtoycli.xz
    ./ventoy-1.1.10/tool/aarch64/hexdump.xz
    ./ventoy-1.1.10/tool/aarch64/mkexfatfs.xz
    ./ventoy-1.1.10/tool/aarch64/Plugson.xz
    ./ventoy-1.1.10/tool/aarch64/Ventoy2Disk.gtk3
    ./ventoy-1.1.10/tool/aarch64/vlnk.xz
    ./ventoy-1.1.10/tool/aarch64/vtoygpt.xz
    ./ventoy-1.1.10/tool/ENROLL_THIS_KEY_IN_MOKMANAGER.cer
    ./ventoy-1.1.10/tool/i386/
    ./ventoy-1.1.10/tool/i386/V2DServer.xz
    ./ventoy-1.1.10/tool/i386/xzcat
    ./ventoy-1.1.10/tool/i386/ash.xz
    ./ventoy-1.1.10/tool/i386/mount.exfat-fuse.xz
    ./ventoy-1.1.10/tool/i386/Ventoy2Disk.qt5
    ./ventoy-1.1.10/tool/i386/vtoycli.xz
    ./ventoy-1.1.10/tool/i386/hexdump.xz
    ./ventoy-1.1.10/tool/i386/mkexfatfs.xz
    ./ventoy-1.1.10/tool/i386/Plugson.xz
    ./ventoy-1.1.10/tool/i386/Ventoy2Disk.gtk2
    ./ventoy-1.1.10/tool/i386/Ventoy2Disk.gtk3
    ./ventoy-1.1.10/tool/i386/vlnk.xz
    ./ventoy-1.1.10/tool/i386/vtoygpt.xz
    ./ventoy-1.1.10/VentoyPlugson.sh
    ./ventoy-1.1.10/boot/
    ./ventoy-1.1.10/boot/core.img.xz
    ./ventoy-1.1.10/boot/boot.img
    ./ventoy-1.1.10/ventoy/
    ./ventoy-1.1.10/ventoy/ventoy.disk.img.xz
    ./ventoy-1.1.10/ventoy/version
    ./ventoy-1.1.10/ventoy/ventoy_4k.disk.img.xz
    ./ventoy-1.1.10/plugin/
    ./ventoy-1.1.10/plugin/ventoy/
    ./ventoy-1.1.10/plugin/ventoy/theme/
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_s.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_sw.png
    ./ventoy-1.1.10/plugin/ventoy/theme/icons/
    ./ventoy-1.1.10/plugin/ventoy/theme/icons/vtoyiso.png
    ./ventoy-1.1.10/plugin/ventoy/theme/icons/red-hat.png
    ./ventoy-1.1.10/plugin/ventoy/theme/icons/ubuntu.png
    ./ventoy-1.1.10/plugin/ventoy/theme/icons/deepin.png
    ./ventoy-1.1.10/plugin/ventoy/theme/background.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_n.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_nw.png
    ./ventoy-1.1.10/plugin/ventoy/theme/theme.txt
    ./ventoy-1.1.10/plugin/ventoy/theme/slider_s.png
    ./ventoy-1.1.10/plugin/ventoy/theme/slider_c.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_sw.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_e.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_c.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_s.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_ne.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_se.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_e.png
    ./ventoy-1.1.10/plugin/ventoy/theme/select_c.png
    ./ventoy-1.1.10/plugin/ventoy/theme/slider_n.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_n.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_nw.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_w.png
    ./ventoy-1.1.10/plugin/ventoy/theme/terminal_box_se.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_ne.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_c.png
    ./ventoy-1.1.10/plugin/ventoy/theme/menu_w.png
    ./ventoy-1.1.10/plugin/ventoy/ventoy_grub.cfg
    ./ventoy-1.1.10/plugin/ventoy/ventoy.json
    guru@hp:~/Downloads$
    ```

## USB-stick voorbereiden
Plaats de USB-stick. Zoek je USB-stick op met `lsblk`. Tab `output` geeft in dit geval `/dev/sdb` aan, met 1 partitie `/dev/sdb1`; een oude Linux Mint USB-stick. Kijk goed naar de "size"; in dit voorbeeld is `/dev/sda` namelijk een harde schijf van 2,7T die je zeker niet wil wissen!

=== "guru@hp:~/Downloads_"

    ``` title='' hl_lines="0"
    lsblk
    ```

=== "output"

    ``` title='' hl_lines="3 4"
    guru@hp:~/Downloads$ lsblk
    NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   2,7T  0 disk 
    └─sda1        8:1    0   2,7T  0 part 
    sdb           8:16   1 115,5G  0 disk 
    └─sdb1        8:17   1 115,5G  0 part /media/guru/LINUX MINT
    nvme0n1     259:0    0 953,9G  0 disk 
    ├─nvme0n1p1 259:1    0   100M  0 part /boot/efi
    ├─nvme0n1p2 259:2    0    16M  0 part 
    ├─nvme0n1p3 259:3    0 199,4G  0 part 
    ├─nvme0n1p4 259:4    0   642M  0 part 
    └─nvme0n1p5 259:5    0 753,8G  0 part /
    guru@hp:~/Downloads$ 
    ```

## Unmount
De USB-stick (of beter de partitie daarop) is op dit moment nog gekoppeld (mounted) aan het bestandssysteem van Linux Mint. De partitie moet eerst ontkoppeld worden, alvorens het installatiescript kan worden uitgevoerd.

=== "guru@hp:~/Downloads_"

    ``` title='' hl_lines="0"
    mount | grep sdb
    umount /dev/sdb1
    mount | grep sdb
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~/Downloads$ mount | grep sdb
    /dev/sdb1 on /media/guru/LINUX MINT type vfat (rw,nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,showexec,utf8,flush,errors=remount-ro,uhelper=udisks2)
    guru@hp:~/Downloads$ umount /dev/sdb1
    guru@hp:~/Downloads$ mount | grep sdb
    guru@hp:~/Downloads$ 
    ```

## Installatie
Voer de installatie uit. Vervang `/dev/sdX` door de juiste letter van jouw stick! Gebruik nooit het partitienummer zoals de `1` in bv. `sdb1`!

=== "guru@hp:~/Downloads_"

    ``` title='' hl_lines="0"
    cd ventoy-1.1.10/
    sudo ./Ventoy2Disk.sh -i /dev/sdb
    ```

=== "output"

    ``` title='' hl_lines="12 13"
    guru@hp:~/Downloads$ cd ventoy-1.1.10/
    sudo ./Ventoy2Disk.sh -i /dev/sdb
    [sudo] password for guru:     

    **********************************************
          Ventoy: 1.1.10  x86_64
          longpanda admin@ventoy.net
          https://www.ventoy.net
    **********************************************

    Disk : /dev/sdb
    Model: Kingston DataTraveler 3.0 (scsi)
    Size : 115 GiB
    Style: MBR


    Attention:
    You will install Ventoy to /dev/sdb.
    All the data on the disk /dev/sdb will be lost!!!

    Continue? (y/n) y

    All the data on the disk /dev/sdb will be lost!!!
    Double-check. Continue? (y/n) y
    delete /dev/sdb1

    Create partitions on /dev/sdb by parted in MBR style ...
    Done
    Wait for partitions ...
    partition exist OK
    create efi fat fs /dev/sdb2 ...
    mkfs.fat 4.2 (2021-01-31)
    success
    Wait for partitions $vPART1 and $vPART2 ...
    /dev/sdb1 exist OK
    /dev/sdb2 exist OK
    partition exist OK
    Format partition 1 /dev/sdb1 ...
    mkexfatfs 1.3.0
    Creating... done.
    Flushing... done.
    File system created successfully.
    mkexfatfs success
    writing data to disk ...
    sync data ...
    esp partition processing ...

    Install Ventoy to /dev/sdb successfully finished.

    guru@hp:~/Downloads/ventoy-1.1.10$ 
    ```

## ISO's toevoegen
Zodra de installatie klaar is, verwijder je de USB-stick en plaats je die opnieuw. Je ziet in je bestandsbeheerder (en/of op het bureaublad) een nieuwe schijf verschijnen met de naam `Ventoy`. Het enige wat je nu nog moet doen, is je gedownloade .ISO bestanden (bv. Linux Mint, Ubuntu, Windows, ...) simpelweg naar deze schijf kopiëren. Je hoeft daarna niets uit te pakken; Ventoy leest de ISO's direct bij het opstarten.

!!! danger "Kopiëren naar een USB-stick"
    Je kan altijd via de GUI bestanden kopiëren, maar de voortgangsbalk van de bestandsverkenner kan echter verdwijnen vóórdat de data fysiek op de stick staat. Klik altijd op `Unmount` in de zijbalk en wacht op de melding dat de schijf veilig verwijderd kan worden. Beter nog: gebruik `rsync` met de `--fsync` parameter vanaf de Terminal.

=== "guru@hp:~$_"
    In dit voorbeeld wordt de stick automatisch gemount onder `/media/guru/Ventoy` en kopiëren we een aantal ISO bestanden van onder `/home/guru/Downloads/ISO/`. Vervolgens wordt de stick ontkoppeld en kan die verwijderd worden.

    ``` title='' hl_lines="0"
    mount | grep sdb
    rsync -vhrl --size-only --progress --delete --fsync /home/guru/Downloads/ISO/ /media/guru/Ventoy/
    umount /dev/sdb1
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ rsync -vhrl --size-only --progress --delete --fsync /home/guru/Downloads/ISO/ /media/guru/Ventoy/
    sending incremental file list
    Win11_25H2_Pro.iso
              7,09G 100%    1,22GB/s    0:00:05 (xfr#1, to-chk=1/3)
    linuxmint-22.3-cinnamon-64bit.iso
              3,09G 100%    4,93MB/s    0:09:58 (xfr#2, to-chk=0/3)

    sent 10,19G bytes  received 54 bytes  11,80M bytes/sec
    total size is 10,18G  speedup is 1,00
    guru@hp:~$ umount /dev/sdb1
    guru@hp:~$ 
    ```

## Booten
Start de PC op die je wenst te installeren. Ga naar het `Boot Menu` (meestal F9, F12, Esc, ...) en kies de USB-stick. Je krijgt nu een mooi menu te zien waar je kunt kiezen welke ISO je wilt opstarten.