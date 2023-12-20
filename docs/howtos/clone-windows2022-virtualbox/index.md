# Clone a Windows Server 2022 virtual machine in VirtualBox 6.1.44

## Prereqs
- an existing [Windows Server 2022 virtual machine](../../tutorials/windows-server-2022-virtualbox/index.md)

## VirtualBox
=== "Step1"
    In this example, the "Current state" equals the "Clean install" snapshot (otherwise it would have been "Current state (Changed)")

    <img src="clean-equals-current-state.png" width="320" height="180"/>

=== "Step2"
    Select "Machine -> Clone".

    <img src="machine-clone.png" width="320" height="180"/>

=== "Step3"
    Click on the "Expert mode" button to show extra options.

    <img src="expert-mode.png" width="320" height="180"/>

=== "Step4"
    Change the name of the virtual machine. Clone type: full clone. Snapshots: current machine state. Be sure to generate new MAC addresses for all network adapters. Look at the screenshot below.

    <img src="advanced-clone.png" width="320" height="180"/>

=== "Step5"
    Click "Clone". This won't take too long.

    <img src="cloning.png" width="320" height="180"/>

=== "Step6"
    Endresult: a clone of "vm16" without snapshot(s).

    <img src="clone-endresult.png" width="320" height="180"/>

## Sysprep
Sysprep is used to remove system-specific information from a Windows installation, such as the computer name and security identifier (SID). This is necessary, if you want to add a cloned Windows machine to a Windows active directory domain.

=== "Step1"
    Boot the newly cloned VM and login. Start Explorer and navigate to "c:\Windows\System32\Sysprep". Right-click on "sysprep" and select "Run as Administrator".

    <img src="sysprep_as_administrator.png" width="320" height="180"/>

=== "Step2"
    Select "Enter System Out-of-Box Experience (OOBE)" and put a check next to "Generalize". Select "Reboot" as shutdown option.

    <img src="sysprep_oobe_reboot.png" width="320" height="180"/>

=== "Step3"
    Sysprep is now running and will reboot Windows afterwards.

    <img src="sysprep_running.png" width="320" height="180"/>

=== "Step4"
    You are greeted with a welcome screen. Personal preference here.

    <img src="sysprep_hi.png" width="320" height="180"/>

=== "Step5"
    Accept the license terms.

    <img src="sysprep_accept_license.png" width="320" height="180"/>

=== "Step6"
    Configure the password for the built-in administrator account ("Admin123" for this lab environment). Windows reboots afterwards.

    <img src="sysprep_password.png" width="320" height="180"/>

## IP address
=== "Step1"
    Login. Right-click on the network icon on the bottom-right taskbar -> Open Network and Internet settings.

    <img src="network-internet-settings.png" width="320" height="180"/>

=== "Step2"
    Select "Change adapter options".

    <img src="change-adapter-options.png" width="320" height="180"/>

=== "Step3"
    Double-click on "Ethernet", select "Properties", double-click on "Internet Protocol Version 4 (TCP/IPv4)" and configure IP settings.

    <img src="ip-settings.png" width="320" height="180"/>

=== "Step4"
    Close all windows. Click "Start" and typ "cmd" to open a command prompt: verify the internet connection.  The network icon on the bottom-right taskbar will show connectivity.

    <img src="verify-internet-connection.png" width="320" height="180"/>

## Computername
=== "Step1"
    Right-click on "Start -> System". Change the computer name from "vm16" to "vm17". Restart now.

    <img src="rename-pc.png" width="320" height="180"/>

=== "Step2"
    Login after reboot and shutdown Windows.

    <img src="shutdown.png" width="320" height="180"/>

## Snapshot
=== "Step1"
    Select "Machine -> Tools -> Snapshots".

    <img src="tools-snapshot.png" width="320" height="180"/>

=== "Step2"
    Select "Current State" and click "Take". Give a proper name, like "Clean install". A good "Snapshot Description" can be handy!

    <img src="snapshot-current-state.png" width="320" height="180"/>

=== "Step3"
    If you change "something" in this virtual machine, you will get "Current State (changed)". Want to revert those changes? Select "Clean install" and click "Restore". Be sure to remove the checkbox at "Create a snapshot of the current machine state" or you'll end up with another snapshot.

    <img src="restore-snapshot.png" width="320" height="180"/>

=== "Step4"
    You know if the snapshot has been properly restored, if the "Current State" equals the "Clean install" again.

    <img src="restore-successful.png" width="320" height="180"/>