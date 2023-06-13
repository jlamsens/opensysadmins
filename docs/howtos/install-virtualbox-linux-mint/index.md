# Install VirtualBox 6.1.44 on Linux Mint 21

## Download
Download "VirtualBox 6.1.44" and the "Extension Pack" from the official website.

<img src="virtualbox-download.png" width="320" height="180"/>

## Open Terminal
Right-click on an empty space in the "Nemo" file manager and select "Open in Terminal".

<img src="downloads-open-terminal.png" width="320" height="180"/>

## Install VirtualBox and Extension pack
=== "Step1"
    Install the .deb package using the "apt install" command with the relative path to the package file. APT will recognize it and install the package along with its dependencies, if any.

    <img src="apt-install.png" width="320" height="180"/>

=== "Step2"
    Install the "Extension pack" using command with the relative path to the package file. APT will recognize it and install the package along with its dependencies, if any.

    <img src="install-extension-pack.png" width="320" height="180"/>

=== "Step3"
    Read the license agreement :p and typ "y".

    <img src="vboxmanage-accept-terms.png" width="320" height="180"/>

## Start VirtualBox
Select "Menu" and start typing "vir". Start "Oracle VM VirtualBox".

<img src="menu-virtualbox.png" width="320" height="180"/>

## Ignore new version
Version 7 is available, but let's use the most stable version 6.1.44 for now.

<img src="ignore-new-version.png" width="320" height="180"/>

## Disable update check
Select "File -> Preferences -> Update". Disable "Check for Updates".

<img src="preferences-no-updates.png" width="320" height="180"/>

## NAT configuration
=== "Step1"
    Select "File -> Preferences -> Network". Click on the + to create a NAT Network.

    <img src="plus-new-network.png" width="320" height="180"/>

=== "Step2"
    Mouse right-click "Edit NAT Network".

    <img src="edit-nat-network.png" width="320" height="180"/>

=== "Step3"
    Change the network CIDR to "192.168.10.0/24" and remove the check "Supports DHCP". Close all screens with "OK".

    <img src="nat-network-details.png" width="320" height="180"/>
