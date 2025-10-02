# Configure BIOS/UEFI

## Turn on the computer
Turn on or restart your computer and watch for a message during the POST about a particular key, usually ++delete++ or a function key like ++f2++ (e.g. Fujitsu Esprimo PC) that you'll need to press to access the BIOS/UEFI setup utility. It's possible, you won't see such message at all, but a vendor splash screen instead. Specifics vary from computer to computer. Consult your hardware manual.

<img src="../vendor-splash.png" width="320" height="180"/>

## Enter the BIOS/UEFI Setup Utility
After pressing the correct keyboard command, you'll enter the BIOS/UEFI Setup Utility.

<img src="../bios-uefi-utility.png" width="320" height="180"/>

## Select the boot mode

=== "Step1"
    In this tutorial, we do not use UEFI, but BIOS-mode. For e.g. a "Fujitsu Esprimo PC", select "Boot-> CSM Configuration".

    <img src="../boot-csm-configuration.png" width="320" height="180"/>

=== "Step2"
    Make sure "Launch CSM" is _enabled_ and configure _Legacy only_ for all options.

    <img src="../csm-legacy-only.png" width="320" height="180"/>

## Secure boot

=== "Step1"
    Navigate to "Security -> Secure boot".

    <img src="../security-secureboot.png" width="320" height="180"/>

=== "Step2"
    Make sure "secure boot" is disabled.

    <img src="../disable-secureboot.png" width="320" height="180"/>

## Save/confirm your changes and exit
Exit the utility and save changes.

<img src="../exit-save-changes.png" width="320" height="180"/>

## Shutdown
If there _is_ an operating system on the harddisk, it may or may not boot. If there is no operating system on the the harddisk, the sytem tries to PXE boot. Anyway, shutdown the PC by pressing the "power button".

<img src="../pxe-boot.png" width="320" height="180"/>