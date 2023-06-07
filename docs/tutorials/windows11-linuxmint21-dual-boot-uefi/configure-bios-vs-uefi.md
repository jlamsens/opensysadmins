# Configure BIOS/UEFI

## Turn on the computer
Turn on or restart your computer and watch for a message during the POST about a particular key, usually ++delete++ or a function key like ++f10++ (e.g. HP Z2 PC) that you'll need to press to access the BIOS/UEFI setup utility. It's possible, you won't see such message at all, but a vendor splash screen instead.

<img src="../vendor-splash.png" width="320" height="180"/>

## Enter the BIOS/UEFI Setup Utility
After pressing the correct keyboard command, you'll enter the BIOS/UEFI Setup Utility.

<img src="../bios-uefi-utility.png" width="320" height="180"/>

## Wipe the harddisk (if possible)
Some systems make wiping the harddisk possible from BIOS/UEFI (e.g. "HP Z2 PC").

=== "Step1"
    Select tab "Security -> Hard Drive Utilities".

    <img src="../security-hd-utilities.png" width="320" height="180"/>

=== "Step2"
    Select "Secure Erase".

    <img src="../security-secure-erase.png" width="320" height="180"/>

=== "Step3"
    Confirm your drive.

    <img src="../secure-erase-select-drive.png" width="320" height="180"/>

=== "Step4"
    Read and comprehend the message. Choose "Secure Erase (Format NVM) Clear" in this case.

    <img src="../secure-erase-clear-drive.png" width="320" height="180"/>

=== "Step5"
    Confirm.

    <img src="../secure-erase-confirm.png" width="320" height="180"/>

=== "Step6"
    Confirm again.

    <img src="../secure-erase-confirm2.png" width="320" height="180"/>

=== "Step7"
    The wipe completes successfully.

    <img src="../secure-erase-done.png" width="320" height="180"/>

## Select the boot mode

=== "Step1"
    In this tutorial, we do not use BIOS, but UEFI-mode. For e.g. a "HP Z2 PC", select "Advanced -> Secure Boot Configuration".

    <img src="../secure-boot-configuration.png" width="320" height="180"/>

=== "Step2"
    Choose "Legacy Support Disable, Secure Boot Disable".

    <img src="../legacy-disable-secureboot-disable.png" width="320" height="180"/>

## Save/confirm your changes and exit
Exit the utility using ++esc++ and save changes.

<img src="../exit-save-changes.png" width="320" height="180"/>

## Shutdown
If you could wipe the harddisk, the sytem tries to PXE boot. If you could not, it may or may not boot. Nevermind. We will eventually erase possible partitions in the next steps. Shutdown the PC by pressing the "power button".

<img src="../pxe-boot.png" width="320" height="180"/>