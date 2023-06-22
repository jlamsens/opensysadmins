# Clone Windows 11 in VirtualBox 6.1.44

## Prereqs
- an existing [Windows 11 virtual machine](../../tutorials/windows11-virtualbox/index.md)

## VirtualBox
=== "StepX"
    In this example, the "Current state" equals the "Clean install" snapshot (otherwise it would have been "Current state (Changed)")

    <img src="clean-equals-current-state.png" width="320" height="180"/>

=== "StepX"
    Select "Machine -> Clone".

    <img src="machine-clone.png" width="320" height="180"/>

=== "StepX"
    Click on the "Expert mode" button to show extra options.

    <img src="expert-mode.png" width="320" height="180"/>

=== "StepX"
    Change the name of the virtual machine. Clone type: full clone. Snapshots: current machine state. Be sure to generate new MAC addresses for all network adapters. Look at the screenshot below.

    <img src="advanced-clone.png" width="320" height="180"/>

=== "StepX"
    Click "Clone". This won't take too long.

    <img src="cloning.png" width="320" height="180"/>

=== "StepX"
    Endresult: a clone of vm6 without snapshot(s).

    <img src="clone-endresult.png" width="320" height="180"/>

## IP address
=== "Step1"
    Start the cloned virtual machine "vm7" and login. Right-click on the network icon on the bottom-right taskbar -> Network and Internet settings.

    <img src="network-internet-settings.png" width="320" height="180"/>

=== "Step2"
    Select “Ethernet”.

    <img src="ethernet.png" width="320" height="180"/>

=== "Step3"
    Select “Edit”. Change the IP address.

    <img src="change-ip.png" width="320" height="180"/>

=== "Step4"
    Click "Start" and typ "cmd" to open a command prompt: verify the internet connection.

    <img src="verify-internet-connection.png" width="320" height="180"/>

=== "Step5"
    The network icon on the bottom-right taskbar will soon change to this:

    <img src="network-icon.png" width="320" height="180"/>

## Computername
=== "Step1"
    Go to "Settings -> About" and change the computer name to “vm7”. Restart now.

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
