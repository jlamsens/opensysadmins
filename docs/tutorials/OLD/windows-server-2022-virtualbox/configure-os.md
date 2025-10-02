# Configure OS

## Guest additions
=== "Step1"
    Logon using right ++ctrl++ + ++del++ ("Administrator"/"Admin123"). Answer "No" on the question, if your PC has to be discoverable. Close all Windows for now.
    
    <img src="../close-windows.png"/>

=== "Step2"
    Select "Devices -> Insert Guest Additions CD Image". At first glance, nothing will happen, but in the background, a "virtual cd" gets mounted.

    <img src="../insert-guest-additions.png"/>

=== "Step3"
    Start the "Windows Explorer". You can see the "virtual cd" via the D:\ drive. Double-click on "VboxWindowsAdditions-amd64".

    <img src="../explorer-guest-additions.png"/>

=== "Step4"
    Read and comprehend all messages. Follow the installation steps and restart.

    <img src="../installing-guest-additions.png"/>

=== "Step5"
    Login ("Administrator"/"Admin123") and select "View -> Full-screen Mode". It takes a second, but the screen should maximize.

    <img src="../view-fullscreen.png"/>

=== "Step6"
    Hooray, full screen! Play with "Host+F" key in combination with maximizing the screen. I choose to see both my "Linux desktop menu" as the "Windows Start menu".

    <img src="../linux-windows-menu.png"/>

=== "Step7"
    Start "Windows Explorer". Right-click on D:\ -> Eject (= "remove the virtual cd"). Windows Explorer will close.

    <img src="../eject-guest-additions.png"/>

## Automatic updates
=== "Step1"
    Right-click on "Start -> Settings" and select "Update & Security".

    <img src="../install-updates.png"/>

=== "Step2"
    Install all available updates. Reboot when asked to. Repeat "Check for updates/installing updates".

    <img src="../check-updates.png"/>

=== "Step3"
    There should be no more updates available.

    <img src="../screenshot-todo.png"/>

## Clean up.

=== "Step1"
    Clear all notifications.

    <img src="../clear-notifications.png"/>


=== "Step2"
    Let's do a final restart so all updates are properly installed.

    <img src="../final-restart.png"/>

=== "Step3"
    Finally, "shutdown" Windows.

    <img src="../shutdown.png"/>
