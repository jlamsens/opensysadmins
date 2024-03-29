# Configure OS

## Guest additions
=== "Step1"
    Select "Devices -> Insert Guest Additions CD Image". At first glance, nothing will happen, but in the background, a "virtual cd" gets mounted.
    
    <img src="../insert-guest-additions.png"/>

=== "Step2"
    Start the "Windows Explorer". You can see the "virtual cd" via the D:\ drive. Double-click on "VboxWindowsAdditions-amd64".

    <img src="../explorer-guest-additions.png"/>

=== "Step3"
    Read and comprehend all messages. Follow the installation steps and restart.

    <img src="../installing-guest-additions.png"/>

=== "Step4"
    Login ("guru"/"guru") and select "View -> Full-screen Mode".

    <img src="../view-fullscreen.png"/>

=== "Step5"
    Read and comprehend the popup message.

    <img src="../message-fullscreen.png"/>

=== "Step6"
    Hooray, full screen! Play with "Host+F" key in combination with maximizing the screen. I choose to see both my "Linux desktop menu" as the "Windows Start menu".

    <img src="../linux-windows-menu.png"/>

=== "Step7"
    Start "Windows Explorer". Right-click on D:\ -> Eject (= "remove the virtual cd"). Windows Explorer will close.

    <img src="../eject-guest-additions.png"/>

## Automatic updates
=== "Step1"
    Go to "System -> Windows update" and install all available updates.

    <img src="../install-updates.png"/>

=== "Step2"
    Reboot when asked to. Repeat "Check for updates/installing updates" until no more updates are available.

    <img src="../up-to-date.png"/>

## Restart and shutdown
Let's do a last restart so all pending updates are properly installed. Finally, "shutdown" Windows.