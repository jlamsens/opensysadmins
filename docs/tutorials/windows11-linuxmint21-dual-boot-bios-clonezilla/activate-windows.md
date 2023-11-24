# Activate windows
Windows uses a system called Product Activation to ensure that it is only installed and used on one device at a time. Activation is closely tied to the hardware of the machine, including details like the motherboard, CPU, and other components. When you restore a system image to a different machine, Windows detects that the hardware has changed significantly. Those changes in hardware often trigger a reactivation requirement.

## Boot into Windows
=== "Step1"
    Choose "Windows 11 Pro 22H2" at the GRUB boot menu.
    
    <img src="../grub-boot-menu.jpg" width="320" height="180"/>

=== "Step2"
    Windows detects that the hardware has changed significantly.
    
    <img src="../hardware-detection.jpg" width="320" height="180"/>

## Activation
=== "Step1"
    Click on the "Start" button. Then click on the gear icon labeled "Settings" to open the Settings app.

    <img src="../start-settings.png" width="320" height="180"/>

=== "Step2"
    In the Settings app, click on the "System" category.

    <img src="../settings-system.png" width="320" height="180"/>

=== "Step3"
    On the right, click on the "Activation" option. This will open the Activation page where you can view the activation status. Here it says: "Windows is activated with a digital license". This is because we have "internet access" so Windows could re-activate. Consult official Microsoft documentation for your situation.

    <img src="../digital-license.png" width="320" height="180"/>