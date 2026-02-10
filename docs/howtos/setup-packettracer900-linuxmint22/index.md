# Setup Packet Tracer 9.0.0 op Linux Mint 22

Cisco Packet Tracer is een gratis netwerksimulatietool ontwikkeld door Cisco Systems, waarmee je virtuele netwerktopologieën kunnen ontwerpen, bouwen, configureren en testen in een risicovrije omgeving. Het je in staat om met diverse netwerkapparaten zoals routers en switches te experimenteren, netwerkprotocollen te simuleren en problemen op te lossen, zonder de noodzaak van dure fysieke hardware.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding

!!! danger "VDAB cursisten"
    Gebruik het Packet Tracer installatie-bestand `CiscoPacketTracer_900_Ubuntu_64bit.deb` van in de `Download` folder in Google Classroom.

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Open Terminal
- Start de bestandsbeheerder `Nemo`
- Selecteer de map `Downloads`
- Klik met de rechtermuisknop *op een lege ruimte* en selecteer `Openen in Terminal`

## Installeer Packet Tracer

=== "guru@hp:~/Downloads$_"
    Ververs eerst de lokale database zodat APT weet waar de nieuwste afhankelijkheden staan. Installeer vervolgens het pakket en haal automatisch de benodigde afhankelijkheden op. Accepteer de EULA.

    ``` title='' hl_lines="0"
    sudo apt update
    sudo apt install ./CiscoPacketTracer_900_Ubuntu_64bit.deb -y
    ```

=== "output"

    ``` title='' hl_lines="1 14 55 61"
    guru@hp:~/Downloads$ sudo apt update
    Hit:1 http://archive.ubuntu.com/ubuntu noble InRelease
    Hit:2 http://archive.ubuntu.com/ubuntu noble-updates InRelease
    Hit:3 http://archive.ubuntu.com/ubuntu noble-backports InRelease
    Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease                                           
    Ign:5 http://packages.linuxmint.com zena InRelease
    Hit:6 http://packages.linuxmint.com zena Release
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    15 packages can be upgraded. Run 'apt list --upgradable' to see them.
    guru@hp:~/Downloads$ 

    guru@hp:~/Downloads$ sudo apt install ./CiscoPacketTracer_900_Ubuntu_64bit.deb -y
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Note, selecting 'packettracer' instead of './CiscoPacketTracer_900_Ubuntu_64bit.deb'
    The following additional packages will be installed:
      libpcre2-dev libpcre2-posix3
    The following NEW packages will be installed:
      libpcre2-dev libpcre2-posix3 packettracer
    0 upgraded, 3 newly installed, 0 to remove and 15 not upgraded.
    Need to get 743 kB/392 MB of archives.
    After this operation, 2.639 kB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 libpcre2-posix3 amd64 10.42-4ubuntu2.1 [6.748 B]
    Get:2 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 libpcre2-dev amd64 10.42-4ubuntu2.1 [736 kB]
    Get:3 /home/guru/Downloads/CiscoPacketTracer_900_Ubuntu_64bit.deb packettracer amd64 9.0 [391 MB]
    Fetched 743 kB in 2s (349 kB/s)   
    Selecting previously unselected package libpcre2-posix3:amd64.
    (Reading database ... 501493 files and directories currently installed.)
    Preparing to unpack .../libpcre2-posix3_10.42-4ubuntu2.1_amd64.deb ...
    Unpacking libpcre2-posix3:amd64 (10.42-4ubuntu2.1) ...
    Selecting previously unselected package libpcre2-dev:amd64.
    Preparing to unpack .../libpcre2-dev_10.42-4ubuntu2.1_amd64.deb ...
    Unpacking libpcre2-dev:amd64 (10.42-4ubuntu2.1) ...
    Selecting previously unselected package packettracer.
    Preparing to unpack .../CiscoPacketTracer_900_Ubuntu_64bit.deb ...
    Unpacking packettracer (9.0) ...
    Setting up libpcre2-posix3:amd64 (10.42-4ubuntu2.1) ...
    Setting up libpcre2-dev:amd64 (10.42-4ubuntu2.1) ...
    Setting up packettracer (9.0) ...
    Non-root user: guru
    Non-root home: /home/guru

    Please review Cisco Packet Tracer End User Licese Agreement (EULA)


      Cisco Packet Tracer Software License Agreement

      DOWNLOADING, INSTALLING, OR USING THE CISCO PACKET TRACER SOFTWARE CONSTITUTES ACCEPTANCE OF THE CISCO END USER LICENSE AGREEMENT ("EULA" https://www.cisco.com/c/en/us/about/leg
      al/cloud-and-software/end_user_license_agreement.html) AND THE SUPPLEMENTAL END USER LICENSE AGREEMENT FOR CISCO PACKET TRACER ("SEULA" https://www.cisco.com/c/dam/en_us/about/d
      oing_business/legal/seula/cisco-packet-tracer-software.pdf). IF YOU DO NOT AGREE TO ALL OF THE TERMS OF THE EULA AND SEULA, THEN CISCO SYSTEMS, INC. ("CISCO") IS UNWILLING TO LI
      CENSE THE SOFTWARE TO YOU AND YOU ARE NOT AUTHORIZED TO DOWNLOAD, INSTALL OR USE THE SOFTWARE.
    Press q to quit

    Enter 1, 2 or 3 at the prompt below
    1) Show EULA text again
    2) Accept EULA
    3) Decline EULA
    #? 2
    Accept EULA (selected)
    Directory '/home/guru/.local/share/mime/packages' does not exist!
    xdg-icon-resource: No writable system icon directory found.
    xdg-icon-resource: No writable system icon directory found.
    gtk-update-icon-cache: No theme index file.
    ln: failed to create symbolic link '/home/guru/.local/share/icons/gnome/index.theme': File exists
    xdg-icon-resource: No writable system icon directory found.
    xdg-icon-resource: No writable system icon directory found.
    gtk-update-icon-cache: No theme index file.
    ln: failed to create symbolic link '/home/guru/.local/share/icons/gnome/index.theme': File exists
    xdg-icon-resource: No writable system icon directory found.
    xdg-icon-resource: No writable system icon directory found.
    gtk-update-icon-cache: No theme index file.
    ln: failed to create symbolic link '/home/guru/.local/share/icons/gnome/index.theme': File exists
    xdg-icon-resource: No writable system icon directory found.
    xdg-icon-resource: No writable system icon directory found.
    gtk-update-icon-cache: No theme index file.
    Processing triggers for man-db (2.12.0-4build2) ...
    Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
    N: Download is performed unsandboxed as root as file '/home/guru/Downloads/CiscoPacketTracer_900_Ubuntu_64bit.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
    guru@hp:~/Downloads$ 
    ```

## Notice
Negeer de waarschuwing "Notice" aan het einde van de installatie. Alles is goed gegaan.

``` title='' hl_lines="1"
...
N: Download is performed unsandboxed as root as file '/home/guru/Downloads/CiscoPacketTracer_900_Ubuntu_64bit.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
guru@hp:~/Downloads$ 
```

## Activation link
Lid van Cisco Network Academy? Je hebt als het goed is een activeringslink ontvangen in je privé-e-mail. Activeer je account. Mogelijk heb je dit al eerder gedaan. Sla deze stap dan over.

<img src="activation-link.png"/>

## Mint menu
Selecteer "Menu" en begin met het typen van "pac". Start "PacketTracer 9.0.0".

## Multi-user
Antwoord "no" bij de vraag "Would you like to run multi-user when application starts?".

## Sign-in
- Kies eerst `Keep me logged in (for 3 months)` 
- Selecteer vervolgens `Login`. Een nieuw venster wordt geopend in je webbrowser. Login met je Netacad credentials (vul je privé-e-mailadres in!)

## Font configuration
Persoonlijke voorkeur. Selecteer `Options -> Preferences -> Font`. Vergroot de lettergrootte naar 12 en klik op `Apply`.
Sluit vervolgens het venster.

<img src="font-configuration.png"/>






