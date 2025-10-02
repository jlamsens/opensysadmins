# Configure BIOS/UEFI

## Turn on the computer
Start the PC. In this case (HP Z2 PC), press ++f10++ once at the "HP splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

<img src="../vendor-splash.png" width="706"/>

## Enter the BIOS/UEFI Setup Utility
After pressing the correct keyboard command, you'll enter the BIOS/UEFI Setup Utility.

<img src="../bios-uefi-utility.png" width="706"/>

## Wipe the harddisk (if possible)
Some systems make wiping the harddisk possible from BIOS/UEFI (e.g. "HP Z2 PC").

=== "Step1"
    Select tab "Security -> Hard Drive Utilities".

    <img src="../security-hd-utilities.png" width="706"/>

=== "Step2"
    Select "Secure Erase".

    <img src="../security-secure-erase.png" width="706"/>

=== "Step3"
    Confirm your drive.

    <img src="../secure-erase-select-drive.png" width="706"/>

=== "Step4"
    Read and comprehend the message. Choose "Secure Erase (Format NVM) Clear" in this case.

    <img src="../secure-erase-clear-drive.png" width="706"/>

=== "Step5"
    Confirm.

    <img src="../secure-erase-confirm.png" width="706"/>

=== "Step6"
    Confirm again.

    <img src="../secure-erase-confirm2.png" width="706"/>

=== "Step7"
    The wipe completes successfully. Press ++esc++.

    <img src="../secure-erase-done.png" width="706"/>

## Select the boot mode

=== "Step1"
    In this tutorial, we do not use BIOS, but UEFI-mode. For e.g. a "HP Z2 PC", select "Advanced -> Secure Boot Configuration".

    <img src="../secure-boot-configuration.png" width="706"/>

=== "Step2"
    Make sure "Legacy Support Disable, Secure Boot Disable" is selected.

    <img src="../legacy-disable-secureboot-disable.png" width="706"/>

## Save/confirm your changes and exit
Exit the utility using ++esc++ and save changes - if any.

<img src="../exit-save-changes.png" width="706"/>

## Shutdown
If you could wipe the harddisk, the sytem tries to PXE boot (and it will fail, that's expected). If you could not wipe the harddisk, it may or may not boot (depending on whether an OS is present or not). Nevermind. We will eventually erase possible partitions in the next steps. Shutdown the PC by pressing the "power button" long enough.

<img src="../pxe-boot.png" width="706"/>