# Install Windows 11

## Boot from USB
=== "Step1"
    Insert the [Windows 11 USB flash drive](../../howtos/windows11-bootable-usb-flash-drive/index.md){:target="_blank"}. Make sure both monitors are "on". Start the PC. In this case (HP Z4 PC), press ++f9++ once at the "HP splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

    <img src="../insert-usb.png" width="706"/>

=== "Step2"
    You get the "boot menu". Select the USB flash drive to boot from.

    <img src="../boot-menu-windows.png" width="706"/>

## Time and currency format
Dutch (Belgium). Keyboard or input method: “Belgian (Period).

<img src="../time-currency.png" width="706"/>

## Install now
Notice, you also have a "repair" option here... Choose "Install now".

<img src="../install-now.png" width="706"/>

## License agreement
Accept.

<img src="../accept-license.png" width="706"/>

## Type of installation
Select “Custom: Install Windows only (advanced)".

<img src="../custom-install.png" width="706"/>

## Installation location & partitioning

=== "Step1"
    If you were able to do a [secure erase](configure-bios-vs-uefi.md#wipe-the-harddisk-if-possible){:target="_blank"} in BIOS/UEFI, there are no partitions. If not, delete all partitions manually.

    <img src="../installation-location.png" width="706"/>

=== "Step2"
    Make sure "Num Lock" is activated on your keyboard. Check the LED if possible. Select "New" and create a partition of 60 GB (61440 MB) and click "apply".

    <img src="../partition-60gb.png" width="706"/>

=== "Step3"
    Read and comprehend the message.

    <img src="../additional-partitions.png" width="706"/>

=== "Step4"
    Windows creates additional partitions. Notice, there is some "Unallocated space" left. This is for the Linux installation later on.
    Select "Drive 0 Partition 3" for the Windows installation.

    <img src="../windows-location.png" width="706"/>

## Installing

=== "Step1"
    Grab a coffee.

    <img src="../installing-windows.png" width="706"/>

=== "Step2"
    The PC reboots for the first time. UEFI/BIOS won't boot of the USB flash drive, as it finds a Windows installation on the (hard)drive.

    <img src="../reboot1.png" width="706"/>

## Keyboard and network

=== "Step1"
    Personal preference here. I select "Belgium".

    <img src="../country-region.png" width="706"/>

=== "Step2"
    Personal preference here. I select "Belgian (Period)".

    <img src="../belgian-period.png" width="706"/>

=== "Step3"
    Select "Skip"

    <img src="../second-keyboard-layout.png" width="706"/>

=== "Step4"
    Windows reboots for the 2nd time.

    <img src="../reboot2-3.png" width="706"/>

=== "Step5"
    The presence or absence of the "Let's connect you to a network" screen during the installation of Windows 11 23H2 can depend on various factors. If you get this screen, choose "Next".

    <img src="../connect-network.png" width="706"/>

## Account

=== "Step1"
    Select "sign-in options".

    <img src="../sign-in-options.png" width="706"/>

=== "Step2"
    Select "Domain join instead".

    <img src="../domain-join.png" width="706"/>

=== "Step3"
    Login: guru

    <img src="../login.png" width="706"/>

=== "Step4"
    Password: guru

    <img src="../password.png" width="706"/>

=== "Step5"
    Acknowlege the password: guru

    <img src="../password-acknowledge.png" width="706"/>

=== "Step6"
    Security question1: Doggy

    <img src="../security-question1.png" width="706"/>

=== "Step7"
    Security question2: Wevelgem

    <img src="../security-question2.png" width="706"/>

=== "Step8"
    Security question3: IT guru

    <img src="../security-question3.png" width="706"/>


## Finishing

=== "Step1"
    Location-based experiences: no.

    <img src="../location.png" width="706"/>

=== "Step2"
    Find my device: no.

    <img src="../find.png" width="706"/>

=== "Step3"
    Send diagnostic data: Required only.

    <img src="../stats.png" width="706"/>

=== "Step4"
    Improving inking & typing: no.

    <img src="../inking-typing.png" width="706"/>

=== "Step5"
    Get tailored experiences: no.

    <img src="../tailored-experiences.png" width="706"/>

=== "Step6"
    Advertising id: no.

    <img src="../advertisingid.png" width="706"/>

=== "Step7"
    Updates.

    <img src="../updates.png" width="706"/>

=== "Step8"
    Almost ready.

    <img src="../almost-ready.png" width="706"/>

=== "Step9"
    Installation done! Do a "safe remove" of the Windows USB flash drive.

    <img src="../done.png" width="706"/>

