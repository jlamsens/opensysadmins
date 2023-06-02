# Install Linux Mint 21

## Boot from USB
=== "Step"
    Insert the [Linux Mint 21 USB flash drive](../../howtos/linuxmint21-bootable-usb-flash-drive/index.md). Make sure both monitors are "on". Start the PC. In this case (HP Z4 PC), press ++f9++ once at the "HP splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

    <img src="../press-f9.png" width="320" height="180"/>

=== "Step"
    You get the "boot menu". Select the USB flash drive to boot from.

    <img src="../boot-menu.png" width="320" height="180"/>

=== "Step"
    Select the first option at the GRUB menu.

    <img src="../grub-menu.png" width="320" height="180"/>

=== "Step"
    You're in the live-environment. In this case, both monitors are active. Possibly not configured correctly. This is for later.

    <img src="../live-environment.png" width="320" height="180"/>

## Language/keyboard/codecs
=== "Step"
    Doubleclick on "Install Linux Mint". Select "English".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Keyboard layout: Belgian/Belgian. Test some characters in the test field.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Install the multimedia codecs.

    <img src="../1280-720.png" width="320" height="180"/>


## Installation type/partioning
=== "Step"
    You could perfectly choose for option1, but let's choose "Something else".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Let's manually create partitions. First, select the "free space" at the bottom and click on the + sign.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Make sure "Numlock" is active (check the LED, if any). Create a "swap partition" of size 16 GB (16384 MB). Look at the screenshot.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Again, select the "free space" at the bottom and click on the + sign. Create a "root partition" with the remaining disk space.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Verify that the "Linux boot loader" will be installed on /dev/nvme0n1. Click "Install now".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Read, comprehend and acknowledge the message.

    <img src="../1280-720.png" width="320" height="180"/>

## Installing
=== "Step"
    In this case, "Brussels" will be suggested as location.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Your name: guru. Computer name: pc. Username: guru. Password: guru.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Enjoy the slideshow.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    The installation is finished. Select "Restart Now".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Remove the USB flash drive and press ++enter++.

    <img src="../1280-720.png" width="320" height="180"/>

## End result
After reboot, you have a menu where you can choose between "Linux Mint 21 Cinnamon" and "Windows Boot Manager" (=Windows 11).
There is a counter from 10s to 0s. Make your choice in time. By default, "Linux Mint 21 Cinnamon" gets started.

<img src="../1280-720.png" width="320" height="180"/>