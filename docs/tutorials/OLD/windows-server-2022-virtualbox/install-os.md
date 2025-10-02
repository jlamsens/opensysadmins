# Install OS

## Boot from ISO
=== "Step1"
    Start the virtual machine. If you do nothing, you'll get an interactive shell. If this is the first time you start a virtual machine (in this screenshot example Windows 11), you get the "Auto capture keyboard" and "mouse pointer integration" messages. Read them and then tick the "Do not show this message again" checkboxes.

    <img src="../interactive-shell.png"/>

=== "Step2"
    Close the window and choose "Power off the machine". Start the virtual machine again. This time, you do _not_ get the "Press any key..." prompt. The Windows installer should start immediately. Time & currency format: "Dutch (Belgium)". Keyboard or input method: “Belgian (Period).

    <img src="../install-start.png"/>

## Install now
Notice, you also have a "repair" option here... Choose "Install now".

<img src="../install-now.png"/>

## Select OS
Choose "Windows Server 2022 Standard Evaluation (Desktop Experience)"

<img src="../select-os.png"/>

## License agreement
Accept.

<img src="../accept-license.png"/>

## Type of installation
Select “Custom: Install Microsoft Server Operating System only (advanced)".

<img src="../type-installation.png"/>

## Installation location & partitioning
There are no partitions yet. Click "Next".

<img src="../no-partitions.png"/>

## Installing
=== "Step1"
    Grab a coffee.

    <img src="../installing.png"/>

=== "Step2"
    The VM reboots for the first time. Virtual UEFI/BIOS won't boot of the ISO image, as it finds a Windows installation on the virtual harddrive.

    <img src="../reboot1.png"/>

=== "Step3"
    The VM reboots for the second time.

    <img src="../reboot2.png"/>

## Account
Typ a password for the built-in administrator account: "Admin123" (do not use in a production environment!)

<img src="../password-administrator.png"/>

## Finishing
Done! Notice, that there is no "full screen" possible yet. Later on, we'll install the "virtualbox guest additions" for that.

<img src="../done.png"/>