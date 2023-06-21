# Configure OS

## Guest additions
=== "Step1"
    Select "Devices -> Insert Guest Additions CD Image". In the background, a "virtual cd" gets mounted.
    
    <img src="../insert-guest-additions.png" width="320" height="180"/>

=== "Step2"
    Start the "Windows Explorer". You can see the "virtual cd" via the D:\ drive. Double-click on "VboxWindowsAdditions-amd64".

    <img src="../explorer-guest-additions.png" width="320" height="180"/>

=== "Step3"
    Read and comprehend all messages. Follow the installation steps and restart.

    <img src="../installing-guest-additions.png" width="320" height="180"/>

=== "Step4"
    Login ("guru"/"guru") and select "View -> Full-screen Mode".

    <img src="../view-fullscreen.png" width="320" height="180"/>

=== "Step5"
    Read and comprehend the popup message.

    <img src="../message-fullscreen.png" width="320" height="180"/>

=== "Step6"
    Hooray, full screen! Start "Windows Explorer". Right-click on D:\ -> Eject (= "remove the virtual cd", Windows Explorer closes)

    <img src="../eject-guest-additions.png" width="320" height="180"/>

=== "Step7"
    The shared folder "/home/guru/Downloads" is visible in "Windows Explorer" via drive-letter Z:

    <img src="../shared-folder-explorer.png" width="320" height="180"/>

## IP address
=== "Step1"
    Right-click on the network icon on the bottom-right taskbar -> Network and Internet settings.

    <img src="../network-internet-settings.png" width="320" height="180"/>

=== "Step2"
    Select “Ethernet”.

    <img src="../ethernet.png" width="320" height="180"/>

=== "Step3"
    Select “Edit”.

    <img src="../edit.png" width="320" height="180"/>

=== "Step4"
    Change "DHCP" to "Manual", activate "IPv4" and configure the IP, subnetmask, gateway and DNS server. Click "Save".

    <img src="../ip-settings.png" width="320" height="180"/>

=== "Step5"
    Click "Start" and typ "cmd" to open a command prompt: verify the internet connection.

    <img src="../verify-internet-connection.png" width="320" height="180"/>

=== "Step6"
    The network icon on the bottom-right taskbar will soon change to this:

    <img src="../network-icon.png" width="320" height="180"/>

## Computername
Go to "Settings -> About" and change the computer name to “vm6”. Restart later.

<img src="../change-computer-name.png" width="320" height="180"/>

## Automatic updates
=== "Step1"
    Go to "System -> Windows update" and install all available updates.

    <img src="../install-updates.png" width="320" height="180"/>

=== "Step2"
    Reboot when asked to. Repeat "Check for updates/installing updates" until no more updates are available.

    <img src="../up-to-date.png" width="320" height="180"/>

=== "Step3"
    As this is a lab environment, "disable" the automatic updates for now; click "Start", type "services.msc" and select the "Services" app. In the Services window, scroll down and locate the "Windows Update" service. Right-click on "Windows Update" and select "Properties" from the context menu. In the Properties window, under the "General" tab, locate the "Startup type" dropdown menu. Change the startup type to "Disabled". Click on "OK" to save the changes and close the window.

    <img src="../disable-automatic-updates.png" width="320" height="180"/>

## Restart and shutdown
=== "Step1"
    Let's do a final restart so all updates are properly installed.

    <img src="../final-restart.png" width="320" height="180"/>

=== "Step2"
    Finally, "shutdown" Windows.

    <img src="../shutdown.png" width="320" height="180"/>
