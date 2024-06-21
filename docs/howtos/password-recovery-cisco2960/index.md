# Password recovery on a Cisco 2960 switch

## Prereqs
* a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/){:target="_blank"}/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/){:target="_blank"}) running Linux Mint 21
    * [minicom](../use-minicom-linux-mint/index.md){:target="_blank"} terminal emulation software
* a serial console cable
* a Cisco 2960 24TT-L or 24TC-L Plus switch
    * a [working IOS](../reinstall-ios-cisco2960/index.md){:target="_blank"}, but inaccessible (forgotten console and/or enable password)

## Setup

<img src="console-access.png"/>

## Situation
The "console password" and "enable password" (Privileged EXEC mode) are - amongst other switch configuration settings - stored in startup-config (NVRAM). Recovery of a lost password is only useful if you have a inacessible (but working) IOS. If not, you have a bigger problem and have to [(re)install an IOS operating system](../reinstall-ios-cisco2960/index.md) first.

=== "Problem1"
    No access to the console.

    ``` title='' hl_lines="0"
    ...
    User Access Verification

    Password:           <--- enter wrong password
    Password:           <--- enter wrong password
    Password:           <--- enter wrong password
    % Bad passwords
    ```

=== "Problem2"
    Access to the console, but no access to privileged exec mode.

    ``` title='' hl_lines="0"
    Switch>enable
    Password:           <--- enter wrong password
    Password:           <--- enter wrong password
    Password:           <--- enter wrong password
    % Bad secrets

    Switch>
    ```

## ROMMON
[Boot the switch in ROMMON-mode](../access-cisco-device-rommon/index.md){:target="_blank"} using a cold start. If the password recovery mechanism is *enabled*, it is possible to either keep the startup configuration file or choose to discard it. If the password recovery mechanism is *disabled*, you are forced to discard all device configuration.

### Password recovery mechanism enabled


=== "Step1"
    List the files stored in flash. The startup configuration file in this mode is named "config.text".

    ``` title='' hl_lines="0"
    switch: dir flash:
    Directory of flash:/

        2  -rwx  15979776  <date>               c2960-lanbasek9-mz.150-2.SE11.bin
        3  drwx  128       <date>               pnp-tech
        4  drwx  0         <date>               pnp-info
        5  -rwx  1781      <date>               config.text
        8  -rwx  1921      <date>               private-config.text
        9  -rwx  3096      <date>               multiple-fs

    49462784 bytes available (16081408 bytes used)

    switch: 
    ```

=== "Step2"
    Optional: should you choose to *keep* the startup configuration file, temporary rename that file. If not, skip this step.

    ``` title='' hl_lines="0"
    switch: rename flash:config.text flash:config.text.bak
    switch:
    ```

=== "Step3"
    Optional: should you choose to *discard* the startup configuration file, delete that file. If not, skip this step.

    ``` title='' hl_lines="0"
    switch: delete flash:config.text
    switch:
    ```

=== "Step4"
    Boot the switch manually.

    ``` title='' hl_lines="0"
    switch: boot
    Loading "flash:c2960-lanbasek9-mz.150-2.SE11.bin"...@@@@@@@@@@@@@@@@@
    ...
    ```

### Password recovery mechanism disabled
If the password recovery mechanism is disabled, it was not possible to keep the startup configuration file and you had to reset the system back to the default configuration.

=== "Step1"
    List the files stored in flash. The startup configuration file is absent!

    ``` title='' hl_lines="0"
    switch: dir flash:
    Directory of flash:/

        2  -rwx  15979776  <date>               c2960-lanbasek9-mz.150-2.SE11.bin
        3  drwx  128       <date>               pnp-tech
        4  drwx  0         <date>               pnp-info
        8  -rwx  5         <date>               private-config.text
        9  -rwx  3096      <date>               multiple-fs

    49415168 bytes available (16129024 bytes used)

    switch: 
    ```

=== "Step2"
    Boot the switch manually.

    ``` title='' hl_lines="0"
    switch: boot
    Loading "flash:c2960-lanbasek9-mz.150-2.SE11.bin"...@@@@@@@@@@@@@@@@@
    ...
    ```

## IOS

=== "Step1"
    At this point, there is no startup configuration file (only a backup startup configuration file, if chosen). Enter "no" at the initial configuration setup prompt and change to privileged exec mode.

    ``` title='' hl_lines="0"
            --- System Configuration Dialog ---

    Would you like to enter the initial configuration dialog? [yes/no]:     -----> enter "no"
    Switch>enable
    Switch#
    ```

=== "Step2"
    If you have a backup startup configuration file and want to restore it, copy the contents of the backup startup configuration file to the running configuration and delete that backup file. If not, skip this step.

    ``` title='' hl_lines="0"
    Switch#copy flash:config.text.bak running-config
    Destination filename [running-config]?                  ---> ENTER
    % Login disabled on line 1, until 'password' is set
    % Login disabled on line 2, until 'password' is set
    % Login disabled on line 3, until 'password' is set
    % Login disabled on line 4, until 'password' is set
    % Login disabled on line 5, until 'password' is set
    % Login disabled on line 6, until 'password' is set
    % Login disabled on line 7, until 'password' is set
    % Login disabled on line 8, until 'password' is set
    % Login disabled on line 9, until 'password' is set
    % Login disabled on line 10, until 'password' is set
    % Login disabled on line 11, until 'password' is set
    % Login disabled on line 12, until 'password' is set
    % Login disabled on line 13, until 'password' is set
    % Login disabled on line 14, until 'password' is set
    % Login disabled on line 15, until 'password' is set
    % Login disabled on line 16, until 'password' is set
    1781 bytes copied in 0.964 secs (1848 bytes/sec)
    
    Switch#delete flash:config.text.bak
    Delete filename [config.text.bak]?                      ---> ENTER
    Delete flash:/config.text.bak? [confirm]                ---> ENTER
    Switch#
    ```

=== "Step3"
    Set the necessary password(s) and obscure the console clear-text password.

    ``` title='' hl_lines="0"
    Switch#configure terminal 
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#enable secret cisco-EN-pass
    Switch(config)#line console 0
    Switch(config-line)#password cisco-CON-pass
    Switch(config-line)#login
    Switch(config-line)#exit
    Switch(config)#service password-encryption 
    Switch(config)#end
    Switch#
    ```

=== "Step4"
    Copy the running configuration to the startup configuration. Restart the switch.

    ``` title='' hl_lines="0"
    Switch#copy running-configuration startup-configuration         
    Building configuration...
    [OK]

    Switch#reload
    Proceed with reload? [confirm]                          ---> ENTER

    *Mar  1 00:15:53.633: %SYS-5-RELOAD: Reload requested by console. Reload Reason: Reload command.
    ...
    ```

=== "Step5"
    Login using the new console password. Enter privileged exec mode using the new "enable" password.

    ``` title='' hl_lines="0"
    User Access Verification

    Password:                                               ---> enter "cisco-CON-pass"

    Switch>

    Switch>enable
    Password:                                               ---> enter "cisco-EN-pass"
    Switch#
    ```