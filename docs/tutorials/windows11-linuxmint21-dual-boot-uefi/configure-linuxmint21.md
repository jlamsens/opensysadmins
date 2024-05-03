# Configure Linux Mint 21

## Login
=== "Step1"
    Login with "guru", password "guru" at the "MDM Login Manager" (MDM = Mint Display Manager).

    <img src="../login-guru.png" width="706"/>

=== "Step2"
    You're greeted with a "Welcome screen". Take a look around and then remove the check "Show this dialog at startup".

    <img src="../welcome-screen.png" width="706"/>

## Add taskbar
=== "Step1"
    In this case, I have 2 monitors. Go to Menu -> Preferences -> Display

    <img src="../preferences-display.png" width="706"/>

=== "Step2"
    The left monitor must be the "primary". If necessary, switch monitor positions by dragging and click "Apply".
    If everything looks good, confirm this configuration.

    <img src="../monitor-primary.png" width="706"/>

=== "Step3"
    Left monitor: right-click on the taskbar and choose "Add a new panel".

    <img src="../add-new-panel.png" width="706"/>

=== "Step4"
    Red bars become visible on each side of both monitors.

    <img src="../red-bars.png" width="706"/>

=== "Step5"
    Right monitor: click on the bottom red bar. A task bar is added and the red bars disappear.

    <img src="../added-taskbar.png" width="706"/>

## Add applets
=== "Step1"
    Right monitor: right-click and activate "Panel edit mode". Then choose "Applets".

    <img src="../panel-edit-mode.png" width="706"/>

=== "Step2"
    Right monitor: navigate to "Grouped window list" and click on the + sign. Some icons become visible at the bottom right. Probably a bug, but is hard to see those icons. Close the "Applets" window.

    <img src="../grouped-window-list.png" width="706"/>

=== "Step3"
    Right monitor: Drag those icons all the way up to the left side of the screen (still on the right monitor!) and release the mouse.

    <img src="../drag-grouped-window-list.png" width="706"/>

=== "Step4"
    Right monitor: right-click on the bottom taskbar and deactivate "Panel edit mode".

    <img src="../panel-edit-mode-disable.png" width="706"/>

## Configure update mirror

=== "Step1"
    Go to "Menu -> Administration -> Update Manager".

    <img src="../update-manager.png" width="706"/>

=== "Step2"
    Read the text and click "OK".

    <img src="../welcome-update-manager.png" width="706"/>

=== "Step3"
    Let's use a local mirror for fast downloads. Click "Yes" in the blue bar and authenticate with the "guru" password.

    <img src="../local-mirror.png" width="706"/>

=== "Step4"
    Click in the field "Main (...)". Another window appears. Select the repository with the fastest speed. In this case, I choose "LiteServer" for lab purposes and click "Apply".

    <img src="../select-mirror.png" width="706"/>

=== "Step5"
    After changing the "repository mirror", the APT cache has to be updated. Click "OK".

    <img src="../update-apt-cache.png" width="706"/>

=== "Step6"
    Close the "Software sources" window and proceed with the updates. In this case, a new version of the "Update Manager" is available. Apply the update.
    Again, the password of "guru" is asked.

    <img src="../update-manager-newversion.png" width="706"/>

## Install updates
=== "Step1"
    A list of available updates is presented. Select "Install Updates". Confirm the (possible) message concerning additional changes. Again, the password of "guru" is asked.

    <img src="../list-available-updates.png" width="706"/>

=== "Step2"
    Finally, all updates get downloaded and installed. Grab another coffee! Or click on "Details" to see what the system is doing ;-)

    <img src="../download-install-updates.png" width="706"/>

=== "Step3"
    When the system is up-to-date, reboot the PC.

    <img src="../up-to-date-reboot.png" width="706"/>

=== "Step4"
    Login. Start the "Update manager" again and click "Refresh". Your system should be up-to-date. If not, repeat previous steps.

    <img src="../update-manager-refresh.png" width="706"/>

## System reports
=== "Step1"
    Go to "Menu -> Administration -> System Reports". Ignore the reports concerning the "language packs (1)" and "the system restore utility (2)".

    <img src="../administration-system-reports.png" width="706"/>

=== "Step2"
    No problems detected? Done!

    <img src="../no-problems.png" width="706"/>