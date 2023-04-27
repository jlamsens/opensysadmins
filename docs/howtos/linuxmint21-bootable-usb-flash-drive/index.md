# Create a Linux Mint 21 bootable USB flash drive
## Download ISO
=== "Step1"
    Use your favorite search engine to search for the Linux Mint 21 iso and choose the official Linux Mint website.

    <img src="linuxmint21-search-iso.png" width="320" height="180"/>

=== "Step2"
    Select the "Cinnamon Edition".

    <img src="linuxmint21-select-edition.png" width="320" height="180"/>

=== "Step3"
    Choose your favorite download mirror. The ISO file will be saved to your local disk.

    <img src="linuxmint21-download-mirror.png" width="320" height="180"/>

## On Windows 11
### With Rufus
#### Download and install Rufus
=== "Step1"
    Use your favorite search engine to search for Rufus and choose the official website.

    <img src="rufus-search.png" width="320" height="180"/>

=== "Step2"
    Click the current "standard" installer version. The file will be saved to your local disk.

    <img src="rufus-download.png" width="320" height="180"/>

=== "Step3"
    Execute the installer and allow for changes.

    <img src="rufus-allow-changes.png" width="320" height="180"/>

=== "Step4"
    Allow Rufus to check for updates.

    <img src="rufus-online-updates.png" width="320" height="180"/>

=== "Step5"
    Done. Installation finished.

    <img src="rufus-run.png" width="320" height="180"/>

#### For BIOS (or UEFI-CSM)
=== "Step1"
    
    <img src="rufus-main-screen-options-bios.png" width="320" height="180"/>
    
    1. Insert a USB flash drive with enough space
    3. Choose "MBR" as partition scheme
    5. Select "BIOS or UEFI" as target system
    6. Select "Large FAT32 (Default)" as file system
    7. Click "Start"

=== "Step2"
    Select "Write in ISO Image mode (Recommended).

    <img src="rufus-iso-image-mode-bios.png" width="320" height="180"/>

=== "Step3"
    Let Rufus download the latest syslinux files (if asked).

    <img src="rufus-syslinux-bios.png" width="320" height="180"/>

=== "Step4"
    Click "OK" to confirm the USB’s deletion and the bootable drive’s creation.

    <img src="rufus-warning-data-destruction-bios.png" width="320" height="180"/>

=== "Step5"
    Time to grab a coffee. Wait until the status is "Ready".

    <img src="rufus-status-bios.png" width="320" height="180"/>

=== "Step6"
    Close Rufus and eject the USB media.

    <img src="rufus-eject-bios.png" width="320" height="180"/>

#### For UEFI (non-CSM)
=== "Step1"
    
    <img src="rufus-main-screen-options-uefi.png" width="320" height="180"/>
    
    1. Insert a USB flash drive with enough space
    3. Choose "GPT" as partition scheme
    5. Select "UEFI (non-CSM)" as target system
    6. Select "Large FAT32 (Default)" as file system
    7. Click "Start"

=== "Step2"
    Select "Write in ISO Image mode (Recommended).

    <img src="rufus-iso-image-mode-uefi.png" width="320" height="180"/>

=== "Step3"
    Let Rufus download the latest syslinux files (if asked).

    <img src="rufus-syslinux-uefi.png" width="320" height="180"/>

=== "Step4"
    Click "OK" to confirm the USB’s deletion and the bootable drive’s creation.

    <img src="rufus-warning-data-destruction-uefi.png" width="320" height="180"/>

=== "Step5"
    Time to grab a coffee. Wait until the status is "Ready".

    <img src="rufus-status-uefi.png" width="320" height="180"/>

=== "Step6"
    Close Rufus and eject the USB media.

    <img src="rufus-eject-uefi.png" width="320" height="180"/>

### With Etcher
Todo...
<!--- start comment
#### Download and install Etcher
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For BIOS (or UEFI-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For UEFI (non-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
-->

## On Linux Mint 21
Todo...
<!--- start comment
### With tool X
#### Download and install tool X
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For BIOS (or UEFI-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For UEFI (non-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
### With tool Y
#### Download and install tool Y
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For BIOS (or UEFI-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
#### For UEFI (non-CSM)
tab1 screenshot
tab2 screenshot
tab3 screenshot
tab4 screenshot
-->