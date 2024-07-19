# VirtualBox guru meditation

## Situation

=== "Step1"
    You are running Linux Mint 21 kernel 5.15.0-113

    <img src="../virtualbox6-guru-meditation-setup.png"/>

=== "Step2"
    You have the most recent VirtualBox 1.6.50 installed from the Linux Mint 21 repository that can run virtual machines.

    <img src="../virtualbox6-guru-meditation-workingvm.png"/>

=== "Step3"
    There is a new kernel 5.15.0-116 available, that you install.

    <img src="../virtualbox6-guru-meditation-installingkernel.png"/>
   

=== "Step4"
    VirtualBox modules get compiled/installed successfully.
    
    <img src="../virtualbox6-guru-meditation-dkms-virtualbox.png"/>

## Problem

=== "Step1"
    Once rebooted with that new 5.15.0-116 kernel, things go wrong when installing/operating VMs.
    
    <img src="../virtualbox6-guru-meditation-error.png"/>

=== "Step2"
    The log is giving you a "Guru Meditation" error.
    
    <img src="../virtualbox6-guru-meditation-errorlog.png"/>


## Solution1: use previous kernel

=== "Step1"
    Do a cold start of Linux Mint 21 and hit the ++escape++ button to get the GRUB menu. Select "Advanced options..."
    
    <img src="../virtualbox6-guru-meditation-grub-advanced-options.png"/>

=== "Step2"
    Select the previous working kernel 5.15.0-113.
    
    <img src="../virtualbox6-guru-meditation-grub-previous-kernel.png"/>

=== "Step3"
    Once booted into Linux Mint 21 with the old kernel, let's remove the newer kernel. Go to the Mint menu -> Update Manager -> View -> Linux kernels. Select 5.15.0-116 and hit `Remove`.
    
    <img src="../virtualbox6-guru-meditation-remove-kernel.png"/>

=== "Step4"
    Click on `Details` to see what's happening.
    
    <img src="../virtualbox6-guru-meditation-removing-kernel.png"/>

=== "Step5"
    After removing the kernel, it will become available again for installation. Right-click -> Ignore the current update for this package. That kernel will not be installed anymore.
    
    <img src="../virtualbox6-guru-meditation-ignore-kernel.png"/>

=== "Step6"
    Check the blocked package using Update Manager -> Edit -> Preferences -> Packages.
    
    <img src="../virtualbox6-guru-meditation-block-kernel.png"/>

=== "Step7"
    Reboot Linux Mint 21. It will use the old 5.15.0-113 kernel again. Enjoy working VMs.
    
    <img src="../virtualbox6-guru-meditation-workingvm.png"/>


## Solution2: install VirtualBox 7.0.20

### Check the installed packages of VirtualBox 6.1.50

=== "guru@lab:~$_"
    
    ``` title='' hl_lines="0"
    dpkg -l | grep -i virtualbox
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ dpkg -l | grep -i virtualbox
    ii  virtualbox                                 6.1.50-dfsg-1~ubuntu1.22.04.1       amd64        x86 virtualization solution - base binaries
    ii  virtualbox-dkms                            6.1.50-dfsg-1~ubuntu1.22.04.1       amd64        x86 virtualization solution - kernel module sources for dkms
    ii  virtualbox-ext-pack                        6.1.50-1~ubuntu1.22.04.1            all          extra capabilities for VirtualBox, downloader.
    ii  virtualbox-guest-additions-iso             6.1.50-1~ubuntu1.22.04.1            all          guest additions iso image for VirtualBox
    ii  virtualbox-qt                              6.1.50-dfsg-1~ubuntu1.22.04.1       amd64        x86 virtualization solution - Qt based user interface
    guru@lab:~$ 
    ```

### Remove those packages

=== "guru@lab:~$_"
    
    ``` title='' hl_lines="0"
    sudo apt purge virtualbox* -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo apt purge virtualbox* -y
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Note, selecting 'virtualbox-ext-pack' for glob 'virtualbox*'
    Note, selecting 'virtualbox' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-x11' for glob 'virtualbox*'
    Note, selecting 'virtualbox-ose' for glob 'virtualbox*'
    Note, selecting 'virtualbox-ose-fuse' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-additions-iso' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-modules' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-utils' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-utils-hwe' for glob 'virtualbox*'
    Note, selecting 'virtualbox-guest-x11-hwe' for glob 'virtualbox*'
    Note, selecting 'virtualbox-modules' for glob 'virtualbox*'
    Note, selecting 'virtualbox-qt' for glob 'virtualbox*'
    Note, selecting 'virtualbox-2.0' for glob 'virtualbox*'
    Note, selecting 'virtualbox-2.1' for glob 'virtualbox*'
    Note, selecting 'virtualbox-2.2' for glob 'virtualbox*'
    Note, selecting 'virtualbox-3.0' for glob 'virtualbox*'
    Note, selecting 'virtualbox-3.1' for glob 'virtualbox*'
    Note, selecting 'virtualbox-3.2' for glob 'virtualbox*'
    Note, selecting 'virtualbox-4.0' for glob 'virtualbox*'
    Note, selecting 'virtualbox-4.1' for glob 'virtualbox*'
    Note, selecting 'virtualbox-4.2' for glob 'virtualbox*'
    Note, selecting 'virtualbox-4.3' for glob 'virtualbox*'
    Note, selecting 'virtualbox-5.0' for glob 'virtualbox*'
    Note, selecting 'virtualbox-5.1' for glob 'virtualbox*'
    Note, selecting 'virtualbox-5.2' for glob 'virtualbox*'
    Note, selecting 'virtualbox-6.0' for glob 'virtualbox*'
    Note, selecting 'virtualbox-6.1' for glob 'virtualbox*'
    Note, selecting 'virtualbox-source' for glob 'virtualbox*'
    Note, selecting 'virtualbox-dkms' for glob 'virtualbox*'
    Package 'virtualbox-ose' is not installed, so not removed
    Package 'virtualbox-ose-fuse' is not installed, so not removed
    Package 'virtualbox-6.1' is not installed, so not removed
    Package 'virtualbox-6.0' is not installed, so not removed
    Package 'virtualbox-5.2' is not installed, so not removed
    Package 'virtualbox-5.1' is not installed, so not removed
    Package 'virtualbox-5.0' is not installed, so not removed
    Note, selecting 'virtualbox-dkms' instead of 'virtualbox-modules'
    Package 'virtualbox-2.0' is not installed, so not removed
    Package 'virtualbox-2.1' is not installed, so not removed
    Package 'virtualbox-2.2' is not installed, so not removed
    Package 'virtualbox-3.0' is not installed, so not removed
    Package 'virtualbox-3.1' is not installed, so not removed
    Package 'virtualbox-3.2' is not installed, so not removed
    Package 'virtualbox-4.0' is not installed, so not removed
    Package 'virtualbox-4.1' is not installed, so not removed
    Package 'virtualbox-4.2' is not installed, so not removed
    Package 'virtualbox-4.3' is not installed, so not removed
    Package 'virtualbox-guest-utils' is not installed, so not removed
    Package 'virtualbox-guest-utils-hwe' is not installed, so not removed
    Package 'virtualbox-guest-x11' is not installed, so not removed
    Package 'virtualbox-guest-x11-hwe' is not installed, so not removed
    Package 'virtualbox-source' is not installed, so not removed
    The following packages were automatically installed and are no longer required:
    libgsoap-2.8.117 liblzf1 libqt5opengl5 libqt5printsupport5 libqt5x11extras5 libsdl1.2debian libvncserver1
    Use 'sudo apt autoremove' to remove them.
    The following packages will be REMOVED:
    virtualbox* virtualbox-dkms* virtualbox-ext-pack* virtualbox-guest-additions-iso* virtualbox-qt*
    0 upgraded, 0 newly installed, 5 to remove and 0 not upgraded.
    After this operation, 242 MB disk space will be freed.
    (Reading database ... 565959 files and directories currently installed.)
    Removing virtualbox-qt (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Removing virtualbox-ext-pack (6.1.50-1~ubuntu1.22.04.1) ...
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Successfully uninstalled "Oracle VM VirtualBox Extension Pack".
    Successfully performed extension pack cleanup
    Removing virtualbox (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Removing virtualbox-dkms (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    Module virtualbox-6.1.50 for kernel 5.15.0-113-generic (x86_64).
    Before uninstall, this module version was ACTIVE on this kernel.

    vboxdrv.ko:
    - Uninstallation
    - Deleting from: /lib/modules/5.15.0-113-generic/updates/dkms/
    - Original module
    - No original module was found for this module on this kernel.
    - Use the dkms install command to reinstall any previous module version.


    vboxnetadp.ko:
    - Uninstallation
    - Deleting from: /lib/modules/5.15.0-113-generic/updates/dkms/
    - Original module
    - No original module was found for this module on this kernel.
    - Use the dkms install command to reinstall any previous module version.


    vboxnetflt.ko:
    - Uninstallation
    - Deleting from: /lib/modules/5.15.0-113-generic/updates/dkms/
    - Original module
    - No original module was found for this module on this kernel.
    - Use the dkms install command to reinstall any previous module version.

    depmod....
    Deleting module virtualbox-6.1.50 completely from the DKMS tree.
    Removing virtualbox-guest-additions-iso (6.1.50-1~ubuntu1.22.04.1) ...
    Processing triggers for hicolor-icon-theme (0.17-2) ...
    Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
    Processing triggers for man-db (2.10.2-1) ...
    Processing triggers for shared-mime-info (2.1-2) ...
    Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
    Processing triggers for desktop-file-utils (0.26+mint3+victoria) ...
    (Reading database ... 565306 files and directories currently installed.)
    Purging configuration files for virtualbox-ext-pack (6.1.50-1~ubuntu1.22.04.1) ...
    Purging configuration files for virtualbox (6.1.50-dfsg-1~ubuntu1.22.04.1) ...
    guru@lab:~$ 
    ```

### Install VirtualBox 7.0.20

Use the howto [Install VirtualBox 7 on Linux Mint 21](../../howtos/install-virtualbox7-linux-mint21/index.md)


## Solution3: use kernel 6.5.0-44

=== "Step1"
    Go to the Mint menu -> Update Manager -> View -> Linux kernels. The newest kernel 6.8.0-35 (at the time of writing) does not work for VirtualBox 6.1.50
    
    <img src="../virtualbox6-guru-meditation-68kernel-error.png"/>

=== "Step2"
    The latest 6.5 branch, version 6.5.0-44 *does* work. Let's install it.
    
    <img src="../virtualbox6-guru-meditation-65kernel.png"/>

=== "Step3"
    No errors here.
    
    <img src="../virtualbox6-guru-meditation-65kernel-working.png"/>

=== "Step4"
    Reboot Linux Mint 21. It will use the new 6.5.0-44 kernel by default. Enjoy working VMs.
    
    <img src="../virtualbox6-guru-meditation-workingvm.png"/>