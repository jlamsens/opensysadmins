# Configure Linux Mint 21

## Login
=== "Step1"
    Login with "guru", password "guru" at the "MDM Login Manager" (MDM = Mint Display Manager).

    <img src="../login-guru.png" width="320" height="180"/>

=== "Step2"
    You're greeted with a "Welcome screen". Take a look around and then remove the check "Show this dialog at startup".

    <img src="../welcome-screen.png" width="320" height="180"/>

## Configure update mirror

=== "Step1"
    Go to "Menu -> Administration -> Update Manager".

    <img src="../update-manager.png" width="320" height="180"/>

=== "Step2"
    Read the text and click "OK".

    <img src="../welcome-update-manager.png" width="320" height="180"/>

=== "Step3"
    Let's use a local mirror for fast downloads. Click "Yes" in the blue bar.

    <img src="../local-mirror.png" width="320" height="180"/>

=== "Step4"
    Authenticate with the "guru" password.

    <img src="../authenticate.png" width="320" height="180"/>

=== "Step5"
    Click in the field "Main (...)". Another window appears. Select the repository with the fastest speed. In this case, let's choose LiteServer and click "Apply".

    <img src="../select-mirror.png" width="320" height="180"/>

=== "Step6"
    After changing the "repository mirror", the APT cache has to be updated. Click "OK".

    <img src="../update-apt-cache.png" width="320" height="180"/>

=== "Step7"
    Close the "Software sources" window and proceed with the updates. In this case, a new version of the "Update Manager" is available. Apply the update.
    Again, the password of "guru" is asked.

    <img src="../update-manager-newversion.png" width="320" height="180"/>

## Install updates
=== "Step1"
    A list of available updates is presented. Select "Install Updates".

    <img src="../list-available-updates.png" width="320" height="180"/>

=== "Step2"
    Confirm the (possible) message concerning additional changes. Again, the password of "guru" is asked.

    <img src="../additional-changes.png" width="320" height="180"/>

=== "Step3"
    Finally, all updates get downloaded and installed. Grab another coffee!

    <img src="../download-install-updates.png" width="320" height="180"/>

=== "Step4"
    When the system is up-to-date, reboot the PC.

    <img src="../up-to-date-reboot.png" width="320" height="180"/>

=== "Step5"
    Login. Start the "Update manager" again and click "Refresh". Your system should be up-to-date.

    <img src="../update-manager-refresh.png" width="320" height="180"/>

## System reports
=== "Step1"
    Go to "Menu -> Administration -> System Reports".

    <img src="../administration-system-reports.png" width="320" height="180"/>

=== "Step2"
    Ignore the reports concerning the "language packs" and "the system restore utility".

    <img src="../ignore-restore-language.png" width="320" height="180"/>

=== "Step3"
    No problems detected? Done!

    <img src="../no-problems.png" width="320" height="180"/>

## Applications (optional)
- [Install Google Chrome browser](../../howtos/install-chrome-browser-linux-mint/index.md){:target="_blank"}
- [Install Wireshark](../../howtos/install-wireshark-linux-mint21/index.md){:target="_blank"}
- [Acquire a valid Cisco IOS image](../../howtos/acquire-valid-ios-image/index.md){:target="_blank"}
- [Install tFTP](../../howtos/install-tftp-linux-mint/index.md){:target="_blank"}
- [Install minicom](../../howtos/install-minicom-linux-mint/index.md){:target="_blank"}

## Cleanup

=== "Step1"
    Let's set a nice background.

    <img src="../desktop-background.png" width="320" height="180"/>

=== "Step2"
    Click Menu -> Preferences -> Power Management. Change both "Power Options" to "Never".

    <img src="../power-options.png" width="320" height="180"/>

=== "Step3"
    Clear Chrome/Firefox browser history.

    <img src="../clear-browsing-data.png" width="320" height="180"/>

=== "Step4"
    Clear bash history.

    <img src="../clear-bash-history.png" width="320" height="180"/>

=== "Step5"
    Empty trash.

    <img src="../empty-trash.png" width="320" height="180"/>

=== "Step6"
    Desktop shortcuts: Firefox, Chrome, Wireshark. Panel shortcuts: Files, Firefox, Chrome, Terminal.

    <img src="../desktop-panel-shortcuts.png" width="320" height="180"/>