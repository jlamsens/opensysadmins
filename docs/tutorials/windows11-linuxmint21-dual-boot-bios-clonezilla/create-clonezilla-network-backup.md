# Create Clonezilla network backup
Let's take an image of our "gold PC" to a storage PC using SSH.

## Step1 -> 8

=== "Step1"
    Insert a [Clonezilla USB flash drive](../../howtos/clonezilla-bootable-usb-flash-drive/index.md){:target="_blank"}. Make sure the monitor is "on". Reboot the PC. In this case a "Fujitsu Esprimo", press ++f12++ once at the "Fujitsu splash screen" and wait. Specifics vary from computer to computer. Consult your hardware manual.
    
    <img src="../insert-usb.png" width="320" height="180"/>

=== "Step2"
    You get the "boot menu". Select the USB flash drive to boot from.
    
    <img src="../boot-menu.png" width="320" height="180"/>

=== "Step3"
    Select the first option.
    
    <img src="../clone01.jpg" width="320" height="180"/>

=== "Step4"
    English language.
    
    <img src="../clone02.jpg" width="320" height="180"/>

=== "Step5"
    Change keyboard layout.
    
    <img src="../clone03.jpg" width="320" height="180"/>

=== "Step6"
    Generic 105-key PC.
    
    <img src="../clone04.jpg" width="320" height="180"/>

=== "Step7"
    This is personal; I choose "Belgian".
    
    <img src="../clone05.jpg" width="320" height="180"/>

=== "Step8"
    This is personal; "Belgian" keyboard layout.
    
    <img src="../clone06.jpg" width="320" height="180"/>

## Step9 -> 16

=== "Step9"
    Leave default.
    
    <img src="../clone07.jpg" width="320" height="180"/>

=== "Step10"
    Leave default.
    
    <img src="../clone08.jpg" width="320" height="180"/>

=== "Step11"
    Leave default.
    
    <img src="../clone09.jpg" width="320" height="180"/>

=== "Step12"
    We will clone the disk to an image.
    
    <img src="../clone10.jpg" width="320" height="180"/>

=== "Step13"
    The image will be stored on a SSH server.
    
    <img src="../clone11.jpg" width="320" height="180"/>

=== "Step14"
    Depending on your network; I choose "DHCP".
    
    <img src="../clone12.jpg" width="320" height="180"/>

=== "Step15"
    My SSH server is at 192.168.1.105
    
    <img src="../clone13.jpg" width="320" height="180"/>

=== "Step16"
    The SSH service listens at port 22.
    
    <img src="../clone14.jpg" width="320" height="180"/>

## Step17 -> 24

=== "Step17"
    There is a regular user "guru" on the SSH server.
    
    <img src="../clone15.jpg" width="320" height="180"/>

=== "Step18"
    The image will be stored in guru's homedirectory, in an existing subdirectory "Downloads/DUMPS".
    
    <img src="../clone16.jpg" width="320" height="180"/>

=== "Step19"
    Read the message.
    
    <img src="../clone17.jpg" width="320" height="180"/>

=== "Step20"
    Acknowledge that you want to make a connection.
    
    <img src="../clone18.jpg" width="320" height="180"/>

=== "Step21"
    Enter the password for user "guru".
    
    <img src="../clone19.jpg" width="320" height="180"/>

=== "Step22"
    With a correct password, the remote folder gets mounted locally.
    
    <img src="../clone20.jpg" width="320" height="180"/>

=== "Step23"
    Select "Beginner".
    
    <img src="../clone21.jpg" width="320" height="180"/>

=== "Step24"
    We will save the local disk to an image.
    
    <img src="../clone22.jpg" width="320" height="180"/>

## Step25 -> 34

=== "Step25"
    Give a meaningful name.

    <img src="../clone23.jpg" width="320" height="180"/>

=== "Step26"
    The local disk "sda" is the source disk.

    <img src="../clone24.jpg" width="320" height="180"/>

=== "Step27"
    Select the "-z9p" compression option.
    
    <img src="../clone25.jpg" width="320" height="180"/>

=== "Step28"
    Skip checking the source file system.
    
    <img src="../clone26.jpg" width="320" height="180"/>

=== "Step29"
    Skip checking the saved image.
    
    <img src="../clone27.jpg" width="320" height="180"/>

=== "Step30"
    No need for encryption here.
    
    <img src="../clone28.jpg" width="320" height="180"/>

=== "Step31"
    Poweroff the PC when the dump is completed.
    
    <img src="../clone29.jpg" width="320" height="180"/>

=== "Step32"
    Notice the command with all the options. Press ++enter++ to begin.
    
    <img src="../clone30.jpg" width="320" height="180"/>

=== "Step33"
    Confirm "y" to continue.
    
    <img src="../clone31.jpg" width="320" height="180"/>

=== "Step34"
    Grab a coffee. This can take a while. The PC will be powered off at the end.
    
    <img src="../clone32.jpg" width="320" height="180"/>