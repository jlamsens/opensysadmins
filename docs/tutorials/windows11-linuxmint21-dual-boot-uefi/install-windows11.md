# Install Windows 11

## Boot from USB
=== "Step"
    Insert the [Windows 11 USB flash drive](../../howtos/windows11-bootable-usb-flash-drive/index.md). Make sure both monitors are "on". Start the PC. In this case (HP Z4 PC), press ++f9++ once at the "HP splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    You get the "boot menu". Select the USB flash drive to boot from.

    <img src="../1280-720.png" width="320" height="180"/>


## Time and currency format
Dutch (Belgium). Keyboard or input method: “Belgian (Period).

<img src="../time-currency.png" width="320" height="180"/>

## Install now
Notice, you also have a "repair" option here... Choose "Install now".

<img src="../install-now.png" width="320" height="180"/>

## Activation (depends)
The presence or absence of the "Windows activation" screen during the installation of Windows 11 22H2 can depend on various factors. If you get this screen, choose "I don't have a product key". If not, proceed to the next step.

<img src="../activation.png" width="320" height="180"/>

## Select OS (depends)
The presence or absence of the "Select the operating system you want to install" screen during the installation of Windows 11 22H2 can depend on various factors. If you get this screen, choose "Windows 11 Pro". If not, proceed to the next step.

<img src="../select-os.png" width="320" height="180"/>


## License agreement
Accept.

<img src="../accept-license.png" width="320" height="180"/>

## Type of installation
Select “Custom: Install Windows only (advanced)"

<img src="../custom-install.png" width="320" height="180"/>

## Installation location & partitioning

=== "Step"
    If you were able to do a "secure erase" in BIOS/UEFI, there are no partitions. If not, delete all partitions.

    <img src="../installation-location.png" width="320" height="180"/>

=== "Step"
    Make sure "Num Lock" is activated on your keyboard. Check the LED if possible. Select "New" and create a partition of 60 GB (61440 MB) and click "apply".

    <img src="../partition-60gb.png" width="320" height="180"/>

=== "Step"
    Read and comprehend the message.

    <img src="../additional-partitions.png" width="320" height="180"/>

=== "Step"
    Windows creates additional partitions. Notice, there is some "Unallocated space" left. This is for the Linux installation later on.
    Select "Drive 0 Partition 3" for the Windows installation.

    <img src="../windows-location.png" width="320" height="180"/>

## Installing

=== "Step"
    Grab a coffee.

    <img src="../installing-windows.png" width="320" height="180"/>

=== "Step"
    The PC reboots for the first time. UEFI/BIOS won't boot of the USB flash drive, as it finds a Windows installation on the (hard)drive.

    <img src="../reboot1.png" width="320" height="180"/>

## Configuration

=== "Step"
    Select "Belgium".

    <img src="../country-region.png" width="320" height="180"/>

=== "Step"
    Select "Belgian (Period)".

    <img src="../belgian-period.png" width="320" height="180"/>

=== "Step"
    Select "Skip"

    <img src="../second-keyboard-layout.png" width="320" height="180"/>

=== "Step"
    Enter a computername. In this case "hp".

    <img src="../device-name.png" width="320" height="180"/>

=== "Step"
    Windows reboots for the 2nd time.

    <img src="../reboot2.png" width="320" height="180"/>

=== "Step"
    Should you get this message, select "Next".

    <img src="../connect-network.png" width="320" height="180"/>


## Account

=== "Step"
    Select "Set up for personal use".

    <img src="../personal-use.png" width="320" height="180"/>

=== "Step"
    Read and comprehend the concept "Microsoft account". We do not want such an account for now. Previous versions allowed for a "local/offline account", via "Sign-in options". Starting of Windows 11 22H2, it does not work anymore. Use this trick: select "Sign in".

    <img src="../microsoft-account.png" width="320" height="180"/>

=== "Step"
    Enter the random e-mailaddress "no@thankyou.com"

    <img src="../microsoft-account-signin.png" width="320" height="180"/>

=== "Step"
    Enter "whatever" as password and select "Sign in".

    <img src="../microsoft-account-password.png" width="320" height="180"/>

=== "Step"
    You get an error. Nevermind. Just select "Next".

    <img src="../ooops.png" width="320" height="180"/>

=== "Step"
    Login: guru

    <img src="../login.png" width="320" height="180"/>

=== "Step"
    Password: guru

    <img src="../password.png" width="320" height="180"/>

=== "Step"
    Acknowlege the password: guru

    <img src="../password-acknowledge.png" width="320" height="180"/>

=== "Step"
    Security question1: Doggy

    <img src="../security-question1.png" width="320" height="180"/>

=== "Step"
    Security question2: Wevelgem

    <img src="../security-question2.png" width="320" height="180"/>

=== "Step"
    Security question3: IT guru

    <img src="../security-question3.png" width="320" height="180"/>

## Finishing

=== "Step"
    Location-based experiences: no.

    <img src="../location.png" width="320" height="180"/>

=== "Step"
    Find my device: no.

    <img src="../find.png" width="320" height="180"/>

=== "Step"
    Send diagnostic data: Required only.

    <img src="../stats.png" width="320" height="180"/>

=== "Step"
    Improving inking & typing: no.

    <img src="../inking-typing.png" width="320" height="180"/>

=== "Step"
    Get tailored experiences: no.

    <img src="../tailored-experiences.png" width="320" height="180"/>

=== "Step"
    Advertising id: no.

    <img src="../advertisingid.png" width="320" height="180"/>

=== "Step"
    Updates.

    <img src="../updates.png" width="320" height="180"/>

=== "Step"
    Almost ready.

    <img src="../almost-ready.png" width="320" height="180"/>

=== "Step"
    Installation done!

    <img src="../done.png" width="320" height="180"/>

