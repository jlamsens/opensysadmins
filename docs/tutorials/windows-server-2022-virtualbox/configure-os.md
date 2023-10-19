# Configure OS

## Guest additions
=== "Step1"
    Login ("Administrator"/"Admin123"). As we use VirtualBox, we have to press the right ++ctrl++ button + ++delete++

    <img src="../login.png" width="320" height="180"/>

=== "Step2"
    Select "Devices -> Insert Guest Additions CD Image". In the background, a "virtual cd" gets mounted.
    
    <img src="../insert-guest-additions.png" width="320" height="180"/>

=== "Step2"
    Start the "Windows Explorer". You can see the "virtual cd" via the D:\ drive. Double-click on "VboxWindowsAdditions-amd64".

    <img src="../explorer-guest-additions.png" width="320" height="180"/>

=== "Step3"
    Read and comprehend all messages. Follow the installation steps and restart.

    <img src="../installing-guest-additions.png" width="320" height="180"/>

=== "Step4"
    Login ("Administrator"/"Admin123"). Select "View -> Full-screen Mode".

    <img src="../view-fullscreen.png" width="320" height="180"/>

=== "Step5"
    Hooray, full screen! Start "Windows Explorer". Right-click on D:\ -> Eject (= "remove the virtual cd", Windows Explorer closes)

    <img src="../eject-guest-additions.png" width="320" height="180"/>

=== "Step6"
    The shared folder "/home/guru/Downloads" is visible in "Windows Explorer" via drive-letter Z:

    <img src="../shared-folder-explorer.png" width="320" height="180"/>

## IP address
=== "Step1"
    Right-click on the network icon on the bottom-right taskbar -> Open Network and Internet settings.

    <img src="../network-internet-settings.png" width="320" height="180"/>

=== "Step2"
    Select "Change adapter options".

    <img src="../change-adapter-options.png" width="320" height="180"/>

=== "Step3"
    Double-click on "Ethernet", select "Properties", double-click on "Internet Protocol Version 4 (TCP/IPv4) and enter the correct values.

    <img src="../ip-settings.png" width="320" height="180"/>

=== "Step4"
    Watch closely for the popup. Select "No" at this time.

    <img src="../not-discoverable.png" width="320" height="180"/>

=== "Step5"
    Close all windows. Click "Start" and typ "cmd" to open a command prompt: verify the internet connection.  The network icon on the bottom-right taskbar will show connectivity.

    <img src="../verify-internet-connection.png" width="320" height="180"/>

## Computername
Right-click on "Start -> System" and change the computer name to "vm16". **Restart later**.

<img src="../change-computer-name.png" width="320" height="180"/>

## Automatic updates
=== "Step1"
    Right-click on "Start -> Settings" and select "Update & Security".

    <img src="../install-updates.png" width="320" height="180"/>

=== "Step2"
    Install all available updates. Reboot when asked to. Repeat "Check for updates/installing updates" until no more updates are available.

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
