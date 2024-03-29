# Install OS

## Boot from ISO
=== "Step1"
    Start the virtual machine. If you do nothing, you'll get an interactive shell. If this is the first time you start a virtual machine, you get the "Auto capture keyboard" and "mouse pointer integration" messages. Read them and then tick the "Do not show this message again" checkboxes.

    <img src="../interactive-shell.png"/>

=== "Step2"
    Close the window and choose "Power off the machine". Start the virtual machine again and quickly click into the window at the "Press any key..." prompt, so it gets the focus, and press ++enter++. Be fast!

    <img src="../press-any-key.png"/>

=== "Step3"
    If you clicked the mouse inside the VM display window for the first time, you get this information message. Select "Do not show this message again" and click "Capture". To "uncapture", press that "host key".

    <img src="../click-info-message.png"/>

=== "Step4"
    Again, close the window and choose "Power off the machine". Start the virtual machine and quickly click into the window at the "Press any key..." prompt, so it gets the focus, and press ++enter++. Be fast! The Windows 11 installer should now start. Time and currency format: Dutch (Belgium). Keyboard or input method: “Belgian (Period)".

    <img src="../install-start.png"/>

## Bypass checks
=== "Step1"
    Press ++shift++ ++f10++ to open up a command prompt. Typ "regedit" and press ++enter++ The registry editor opens. Navigate to "HKEY_LOCAL_MACHINE\SYSTEM\Setup", right-click on the "Setup" key and select "New -> Key". Give this key the name "LabConfig" (be aware: qwerty!)

    <img src="../regedit-labconfig.png"/>

=== "Step2"
    Select "New -> DWORD (32-bit)". Give this "Value" the name "BypassTPMCheck". Doubleclick on this value and change the "Value data" of 0 to 1. Do the same for "“BypassRAMCheck” and "BypassSecureBootCheck". Compare with the screenshot below. Close the registry editor and command prompt window.

    <img src="../dword.png"/>

## Installing

=== "Step1"
    Choose "Install now". Notice, you also have a "repair" option here...
    
    <img src="../install-now.png"/>

=== "Step2"
    Accept the license agreement.
    
    <img src="../accept-license.png"/>

=== "Step3"
    Select “Custom: Install Windows only (advanced)".
    
    <img src="../type-installation.png"/>

=== "Step4"
    There are no partitions yet. Click "next".
    
    <img src="../no-partitions.png"/>

=== "Step5"
    Grab a coffee.
    
    <img src="../installing.png"/>

=== "Step6"
    The VM reboots for the first time. Virtual UEFI/BIOS won't boot of the ISO image, as it finds a Windows installation on the virtual harddrive.
    
    <img src="../reboot1.png"/>

=== "Step7"
    The VM reboots for the second time.
    
    <img src="../reboot2.png"/>


## Configuration
=== "Step1"
    Personal preference here. I select "Belgium".

    <img src="../belgium.png"/>

=== "Step2"
    Personal preference here. I select "Belgian (Period)".

    <img src="../belgian-period.png"/>

=== "Step3"
    Select "Skip". The VM will reboot for the 3rd time.

    <img src="../skip-keyboard.png"/>

## Sign in.
=== "Step1"
    Click "Sign-in options".

    <img src="../sign-in-options.png"/>

=== "Step2"
    Select "Domain join instead".

    <img src="../domain-join.png"/>

=== "Step3"
    Your name: "guru".

    <img src="../user-guru.png"/>

=== "Step4"
    Create and confirm password: "guru".

    <img src="../password-guru.png"/>

=== "Step5"
    Security question1: "Doggy" ;-)

    <img src="../security-question1.png"/>

=== "Step6"
    Security question2: "Wevelgem".

    <img src="../security-question2.png"/>

=== "Step7"
    Security question3: "IT guru" ;-)

    <img src="../security-question3.png"/>


## Finishing

=== "Step1"
    Location based services: "No".

    <img src="../location-based-services.png"/>

=== "Step2"
    Find my device: "No".

    <img src="../find-my-device.png"/>

=== "Step3"
    Diagnostic data: "Required only".

    <img src="../diagnostic-data.png"/>

=== "Step4"
    Inking & typing: "No".

    <img src="../inking-typing.png"/>

=== "Step5"
    Tailored experiences: "No".

    <img src="../tailored-experiences.png"/>

=== "Step6"
    Advertising ID: "No".

    <img src="../advertisingid.png"/>

=== "Step7"
    Installing...

    <img src="../wait-few-minutes.png"/>

=== "Step8"
    Done! Notice, that there is no "full screen" possible yet. Later on, we'll install the "virtualbox guest additions" for that.

    <img src="../done.png"/>