# Install VirtualBox 6.1.50 on Linux Mint 21

## Prereqs
- a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/index.md){:target="_blank"}/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/index.md){:target="_blank"}) running Linux Mint 21

## Update package list

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt update
    Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
    Get:2 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]                                                        
    Ign:3 https://mirrors-linux-mint.behostings.com/mint virginia InRelease                                                        
    Hit:4 https://mirrors-linux-mint.behostings.com/mint virginia Release                                             
    Hit:6 http://archive.ubuntu.com/ubuntu jammy-backports InRelease                             
    Get:7 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
    Fetched 229 kB in 1s (384 kB/s)    
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    7 packages can be upgraded. Run 'apt list --upgradable' to see them.
    guru@hp:~$ 
    ```

## Check version in repository

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt-cache policy virtualbox
    ```

=== "output"

    ``` title='' hl_lines="4"
    guru@hp:~$ sudo apt-cache policy virtualbox
    virtualbox:
    Installed: (none)
    Candidate: 6.1.50-dfsg-1~ubuntu1.22.04.1
    Version table:
        6.1.50-dfsg-1~ubuntu1.22.04.1 500
            500 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages
        6.1.32-dfsg-1build1 500
            500 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages
    guru@hp:~$ 
    ```

## Install VirtualBox

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install virtualbox
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install virtualbox
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following additional packages will be installed:
      libgsoap-2.8.117 liblzf1 libqt5opengl5 libqt5printsupport5 libqt5x11extras5 libsdl1.2debian libvncserver1 virtualbox-dkms virtualbox-qt
    Suggested packages:
      vde2 virtualbox-guest-additions-iso
    The following NEW packages will be installed:
      libgsoap-2.8.117 liblzf1 libqt5opengl5 libqt5printsupport5 libqt5x11extras5 libsdl1.2debian libvncserver1 virtualbox virtualbox-dkms virtualbox-qt
    0 upgraded, 10 newly installed, 0 to remove and 7 not upgraded.
    Need to get 47,1 MB of archives.
    After this operation, 182 MB of additional disk space will be used.
    Do you want to continue? [Y/n] y
    Get:1 http://archive.ubuntu.com/ubuntu jammy/universe amd64 libgsoap-2.8.117 amd64 2.8.117-2build1 [269 kB]
    Get:2 http://archive.ubuntu.com/ubuntu jammy/universe amd64 liblzf1 amd64 3.6-3 [7.444 B]
    Get:3 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libqt5opengl5 amd64 5.15.3+dfsg-2ubuntu0.2 [153 kB]
    Get:4 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libqt5printsupport5 amd64 5.15.3+dfsg-2ubuntu0.2 [214 kB]
    Get:5 http://archive.ubuntu.com/ubuntu jammy/universe amd64 libqt5x11extras5 amd64 5.15.3-1 [10,9 kB]
    Get:6 http://archive.ubuntu.com/ubuntu jammy/universe amd64 libsdl1.2debian amd64 1.2.15+dfsg2-6 [177 kB]
    Get:7 http://archive.ubuntu.com/ubuntu jammy/main amd64 libvncserver1 amd64 0.9.13+dfsg-3build2 [131 kB]
    Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 virtualbox-dkms amd64 6.1.50-dfsg-1~ubuntu1.22.04.1 [722 kB]
    Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 virtualbox amd64 6.1.50-dfsg-1~ubuntu1.22.04.1 [23,3 MB]
    Get:10 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 virtualbox-qt amd64 6.1.50-dfsg-1~ubuntu1.22.04.1 [22,1 MB]
    Fetched 47,1 MB in 3s (18,3 MB/s)         
    Selecting previously unselected package libgsoap-2.8.117:amd64.
    (Reading database ... 565027 files and directories currently installed.)
    Preparing to unpack .../0-libgsoap-2.8.117_2.8.117-2build1_amd64.deb ...
    Unpacking libgsoap-2.8.117:amd64 (2.8.117-2build1) ...
    Selecting previously unselected package liblzf1:amd64.
    Preparing to unpack .../1-liblzf1_3.6-3_amd64.deb ...
    Unpacking liblzf1:amd64 (3.6-3) ...
    Selecting previously unselected package libqt5opengl5:amd64.
    Preparing to unpack .../2-libqt5opengl5_5.15.3+dfsg-2ubuntu0.2_amd64.deb ...
    Unpacking libqt5opengl5:amd64 (5.15.3+dfsg-2ubuntu0.2) ...
    Selecting previously unselected package libqt5printsupport5:amd64.
    Preparing to unpack .../3-libqt5printsupport5_5.15.3+dfsg-2ubuntu0.2_amd64.deb ...
    Unpacking libqt5printsupport5:amd64 (5.15.3+dfsg-2ubuntu0.2) ...
    Selecting previously unselected package libqt5x11extras5:amd64.
    Preparing to unpack .../4-libqt5x11extras5_5.15.3-1_amd64.deb ...
    Unpacking libqt5x11extras5:amd64 (5.15.3-1) ...
    Selecting previously unselected package libsdl1.2debian:amd64.
    Preparing to unpack .../5-libsdl1.2debian_1.2.15+dfsg2-6_amd64.deb ...
    Unpacking libsdl1.2debian:amd64 (1.2.15+dfsg2-6) ...
    Selecting previously unselected package libvncserver1:amd64.
    Preparing to unpack .../6-libvncserver1_0.9.13+dfsg-3build2_amd64.deb ...
    Unpacking libvncserver1:amd64 (0.9.13+dfsg-3build2) ...
    Selecting previously unselected package virtualbox-dkms.
    Preparing to unpack .../7-virtualbox-dkms_6.1.50-dfsg-1~ubuntu1.22.04.1_amd64.deb ...
    Unpacking virtualbox-dkms (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Selecting previously unselected package virtualbox.
    Preparing to unpack .../8-virtualbox_6.1.50-dfsg-1~ubuntu1.22.04.1_amd64.deb ...
    Unpacking virtualbox (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Selecting previously unselected package virtualbox-qt.
    Preparing to unpack .../9-virtualbox-qt_6.1.50-dfsg-1~ubuntu1.22.04.1_amd64.deb ...
    Unpacking virtualbox-qt (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Setting up libqt5x11extras5:amd64 (5.15.3-1) ...
    Setting up libgsoap-2.8.117:amd64 (2.8.117-2build1) ...
    Setting up libvncserver1:amd64 (0.9.13+dfsg-3build2) ...
    Setting up libqt5printsupport5:amd64 (5.15.3+dfsg-2ubuntu0.2) ...
    Setting up liblzf1:amd64 (3.6-3) ...
    Setting up libsdl1.2debian:amd64 (1.2.15+dfsg2-6) ...
    Setting up libqt5opengl5:amd64 (5.15.3+dfsg-2ubuntu0.2) ...
    Setting up virtualbox-dkms (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Loading new virtualbox-6.1.50 DKMS files...
    Building for 5.15.0-101-generic
    Building initial module for 5.15.0-101-generic
    Secure Boot not enabled on this system.
    Done.

    vboxdrv.ko:
    Running module version sanity check.
    - Original module
    - No original module exists within this kernel
    - Installation
    - Installing to /lib/modules/5.15.0-101-generic/updates/dkms/

    vboxnetadp.ko:
    Running module version sanity check.
    - Original module
    - No original module exists within this kernel
    - Installation
    - Installing to /lib/modules/5.15.0-101-generic/updates/dkms/

    vboxnetflt.ko:
    Running module version sanity check.
    - Original module
    - No original module exists within this kernel
    - Installation
    - Installing to /lib/modules/5.15.0-101-generic/updates/dkms/

    depmod...
    Setting up virtualbox (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Setting up virtualbox-qt (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
    Processing triggers for desktop-file-utils (0.26+mint3+victoria) ...
    Processing triggers for hicolor-icon-theme (0.17-2) ...
    Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
    Processing triggers for libc-bin (2.35-0ubuntu3.6) ...
    Processing triggers for man-db (2.10.2-1) ...
    Processing triggers for shared-mime-info (2.1-2) ...
    ```

## Install extension pack
VirtualBox requires an extension pack to provide support for Remote Desktop Protocol, USB 2.0, PXE booting for Intel network cards, ...

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install virtualbox-ext-pack
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install virtualbox-ext-pack
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      virtualbox-ext-pack
    0 upgraded, 1 newly installed, 0 to remove and 7 not upgraded.
    Need to get 10,7 kB of archives.
    After this operation, 143 kB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 virtualbox-ext-pack all 6.1.50-1~ubuntu1.22.04.1 [10,7 kB]
    Fetched 10,7 kB in 0s (94,5 kB/s)             
    Preconfiguring packages ...
    Selecting previously unselected package virtualbox-ext-pack.
    (Reading database ... 565724 files and directories currently installed.)
    Preparing to unpack .../virtualbox-ext-pack_6.1.50-1~ubuntu1.22.04.1_all.deb ...
    License has already been accepted.
    Unpacking virtualbox-ext-pack (6.1.50-1~ubuntu1.22.04.1) ...
    Setting up virtualbox-ext-pack (6.1.50-1~ubuntu1.22.04.1) ...
    virtualbox-ext-pack: downloading: https://download.virtualbox.org/virtualbox/6.1.50/Oracle_VM_VirtualBox_Extension_Pack-6.1.50.vbox-extpack
    The file will be downloaded into /usr/share/virtualbox-ext-pack
    License accepted.
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Successfully installed "Oracle VM VirtualBox Extension Pack".
    ```

## Install guest additions
The "VirtualBox Guest Additions" package provides an iso image which contains the guest additions for Linux, Solaris and Windows to be installed on the host system. The guest systems then can mount the iso and install the guest additions from there.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install virtualbox-guest-additions-iso
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install virtualbox-guest-additions-iso
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      virtualbox-guest-additions-iso
    0 upgraded, 1 newly installed, 0 to remove and 7 not upgraded.
    Need to get 48,1 MB of archives.
    After this operation, 64,1 MB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 virtualbox-guest-additions-iso all 6.1.50-1~ubuntu1.22.04.1 [48,1 MB]
    Fetched 48,1 MB in 2s (25,6 MB/s)                         
    Selecting previously unselected package virtualbox-guest-additions-iso.
    (Reading database ... 565729 files and directories currently installed.)
    Preparing to unpack .../virtualbox-guest-additions-iso_6.1.50-1~ubuntu1.22.04.1_all.deb ...
    Unpacking virtualbox-guest-additions-iso (6.1.50-1~ubuntu1.22.04.1) ...
    Setting up virtualbox-guest-additions-iso (6.1.50-1~ubuntu1.22.04.1) ...
    guru@hp:~$ 
    ```

## Start VirtualBox
Select "Menu" and start typing "vir". Start "Oracle VM VirtualBox".

<img src="menu-virtualbox.png" width="320" height="180"/>
