# Install Linux Mint 21

## Boot from USB
=== "Step1"
    Insert the [Linux Mint 21 USB flash drive](../../howtos/linuxmint21-bootable-usb-flash-drive/index.md){:target="_blank"}. Make sure both monitors are "on". Start the PC. In this case (HP Z2 PC), press ++f9++ once at the "HP splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

    <img src="../insert-usb.png" width="706"/>

=== "Step2"
    You get the "boot menu". Select the USB flash drive to boot from.

    <img src="../boot-menu-linux.png" width="706"/>

=== "Step3"
    Select the first option at the GRUB menu.

    <img src="../grub-menu.png" width="706"/>

=== "Step4"
    You're in the live-environment. In this case, both monitors are active. Possibly not configured correctly. This is for later.

    !!! danger "Note VDAB students"
        For easier navigation, you could follow further instructions using Firefox in this live-environment, instead of on your smartphone.
        Just navigate to opensysadmins.com -> Tutorials -> Install a Windows 11 and Linux Mint 21 dual boot PC (UEFI) -> Install Linux Mint 21.

    <img src="../live-environment.png" width="706"/>

## Language/keyboard/codecs
=== "Step1"
    Doubleclick on "Install Linux Mint". Select "English".

    <img src="../english.png" width="706"/>

=== "Step2"
    Keyboard layout: Belgian/Belgian. Test some characters in the test field.

    <img src="../keyboard.png" width="706"/>

=== "Step3"
    Install the multimedia codecs.

    <img src="../multimedia-codecs.png" width="706"/>


## Installation type/partioning
=== "Step1"
    You could perfectly choose for option1, but let's choose "Something else".

    <img src="../something-else.png" width="706"/>

=== "Step2"
    Let's manually create partitions. First, select the "free space" at the bottom and click on the + sign.

    <img src="../freespace1.png" width="706"/>

=== "Step3"
    Make sure "Numlock" is active (check the LED, if any). Create a "swap partition" of size 16 GB (16384 MB). Look at the screenshot.

    <img src="../swap-partition.png" width="706"/>

=== "Step4"
    Again, select the "free space" at the bottom and click on the + sign. Create a "root partition" with the remaining disk space. In my case that is 431303 MB. The remaining disk space can be different on your system!

    <img src="../freespace2.png" width="706"/>

=== "Step5"
    Verify that the "Linux boot loader" will be installed on /dev/nvme0n1. Click "Install now".

    <img src="../boot-loader.png" width="706"/>

=== "Step6"
    Read, comprehend and acknowledge the message.

    <img src="../partition-table.png" width="706"/>

## Installing
=== "Step1"
    In this case, "Brussels" will be suggested as location.

    <img src="../brussels.png" width="706"/>

=== "Step2"
    Your name: guru. Computer name: hp. Username: guru. Password: guru.

    <img src="../who-are-you.png" width="706"/>

=== "Step3"
    Enjoy the slideshow.

    <img src="../slideshow.png" width="706"/>

=== "Step4"
    The installation is finished. Select "Restart Now".

    <img src="../installation-finished.png" width="706"/>

=== "Step5"
    Remove the USB flash drive and press ++enter++

    <img src="../remove-installation-medium.png" width="706"/>

## Finishing
After reboot, you have a menu where you can choose between "Linux Mint 21 Cinnamon" and "Windows Boot Manager" (=Windows 11).
There is a counter from 10s to 0s. Make your choice in time. By default, "Linux Mint 21 Cinnamon" gets started.

<img src="../grub-linux-windows.png" width="706"/>