# Configure VM

## Download ISO
=== "Step1"
    Use your favorite search engine to search for the Windows Server 2022 iso and choose the official Microsoft website.

    <img src="../windows2022-search-iso.png" width="320" height="180"/>

=== "Step2"
    Select "Download the ISO".

    <img src="../windows2022-download-iso.png" width="320" height="180"/>

=== "Step3"
    Fill in the form and click "Download".

    <img src="../windows2022-form.png" width="320" height="180"/>

=== "Step4"
    Select "English (United States)", the 64-bit edition". The ISO file will be downloaded...

    <img src="../windows2022-en64.png" width="320" height="180"/>

=== "Step5"
    ...and saved to your local disk.

    <img src="../windows2022-localdisk.png" width="320" height="180"/>


## Edit settings

<img src="../edit-settings.png" width="320" height="180"/>

## General -> Advanced 
Enable copy/paste in both directions.

<img src="../bidirectional.png" width="320" height="180"/>

## System -> Motherboard
First boot from disk. If there is no OS found, boot from the "virtual CD" (.ISO file).

<img src="../boot-sequence.png" width="320" height="180"/>

## System -> Processor
Add a little bit of extra CPU power.

<img src="../cpu-power.png" width="320" height="180"/>


## Storage

=== "Step1"
    Add a virtual optical disk.

    <img src="../virtual-cd.png" width="320" height="180"/>

=== "Step2"
    Select "Add" and browse to "/home/guru/Downloads". Select the .ISO file and select "Open".

    <img src="../optical-disk-file.png" width="320" height="180"/>

=== "Step3"
    Select "Choose".

    <img src="../optical-disk-choose.png" width="320" height="180"/>

## Audio
We do not need audio.

<img src="../no-audio.png" width="320" height="180"/>

## Network
Select "NAT Network" and "NATNetwork" at the dropdown boxes.

<img src="../nat-network.png" width="320" height="180"/>

## Shared folder
Click on the + sign. Browse to "/home/guru/Downloads". Put a checkmark at "Auto-mount".

<img src="../shared-folder.png" width="320" height="180"/>


## Current settings

<img src="../endresult.png" width="320" height="180"/>