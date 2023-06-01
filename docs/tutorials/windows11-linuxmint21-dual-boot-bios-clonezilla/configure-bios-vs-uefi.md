# Configure BIOS/UEFI

## Turn on the computer
Turn on or restart your computer and watch for a message during the POST about a particular key, usually ++delete++ or a function key like ++f2++ (e.g. Fujitsu Esprimo PC) that you'll need to press to access the BIOS/UEFI setup utility. It's possible, you won't see such message at all, but a vendor splash screen instead. Consult your hardware manual.

<img src="../../../images/tutorials/lab-pc/1280-720.png" width="320" height="180"/>

## Enter the BIOS Setup Utility
After pressing the correct keyboard command (in this case ...), you'll enter the BIOS Setup Utility. Specifics vary from computer to computer.

<img src="../../../images/tutorials/lab-pc/1280-720.png" width="320" height="180"/>

## Select the boot mode
In this tutorial, we do not use UEFI, but BIOS-mode. Locate the option for enabling BIOS-compatible start mode (CSM or legacy mode).

<img src="../../../images/tutorials/lab-pc/1280-720.png" width="320" height="180"/>

## Locate the boot order options
Locate the option for changing the boot sequence. Verify that the harddrive is the first boot device.

<img src="../../../images/tutorials/lab-pc/1280-720.png" width="320" height="180"/>

## Save/confirm your changes and exit
If the harddrive was empty, the system won't boot. If it contained an operating system, it's possible it won't boot, but there is a chance it will boot.
Nevermind. We will wipe the harddisk in the next steps.