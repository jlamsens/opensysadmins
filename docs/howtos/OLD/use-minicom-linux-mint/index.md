# Use minicom on Linux Mint 21

## Prereqs
- a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/index.md){:target="_blank"}/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/index.md){:target="_blank"}) running Linux Mint 21
- internet connection
- a serial/console cable
- a Cisco device (switch, router)

## Setup
<img src="console-access.png"/>

## Install minicom
Refresh the cache and install the package.
=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo apt update; sudo apt install minicom -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo apt update; sudo apt install minicom -y
    [sudo] password for guru:     
    Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease
    Hit:2 http://archive.ubuntu.com/ubuntu jammy InRelease
    ...
    ...
    Processing triggers for man-db (2.10.2-1) ...
    Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
    guru@lab:~$ 
    ```

## Identify serial port
Your Cisco device is connected to the Linux Mint LAB-PC using a serial cable. On that PC, run the following command to list the available serial ports. Note down the name of the serial port (e.g. `/dev/ttyUSB0`) corresponding to your device.

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    dmesg | grep tty
    ```

=== "output"

    ``` title='' hl_lines="3"
    guru@lab:~$ dmesg | grep tty
    [    0.206150] printk: console [tty0] enabled
    [18977.539042] usb 1-4: pl2303 converter now attached to ttyUSB0
    guru@lab:~$ 
    ```

## Configure and use minicom
In the terminal, run the following command to start the "Minicom configuration" and then "Minicom".

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo minicom -s
    sudo minicom
    ```

=== "output"
    In the Minicom configuration menu, use the arrow keys to navigate and configure the settings as follows:

    - Select "Serial port setup"
    - Set the serial device to the one you noted down earlier (e.g. "/dev/ttyUSB0")
    - Set the baud rate according to your device's specifications (e.g. "9600")
    - Leave other settings at their default values, unless you have specific requirements
    - Press "Save setup as dfl" to save the configuration.
    - Press "Exit from Minicom". 

    These settings will be saved in file `/etc/minicom/minirc.dfl` for all future runs.

## Alternative use
Instead of doing the setup first, you can give the correct parameters on the commandline instead. Minicom will open and display the terminal window.


=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo minicom -b 9600 -D /dev/ttyUSB0
    ```

=== "output"
    Press ++enter++ to access the switch/router prompt. To exit Minicom, press the keyboard shortcut ++ctrl++ ++a++ followed by the letter ++x++

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 14:06:27

    Press CTRL-A Z for help on special keys


    <press ENTER>

    Switch>
    ```
