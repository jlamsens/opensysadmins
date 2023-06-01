# Configure BIOS/UEFI

## Turn on the computer
Turn on or restart your computer and watch for a message during the POST about a particular key, usually ++delete++ or a function key like ++f10++ (e.g. HP Z2 PC) that you'll need to press to access the BIOS/UEFI setup utility. It's possible, you won't see such message at all, but a vendor splash screen instead. Consult your hardware manual.

<img src="../1280-720.png" width="320" height="180"/>

## Enter the BIOS Setup Utility
After pressing the correct keyboard command, you'll enter the BIOS Setup Utility. Specifics vary from computer to computer.

<img src="../1280-720.png" width="320" height="180"/>

## Select the boot mode

=== "StepX"
    In this tutorial, we do not use BIOS, but UEFI-mode. For e.g. a "HP Z2 PC", select "Secure Boot Configuration".

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Choose "Legacy Support Disable, Secure Boot Disable".

    <img src="../1280-720.png" width="320" height="180"/>

## Locate the boot order options
Locate the option for changing the boot sequence. Verify that the harddrive is the first boot device.

<img src="../1280-720.png" width="320" height="180"/>

## Wipe the harddisk (if possible)
Some systems make wiping the harddisk possible from BIOS/UEFI(e.g. "HP Z2 PC").

=== "StepX"


=== "StepX"


=== "StepX"


## Save/confirm your changes and exit

## Shutdown
If you could wipe the harddisk, the sytem tries to PXE boot. If you could not, it may or may not boot. Nevermind. We will erase possible partitions in the next steps. Shutdown the PC.