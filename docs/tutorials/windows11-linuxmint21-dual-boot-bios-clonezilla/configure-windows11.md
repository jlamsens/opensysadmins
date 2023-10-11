# Configure Windows 11

## Activation
=== "Step1"
    Click on the "Start" button. Then click on the gear icon labeled "Settings" to open the Settings app.

    <img src="../start-settings.png" width="320" height="180"/>

=== "Step2"
    In the Settings app, click on the "System" category.

    <img src="../settings-system.png" width="320" height="180"/>

=== "Step3"
    On the right, click on the "Activation" option. This will open the Activation page where you can view the activation status. Here it says: "Windows is activated with a digital license". Consult official Microsoft documentation for your situation.

    <img src="../digital-license.png" width="320" height="180"/>

## Device drivers
=== "Step1"
    For a "Fujitsu Esprimo E900", some hardware is not yet properly recognized. Specifics vary from computer to computer.

    <img src="../device-manager.png" width="320" height="180"/>

=== "Step2"
    The correct drivers - even for Windows 11 - can only be found when "Windows 10 (64-bit) Version 1506" is selected in the dropdown box. When the "chipset software installation utility" was downloaded and installed, all hardware was properly recognized.

    <img src="../intel-chipset-fujitsu.png" width="320" height="180"/>

## Updates
=== "Step1"
    Click on the "Start" button. Then click on the gear icon labeled "Settings" to open the Settings app.

     <img src="../start-settings.png" width="320" height="180"/>

=== "Step2"
    In the Settings app, click on the "Windows Update" category.

    <img src="../settings-windows-updates.png" width="320" height="180"/>

=== "Step3"
    On the Windows Update page, click on the "Check for updates" button. This will initiate a check for available updates for your Windows 11 installation.

    <img src="../check-for-updates.png" width="320" height="180"/>

=== "Step4"
    If any updates are found, downloading begins automatically. After the updates are downloaded, Windows may prompt you to restart your computer to install them. Reboot.

    <img src="../download-and-restart.png" width="320" height="180"/>

=== "Step5"
    Once your computer restarts, Windows will automatically install the downloaded updates. This process may take some time, and your computer may restart multiple times during the installation.

    <img src="../updates-restart.png" width="320" height="180"/>

=== "Step6"
    After the initial set of updates is installed, it's a good idea to check for updates again to ensure that your system is fully up to date. Repeat previous steps to check for any additional updates that may be available.

    <img src="../up-to-date.png" width="320" height="180"/>

=== "Step7"
    Once all the updates are installed, you can verify the Windows 11 version and update status by going to the Settings app, clicking on the "System" category, and then selecting "About". Here, you can see the installed version of Windows 11 and confirm that your system is up to date.

    <img src="../system-about.png" width="320" height="180"/>

=== "Step8"
    As this is a lab environment, "disable" the automatic updates for now; click "Start", type "services.msc" and select the "Services" app. In the Services window, scroll down and locate the "Windows Update" service. Right-click on "Windows Update" and select "Properties" from the context menu. In the Properties window, under the "General" tab, locate the "Startup type" dropdown menu. Change the startup type to "Disabled". Click on "OK" to save the changes and close the window.

    <img src="../disable-automatic-updates.png" width="320" height="180"/>

## Power
=== "Step1"
    In the "Settings" app, choose "Power".

    <img src="../settings-power.png" width="320" height="180"/>

=== "Step2"
    As this is a lab computer, make sure the monitor and device never go to sleep.

    <img src="../sleep-never.png" width="320" height="180"/>

## Copy ISO files
In order to [create some installation media with Rufus](../../howtos/install-rufus-windows11/index.md){:target="_blank"} when we're offline later on, copy over the ISO files you need.
<!-- Win, Lin, Clonezilla -->

<img src="../1280-720.png" width="320" height="180"/>

## Applications (optional)
- [Install Rufus on Windows 11](../../../howtos/install-rufus-windows11/){:target="_blank"} -> make USB-key to download GRUB and syslinux
- [Install Putty on Windows 11](../../../howtos/install-putty-windows11/){:target="_blank"}
- [Install Teraterm on Windows 11](../../../howtos/install-teraterm-windows11/){:target="_blank"}
- [Install WinSCP on Windows 11](../../../howtos/install-winscp-windows11/){:target="_blank"}
- [Install Wireshark on Windows 11](../../../howtos/install-wireshark-windows11/){:target="_blank"} -> download ONLY
- [Install Chrome on Windows 11](../../../howtos/install-chrome-windows11/){:target="_blank"}
- [Install Firefox on Windows 11](../../../howtos/install-firefox-windows11/){:target="_blank"}

## Cleanup + final restart
=== "Step1"
    Verify the network type. It must be "public network".

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step2"
    Configure desktop shortcuts.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step3"
    Empty the recycle bin.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step4"
    Right-click "Start -> Settings"." Click on "Personalization -> Start". Uncheck all settings.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step5"
    Reboot the PC for the last time, to make sure all remaining updates are properly installed/configured.

    <img src="../1280-720.png" width="320" height="180"/>

=== "Step6"
    Start a command prompt and execute "ipconfig /flushdns" followed by "ipconfig /release" and unplug the UTP cable.

    <img src="../1280-720.png" width="320" height="180"/>

## Shutdown1 and power-up
Shutdown the PC. Power on the PC. It is possible that some last "updates" are getting configured.

## Shutdown2 and reconnect the network.
Finally, login and shutdown Windows 11 for the last time. Reconnect the UTP network cable now (but do not boot into Windows anymore).