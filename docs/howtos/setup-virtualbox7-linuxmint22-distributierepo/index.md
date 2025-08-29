# Setup VirtualBox 7 op Linux Mint 22 (distributie repository)

VirtualBox stelt je in staat om andere besturingssystemen (zoals Windows of een andere Linux-distributie) te draaien als virtuele machines binnen je bestaande Linux Mint 22-omgeving. Dit gebeurt in een geïsoleerde en veilige virtuele omgeving, waardoor je software kunt testen of applicaties kunt gebruiken die niet native op Linux Mint draaien, zonder je hoofdinstallatie te beïnvloeden.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- internet verbinding

<iframe width="560" height="315" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## Update pakketlijst
Vernieuw de lokale pakketlijst om je systeem op de hoogte te brengen van de nieuwste beschikbare pakketten en updates in de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt update
    [sudo] password for guru:     
    Hit:1 http://security.ubuntu.com/ubuntu noble-security InRelease
    Ign:2 https://linuxmint-packages.mirror.liteserver.nl xia InRelease            
    Hit:3 https://ppa.launchpadcontent.net/obsproject/obs-studio/ubuntu noble InRelease
    Hit:4 http://archive.ubuntu.com/ubuntu noble InRelease
    Hit:5 https://linuxmint-packages.mirror.liteserver.nl xia Release
    Hit:6 http://archive.ubuntu.com/ubuntu noble-updates InRelease
    Hit:8 http://archive.ubuntu.com/ubuntu noble-backports InRelease
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    3 packages can be upgraded. Run 'apt list --upgradable' to see them.
    guru@hp:~$ 
    ```

## Verifieer versie in repository
Bekijk welke versies van het pakket virtualbox beschikbaar zijn en uit welke software repository elke versie afkomstig is.

=== "guru@hp:~$_"

    ``` title=''
    apt-cache policy virtualbox
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ apt-cache policy virtualbox
    virtualbox:
      Installed: (none)
      Candidate: 7.0.16-dfsg-2ubuntu1.1
      Version table:
         7.0.16-dfsg-2ubuntu1.1 500
            500 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages
         7.0.16-dfsg-2 500
            500 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages
    guru@hp:~$ 
    ```

## Installeer VirtualBox
Installeer VirtualBox uit de gekoppelde software repositories.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt install virtualbox -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install virtualbox -y
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following package was automatically installed and is no longer required:
      nvidia-firmware-570-570.133.07
    Use 'sudo apt autoremove' to remove it.
    The following additional packages will be installed:
      libgsoap-2.8.132t64 liblzf1 libqt5help5 libqt5opengl5t64
      libqt5printsupport5t64 libqt5sql5-sqlite libqt5sql5t64 libqt5x11extras5
      libqt5xml5t64 libtpms0 libvncserver1 virtualbox-dkms virtualbox-qt
    Suggested packages:
      vde2 virtualbox-guest-additions-iso
    The following NEW packages will be installed:
      libgsoap-2.8.132t64 liblzf1 libqt5help5 libqt5opengl5t64
      libqt5printsupport5t64 libqt5sql5-sqlite libqt5sql5t64 libqt5x11extras5
      libqt5xml5t64 libtpms0 libvncserver1 virtualbox virtualbox-dkms
      virtualbox-qt
    0 upgraded, 14 newly installed, 0 to remove and 3 not upgraded.
    Need to get 59,2 MB of archives.
    After this operation, 202 MB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu noble/universe amd64 libgsoap-2.8.132t64 amd64 2.8.132-2.1build2 [264 kB]
    Get:2 http://archive.ubuntu.com/ubuntu noble/universe amd64 liblzf1 amd64 3.6-4 [7.624 B]
    Get:3 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5sql5t64 amd64 5.15.13+dfsg-1ubuntu1 [122 kB]
    Get:4 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5help5 amd64 5.15.13-1 [161 kB]
    Get:5 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5opengl5t64 amd64 5.15.13+dfsg-1ubuntu1 [150 kB]
    Get:6 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5printsupport5t64 amd64 5.15.13+dfsg-1ubuntu1 [208 kB]
    Get:7 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5sql5-sqlite amd64 5.15.13+dfsg-1ubuntu1 [51,5 kB]
    Get:8 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5x11extras5 amd64 5.15.13-1 [10,9 kB]
    Get:9 http://archive.ubuntu.com/ubuntu noble/universe amd64 libqt5xml5t64 amd64 5.15.13+dfsg-1ubuntu1 [124 kB]
    Get:10 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 libtpms0 amd64 0.9.3-0ubuntu4.24.04.1 [373 kB]
    Get:11 http://archive.ubuntu.com/ubuntu noble/main amd64 libvncserver1 amd64 0.9.14+dfsg-1build2 [134 kB]
    Get:12 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 virtualbox-dkms amd64 7.0.16-dfsg-2ubuntu1.1 [763 kB]
    Get:13 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 virtualbox amd64 7.0.16-dfsg-2ubuntu1.1 [31,7 MB]
    Get:14 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 virtualbox-qt amd64 7.0.16-dfsg-2ubuntu1.1 [25,1 MB]
    Fetched 59,2 MB in 2s (25,4 MB/s)         
    Selecting previously unselected package libgsoap-2.8.132t64:amd64.
    (Reading database ... 575206 files and directories currently installed.)
    Preparing to unpack .../00-libgsoap-2.8.132t64_2.8.132-2.1build2_amd64.deb ...
    Unpacking libgsoap-2.8.132t64:amd64 (2.8.132-2.1build2) ...
    Selecting previously unselected package liblzf1:amd64.
    Preparing to unpack .../01-liblzf1_3.6-4_amd64.deb ...
    Unpacking liblzf1:amd64 (3.6-4) ...
    Selecting previously unselected package libqt5sql5t64:amd64.
    Preparing to unpack .../02-libqt5sql5t64_5.15.13+dfsg-1ubuntu1_amd64.deb ...
    Unpacking libqt5sql5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Selecting previously unselected package libqt5help5:amd64.
    Preparing to unpack .../03-libqt5help5_5.15.13-1_amd64.deb ...
    Unpacking libqt5help5:amd64 (5.15.13-1) ...
    Selecting previously unselected package libqt5opengl5t64:amd64.
    Preparing to unpack .../04-libqt5opengl5t64_5.15.13+dfsg-1ubuntu1_amd64.deb ...
    Unpacking libqt5opengl5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Selecting previously unselected package libqt5printsupport5t64:amd64.
    Preparing to unpack .../05-libqt5printsupport5t64_5.15.13+dfsg-1ubuntu1_amd64.de
    b ...
    Unpacking libqt5printsupport5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Selecting previously unselected package libqt5sql5-sqlite:amd64.
    Preparing to unpack .../06-libqt5sql5-sqlite_5.15.13+dfsg-1ubuntu1_amd64.deb ...
    Unpacking libqt5sql5-sqlite:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Selecting previously unselected package libqt5x11extras5:amd64.
    Preparing to unpack .../07-libqt5x11extras5_5.15.13-1_amd64.deb ...
    Unpacking libqt5x11extras5:amd64 (5.15.13-1) ...
    Selecting previously unselected package libqt5xml5t64:amd64.
    Preparing to unpack .../08-libqt5xml5t64_5.15.13+dfsg-1ubuntu1_amd64.deb ...
    Unpacking libqt5xml5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Selecting previously unselected package libtpms0:amd64.
    Preparing to unpack .../09-libtpms0_0.9.3-0ubuntu4.24.04.1_amd64.deb ...
    Unpacking libtpms0:amd64 (0.9.3-0ubuntu4.24.04.1) ...
    Selecting previously unselected package libvncserver1:amd64.
    Preparing to unpack .../10-libvncserver1_0.9.14+dfsg-1build2_amd64.deb ...
    Unpacking libvncserver1:amd64 (0.9.14+dfsg-1build2) ...
    Selecting previously unselected package virtualbox-dkms.
    Preparing to unpack .../11-virtualbox-dkms_7.0.16-dfsg-2ubuntu1.1_amd64.deb ...
    Unpacking virtualbox-dkms (7.0.16-dfsg-2ubuntu1.1) ...
    Selecting previously unselected package virtualbox.
    Preparing to unpack .../12-virtualbox_7.0.16-dfsg-2ubuntu1.1_amd64.deb ...
    Unpacking virtualbox (7.0.16-dfsg-2ubuntu1.1) ...
    Selecting previously unselected package virtualbox-qt.
    Preparing to unpack .../13-virtualbox-qt_7.0.16-dfsg-2ubuntu1.1_amd64.deb ...
    Unpacking virtualbox-qt (7.0.16-dfsg-2ubuntu1.1) ...
    Setting up libqt5x11extras5:amd64 (5.15.13-1) ...
    Setting up libqt5xml5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Setting up libvncserver1:amd64 (0.9.14+dfsg-1build2) ...
    Setting up liblzf1:amd64 (3.6-4) ...
    Setting up libqt5sql5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Setting up libqt5opengl5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Setting up libtpms0:amd64 (0.9.3-0ubuntu4.24.04.1) ...
    Setting up virtualbox-dkms (7.0.16-dfsg-2ubuntu1.1) ...
    Loading new virtualbox-7.0.16 DKMS files...
    Building for 6.8.0-62-generic 6.8.0-64-generic
    Building initial module for 6.8.0-62-generic
    Done.

    vboxdrv.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-62-generic/updates/dkms/

    vboxnetadp.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-62-generic/updates/dkms/

    vboxnetflt.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-62-generic/updates/dkms/
    depmod...
    Building initial module for 6.8.0-64-generic
    Done.

    vboxdrv.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-64-generic/updates/dkms/

    vboxnetadp.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-64-generic/updates/dkms/

    vboxnetflt.ko.zst:
    Running module version sanity check.
    - Original module
      - No original module exists within this kernel
    - Installation
      - Installing to /lib/modules/6.8.0-64-generic/updates/dkms/
    depmod...
    Setting up libgsoap-2.8.132t64:amd64 (2.8.132-2.1build2) ...
    Setting up libqt5printsupport5t64:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Setting up libqt5sql5-sqlite:amd64 (5.15.13+dfsg-1ubuntu1) ...
    Setting up libqt5help5:amd64 (5.15.13-1) ...
    Setting up virtualbox (7.0.16-dfsg-2ubuntu1.1) ...
    Setting up virtualbox-qt (7.0.16-dfsg-2ubuntu1.1) ...
    Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
    Processing triggers for desktop-file-utils (0.27-2build1) ...
    Processing triggers for hicolor-icon-theme (0.17-2) ...
    Processing triggers for gnome-menus (3.36.0-1.1ubuntu3) ...
    Processing triggers for mate-menus (1.26.1+mint1) ...
    Processing triggers for libc-bin (2.39-0ubuntu8.5) ...
    Processing triggers for man-db (2.12.0-4build2) ...
    Processing triggers for shared-mime-info (2.4-4) ...
    guru@hp:~$ 
    ```

## Installeer Extension Pack (optioneel)
Het installeren van het [Extension Pack](../../explanations/todo/index.md) is nodig om extra functionaliteit zoals USB 2.0/3.0-ondersteuning, RDP-server, disk-encryptie en PXE boot toe te voegen aan VirtualBox.

=== "guru@hp:~$_"

    ``` title=''
    VERSION=$(VBoxManage --version | cut -d_ -f1) && \
    FILENAME="Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack" && \
    wget -q https://download.virtualbox.org/virtualbox/${VERSION}/${FILENAME} -O /tmp/${FILENAME} && \
    sudo VBoxManage extpack install /tmp/${FILENAME} && \
    rm /tmp/${FILENAME}
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ VERSION=$(VBoxManage --version | cut -d_ -f1) && \
    FILENAME="Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack" && \
    wget -q https://download.virtualbox.org/virtualbox/${VERSION}/${FILENAME} -O /tmp/${FILENAME} && \
    sudo VBoxManage extpack install /tmp/${FILENAME} && \
    rm /tmp/${FILENAME}
    VirtualBox Extension Pack Personal Use and Evaluation License (PUEL)

    License version 11, 21 May 2020

    <cut>

    Do you agree to these license terms and conditions (y/n)? y

    License accepted. For batch installation add
    --accept-license=33d7284dc4a0ece381196fda3cfe2ed0e1e8e7ed7f27b9a9ebc4ee22e24bd23c
    to the VBoxManage command line.

    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Successfully installed "Oracle VM VirtualBox Extension Pack".
    guru@hp:~$ 
    ```

## Maak de Guest Additions ISO beschikbaar (optioneel)
Het voorzien van de [Guest Additions](../../explanations/todo/index.md) in een virtuele machine zorgt voor betere integratie tussen host en gast, zoals naadloze muisaanwijzer, gedeelde klemborden, schermresolutie-aanpassing en gedeelde mappen.

=== "guru@hp:~$_"

    ``` title=''
    sudo apt install virtualbox-guest-additions-iso -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install virtualbox-guest-additions-iso -y
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following package was automatically installed and is no longer required:
      nvidia-firmware-570-570.133.07
    Use 'sudo apt autoremove' to remove it.
    The following NEW packages will be installed:
      virtualbox-guest-additions-iso
    0 upgraded, 1 newly installed, 0 to remove and 3 not upgraded.
    Need to get 39,9 MB of archives.
    After this operation, 53,5 MB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 virtualbox-guest-additions-iso all 7.0.16-1 [39,9 MB]
    Fetched 39,9 MB in 3s (15,0 MB/s)                          
    Selecting previously unselected package virtualbox-guest-additions-iso.
    (Reading database ... 575906 files and directories currently installed.)
    Preparing to unpack .../virtualbox-guest-additions-iso_7.0.16-1_all.deb ...
    Unpacking virtualbox-guest-additions-iso (7.0.16-1) ...
    Setting up virtualbox-guest-additions-iso (7.0.16-1) ...
    guru@hp:~$ 
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