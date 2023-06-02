# Configure Linux Mint 21

## Login
=== "Step"
    Login with "guru", password "guru" at the "MDM Login Manager" (MDM = Mint Display Manager).

=== "Step"
    You're greeted with a "Welcome screen". Take a look around and then remove the check "Show this dialog at startup".

## Add taskbar
=== "Step"
    In this case, I have 2 monitors. Go to Menu -> Preferences -> Display

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    The left monitor must be the "primary". If necessary, switch monitor positions by dragging and click "Apply".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    If everything looks good, confirm this configuration.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Left monitor: right-click on the taskbar and choose "Add a new panel".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Red bars become visible on each side of both monitors.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Right monitor: click on the bottom red bar. A task bar is added and the red bars disappear.

    <img src="../1280-720.png" width="320" height="180"/>

## Add applets
=== "Step"
    Right monitor: right-click and activate "Panel edit mode".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Right monitor: Choose "Applets".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Right monitor: navigate to "Grouped window list" and click on the + sign. A Firefox icon becomes visible at the bottom right. Probably a bug, but is hard to see that icon. Close the "Applet" window.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Right monitor: Drag that icon all the way up to the left side of the screen (still on the right monitor!) until the mouse cursor changes in a "hand with arrow" and release the mouse.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Right monitor: right-click on the bottom taskbar and deactivate "Panel edit mode".

    <img src="../1280-720.png" width="320" height="180"/>


## Configure update mirror
=== "Step"
    Go to Menu -> Administration -> Update Manager.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Read the text and click "OK".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Let's use a local mirror for fast downloads. Click "Yes" in the blue bar.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Click in the field "Main (vanessa). Another window appears.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Select the repository with the fastest speed. In this case: choose LiteServer.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Afther changing the "repository mirror", the APT cache has to be updated. Click "OK".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Close the "Software sources" window and proceed with the updates. The password of "guru" is needed.

    <img src="../1280-720.png" width="320" height="180"/>

## Install updates
=== "Step"
    A list of available updates is presented. Select "Install Updates".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Confirm the (possible) message concerning additional changes.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Again, the password of "guru" is needed.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Finally, all updates get downloaded and installed.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    When the system is up-to-date, reboot the PC.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Login. Start the "Update manager" again and click "Refresh". Your system should be up-to-date. If not, repeat previous steps.

    <img src="../1280-720.png" width="320" height="180"/>

## System reports
=== "Step"
    Go to Menu -> Administration -> System Reports

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    Ignore the reports concerning "the system restore utility" and "language packs".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step"
    No problems detected? Done!

    <img src="../1280-720.png" width="320" height="180"/>



<!---
- full updates, reports
- tftp service (install) + CISCO images switches/routers
- openssh-server (install)
- minicom
- unplug UTP-cable + restart
- shut down
-->

<!---
## tFTP service
- apt update
- apt install tftpd-hpa
- cd /srv/tftp/
- cp /media/sf_Downloads/c2960* .
- chmod 644 c*
- ip a ...
-->