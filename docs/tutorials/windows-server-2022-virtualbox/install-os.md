# Install OS

## Boot from ISO
=== "Step1"
    Start the virtual machine. If you do nothing, you'll get an interactive shell. The first time you start a virtual machine, you get the "Auto capture keyboard" and "mouse pointer integration" messages. Read them and then select the "Do not show this message again" checkboxes.

    <img src="../interactive-shell.png" width="320" height="180"/>

=== "Step2"
    Close the window and choose "Power off the machine". Start the virtual machine again and quickly click into the window at the "Press any key..." prompt, so it gets the focus, and press ++enter++. Be fast!

    <img src="../press-any-key.png" width="320" height="180"/>

=== "Step3"
    The Windows installer should start.

    <img src="../install-start.png" width="320" height="180"/>

## Bypass checks
=== "Step1"
    Press ++shift++ ++f10++ to open up a command prompt. Typ "regedit" and press ++enter++ The registry editor opens.

    <img src="../regedit.png" width="320" height="180"/>

=== "Step2"
    Navigate to "HKEY_LOCAL_MACHINE\SYSTEM\Setup", right-click on the "Setup" key and select "New -> Key". Give this key the name "LabConfig" (be aware: qwerty!)

    <img src="../labconfig.png" width="320" height="180"/>

=== "Step3"
    selecteer "New -> DWORD (32-bit)". Give this "Value" the name "BypassTPMCheck". Doubleclick on this value and change the "Value data" of 0 to 1.

    <img src="../dword.png" width="320" height="180"/>

=== "Step4"
    Do the same for "“BypassRAMCheck” and "BypassSecureBootCheck". Compare with the screenshot below. Close the registry editor and command prompt windows.

    <img src="../bypass.png" width="320" height="180"/>

## Time and currency format
Dutch (Belgium). Keyboard or input method: “Belgian (Period).

<img src="../keyboard.png" width="320" height="180"/>

## Install now
Notice, you also have a "repair" option here... Choose "Install now".

<img src="../install-now.png" width="320" height="180"/>

## Activation (depends)
The presence or absence of the "Windows activation" screen during the installation of Windows 11 22H2 can depend on various factors. If you get this screen, choose "I don't have a product key". If not, proceed to the next step.

<img src="../activation.png" width="320" height="180"/>

## Select OS (depends)
The presence or absence of the "Select the operating system you want to install" screen during the installation of "Windows 11 22H2" can depend on various factors. If you get this screen, choose "Windows 11 Pro". If not, proceed to the next step.

<img src="../select-os.png" width="320" height="180"/>

## License agreement
Accept.

<img src="../accept-license.png" width="320" height="180"/>

## Type of installation
Select “Custom: Install Windows only (advanced)".

<img src="../type-installation.png" width="320" height="180"/>

## Installation location & partitioning
There are no partitions yet. Click "next".

<img src="../no-partitions.png" width="320" height="180"/>

## Installing
=== "Step1"
    Grab a coffee.

    <img src="../installing.png" width="320" height="180"/>

=== "Step2"
    The VM reboots for the first time. Virtual UEFI/BIOS won't boot of the ISO image, as it finds a Windows installation on the virtual harddrive.

    <img src="../reboot1.png" width="320" height="180"/>

=== "Step3"
    The VM reboots for the second time.

    <img src="../reboot2.png" width="320" height="180"/>

## Configuration
=== "Step1"
    Personal preference here. I select "Belgium".

    <img src="../belgium.png" width="320" height="180"/>

=== "Step2"
    Personal preference here. I select "Belgian (Period)".

    <img src="../belgian-period.png" width="320" height="180"/>

=== "Step3"
    Select "Skip".

    <img src="../skip-keyboard.png" width="320" height="180"/>

## Bypass internet connection
=== "Step1"
    At this moment, we do not have an active internet connection (NAT network, no static IP address yet). Microsoft want to push us for a "Microsoft account". We don't want that. Press ++shift++ ++f10++ for a command prompt. Typ "oobe\bypassnro" (attention: the letter "o" and not the number "0") and press ++enter++

    <img src="../bypass-nro.png" width="320" height="180"/>

=== "Step2"
    The virtual machine reboots and the OOBE (out-of-the-box-experience) restart. Unfortunately, you have to choose the correct region (Belgium) and keyboard layout - Belgium(period) - again. Also skip the extra keyboard layout again. You will get an extra option "I don't have internet".

    <img src="../no-internet.png" width="320" height="180"/>

=== "Step3"
    Select "Continue with limited setup".

    <img src="../limited-setup.png" width="320" height="180"/>

## Account
=== "Step1"
    Create user "guru".

    <img src="../user-guru.png" width="320" height="180"/>

=== "Step2"
    Create and acknowlege password "guru".

    <img src="../password-guru.png" width="320" height="180"/>

=== "Step3"
    Security question1: "Doggy" ;-)

    <img src="../security-question1.png" width="320" height="180"/>

=== "Step4"
    Security question2: "Wevelgem".

    <img src="../security-question2.png" width="320" height="180"/>

=== "Step5"
    Security question3: "IT dude" ;-)

    <img src="../security-question3.png" width="320" height="180"/>

## Finishing

=== "Step1"
    Location based services: "No".

    <img src="../location-based-services.png" width="320" height="180"/>

=== "Step2"
    Find my device: "No".

    <img src="../find-my-device.png" width="320" height="180"/>

=== "Step3"
    Diagnostic data: "Required only".

    <img src="../diagnostic-data.png" width="320" height="180"/>

=== "Step4"
    Inking & typing: "No".

    <img src="../inking-typing.png" width="320" height="180"/>

=== "Step5"
    Tailored experiences: "No".

    <img src="../tailored-experiences.png" width="320" height="180"/>

=== "Step6"
    Advertising ID: "No".

    <img src="../advertisingid.png" width="320" height="180"/>

=== "Step7"
    Installing...

    <img src="../installing.png" width="320" height="180"/>

=== "Step8"
    Done! Notice, that there is no "full screen" possible yet. Later on, we'll install the "virtualbox guest additions" for that.

    <img src="../done.png" width="320" height="180"/>