# Install Linux Mint 21

## Boot from USB
=== "Step1"
    Insert the [Linux Mint 21 USB flash drive](../../howtos/linuxmint21-bootable-usb-flash-drive/index.md). Make sure the monitor is "on". Start the PC. In this case (Fujitusu Esprimo PC), press ++f12++ once at the "Fujitsu splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

    <img src="../insert-usb.png" width="320" height="180"/>

=== "Step2"
    You get the "boot menu". Select the USB flash drive to boot from.

    <img src="../boot-menu.png" width="320" height="180"/>

=== "Step3"
    Select the first option at the GRUB menu.

    <img src="../grub-menu.png" width="320" height="180"/>

=== "Step4"
    You're in the live-environment.

    <img src="../live-environment.png" width="320" height="180"/>

## Language/keyboard/codecs
=== "Step1"
    Doubleclick on "Install Linux Mint". Select "English".

    <img src="../english.png" width="320" height="180"/>

=== "Step2"
    Keyboard layout: Belgian/Belgian. Test some characters in the test field.

    <img src="../keyboard.png" width="320" height="180"/>

=== "Step3"
    Install the multimedia codecs.

    <img src="../multimedia-codecs.png" width="320" height="180"/>


## Installation type/partioning
=== "Step1"
    [In UEFI-mode](../windows11-linuxmint21-dual-boot-uefi/something-else.png), the Linux Mint 21.x installer finds the "Windows 11 installation", but for one reason or another (bug?) not in BIOS (non-CSM) mode (in this case). Nevermind. Just select "Something else" (after installation, GRUB will find the "Windows 11 installation" anyway).

    <img src="../windows-not-detected.png" width="320" height="180"/>

=== "Step2"
    Let's manually create partitions. First, select the "free space" at the bottom and click on the + sign. Make sure "Numlock" is active (check the LED, if any). Create a "swap partition" of size 32 GB (32468 MB). Look at the screenshot.

    <img src="../create-32gb-swap.png" width="320" height="180"/>

=== "Step3"
    Again, select the "free space" at the bottom and click on the + sign. Create a "root partition" of size 400 GB (409600 MB).

    <img src="../create-400gb-root.png" width="320" height="180"/>

=== "Step4"
    We still have some free space left. This is for the Clonezilla dump later. Verify that the "Linux boot loader" will be installed on /dev/sda. Click "Install now".

    <img src="../partitioning-done.png" width="320" height="180"/>

=== "Step5"
    I don't know why the installer complains about an EFI partition, as we are booted in BIOS-mode (non-CSM). Bug? Just click "Continue".

    <img src="../no-efi-partition.png" width="320" height="180"/>

=== "Step6"
    Read, comprehend and acknowledge the message.

    <img src="../write-partition-table.png" width="320" height="180"/>

## Installing
=== "Step1"
    In this case, "Brussels" will be suggested as location.

    <img src="../brussels.png" width="320" height="180"/>

=== "Step2"
    Your name: guru. Computer name: lab. Username: guru. Password: guru.

    <img src="../who-are-you.png" width="320" height="180"/>

=== "Step3"
    Enjoy the slideshow.

    <img src="../slideshow.png" width="320" height="180"/>

=== "Step4"
    The installation is finished. Select "Restart Now".

    <img src="../installation-finished.png" width="320" height="180"/>

=== "Step5"
    Remove the USB flash drive and press ++enter++.

    <img src="../remove-installation-medium.png" width="320" height="180"/>

## Finishing
After reboot, you have a menu where you can choose between "Linux Mint 21 Cinnamon" and "Windows Recovery Environment" (this name is not correctly identified, must be a bug?). There is a counter from 10s to 0s. Make your choice in time. By default, "Linux Mint 21 Cinnamon" gets started.

<img src="../grub-linux-windows.png" width="320" height="180"/>