# Factory reset a Cisco 2960 switch

## Prereqs
- a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/)/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/)) running Linux Mint 21
- [minicom](../use-minicom-linux-mint/index.md) terminal emulation software
- a working IOS, so if necessary first [(re)install an IOS operating system](../reinstall-ios-cisco2960/index.md)

Following commands can be executed from within IOS or from within [ROMMON-mode](../access-cisco-device-rommon/index.md).

## Erase nvram contents

=== "Step1"
    Check the nvram filesystem. If you saved the running configuration to the startup configuration, a configuration file known as `startup-config` will be present. It is possible that other files are there too. In ROMMON, the file is named `config.text`. Notice, you cannot access `nvram:` from ROMMON, but have to use the flash filesystem to get to that file (symbolic link).

    ``` title='' hl_lines="1 17"
    --- From IOS ---

    Switch#dir nvram:
    Directory of nvram:/

        62  -rw-        1296                    <no date>  startup-config
        63  ----           5                    <no date>  private-config
        1   ----          35                    <no date>  persistent-data
        2   -rw-           0                    <no date>  ifIndex-table
        3   -rw-        1296                    <no date>  test2.txt
        5   -rw-        1296                    <no date>  test1.txt

    65536 bytes total (58039 bytes free)
    Switch#


    --- From ROMMON ---
    switch: dir flash:
    Directory of flash:/

        2  -rwx  11832960  <date>               c2960-lanbasek9-mz.150-2.SE11.bin
        3  -rwx  1296      <date>               config.text
        5  -rwx  5         <date>               private-config.text
        6  -rwx  6168      <date>               multiple-fs

    53701120 bytes available (11843072 bytes used)

    switch: 
    ```

=== "Step2"
    If you only want to erase all configuration files, use `erase startup-config`, `erase nvram:` or `write erase` from IOS. In ROMMON, use the `delete` command on the flash filesystem.

    ``` title='' hl_lines="1 9"
    --- From IOS ---
    Switch#erase startup-config 
    Erasing the nvram filesystem will remove all configuration files! Continue? [confirm]
    [OK]
    Erase of nvram: complete
    Switch#


    --- From ROMMON ---
    switch: delete flash:config.text
    Are you sure you want to delete "flash:config.text" (y/n)?y
    File "flash:config.text" deleted

    switch: 
    ```

=== "Step3"
    For a clean setup, it is better to erase *everything* using `erase /all nvram:` from IOS. You cannot do that from ROMMON.

    ``` title='' hl_lines="1 18"
    --- From IOS ---
    Switch#erase /all nvram:
    Erasing the nvram filesystem will remove all files! Continue? [confirm]
    [OK]
    Erase of nvram: complete
    
    Switch#dir nvram:
    Directory of nvram:/

    62  -rw-           0                    <no date>  startup-config
    63  ----           0                    <no date>  private-config
    1   ----          35                    <no date>  persistent-data

    65536 bytes total (64460 bytes free)
    Switch#


    --- From ROMMON ---
    switch: dir flash:config.text
    unable to stat flash:config.text/: no such file or directory

    switch: 

    ```
## Erase vlan.dat

=== "Step1"
    The VLAN database file is saved in flash. Check if the file exists.

    ``` title='' hl_lines="1 8"
    --- From IOS ---
    Switch#dir flash:vlan.dat
    Directory of flash:/vlan.dat

        7  -rwx         616   Mar 1 1993 00:07:06 +00:00  vlan.dat
    ...

     --- From ROMMON ---
    switch: dir flash:
    Directory of flash:/
        ...
        8  -rwx  616       <date>               vlan.dat
    ...
    
    switch:
    ```

=== "Step2"
    If necessary, delete the VLAN database.

    ``` title='' hl_lines="1 7"
    --- From IOS ---
    Switch#delete vlan.dat
    Delete filename [vlan.dat]? 
    Delete flash:/vlan.dat? [confirm]
    Switch#

    --- From ROMMON ---
    switch: delete flash:vlan.dat
    Are you sure you want to delete "flash:vlan.dat" (y/n)?y
    File "flash:vlan.dat" deleted

    switch: 
    ```

=== "Step3"
    Verify.

    ``` title='' hl_lines="1 9"
    --- From IOS ---
    Switch#dir flash:
    Directory of flash:/
        ...
        <no vlan.dat>
        ...
    Switch#

    --- From ROMMON ---
    switch: dir flash:
    Directory of flash:/
        ...
        <no vlan.dat>
        ...
    switch: 
    ```

## Enable password recovery mechanism

=== "Step1"
    Check if the password recovery mechanism is enabled or disabled. In this example, it is disabled.

    ``` title='' hl_lines="1 7"
    --- From IOS ---
    Switch#show ver | incl password-recovery
    The password-recovery mechanism is disabled.
    Switch#


    --- From ROMMON ---
    switch: set
    ...
    PASSWD_RECOVERY=no
    ...
    switch:
    ```

=== "Step2"
    If necessary, enable it.

    ``` title='' hl_lines="1 9"
    --- From IOS ---
    Switch#conf t
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#service password-recovery 
    Switch(config)#end
    Switch#


    --- From ROMMON ---
    switch: unset PASSWD_RECOVERY

    switch: 
    ```

=== "Step3"
    Verify.

    ``` title='' hl_lines="1 7"
    --- From IOS ---
    Switch#show ver | incl password-recovery
    The password-recovery mechanism is enabled.
    Switch#


    --- From ROMMON ---
    switch: set
    ...
    <no PASSWD_RECOVERY variable present>
    ...
    ```

## Set default SDM template

=== "Step1"
    Show the current SDM prefer template. For example:

    ``` title='' hl_lines="1 10"
    --- From IOS ---
    Switch#show sdm prefer 
    The current template is "dual-ipv4-and-ipv6 default" template.
    The selected template optimizes the resources in
    the switch to support this level of features for
    0 routed interfaces and 255 VLANs. 
    ...
    ...

    --- From ROMMON ---
    switch: set
    ...
    SDM_TEMPLATE_ID=2
    ...
    ```

=== "Step2"
    If necessary, change it back to the default. We will reload/boot the switch at the end.

    ``` title='' hl_lines="1 15"
    --- From IOS ---
    Switch#conf t
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#sdm prefer ?
    default             Default bias
    dual-ipv4-and-ipv6  Support both IPv4 and IPv6
    lanbase-routing     Supports both IPv4 and IPv6 Static Routing
    qos                 QoS bias
    Switch(config)#sdm prefer default 
    Changes to the running SDM preferences have been stored, but cannot take effect 
    until the next reload.
    Use 'show sdm prefer' to see what SDM preference is currently active.
    Switch(config)#end

    --- From ROMMON ---
    switch: unset SDM_TEMPLATE_ID

    switch:
    ```

=== "Step3"
    Verify.

    ``` title='' hl_lines="1 9"
    --- From IOS ---
    Switch#show sdm prefer 
     The current template is "dual-ipv4-and-ipv6 default" template.
     The selected template optimizes the resources in...
    ...
    ...
    On next reload, template will be "default" template.

    --- From ROMMON ---
    switch: set
    ...
        <no SDM_TEMPLATE_ID>
    ...    
    ```

## Set default environment variables

=== "Step1"
    Command `show boot` should look something like this. Most of these variables can be set from within IOS and/or ROMMON.

    ``` title='' hl_lines="0"
    Switch#show boot
    BOOT path-list      : flash:/c2960-lanbasek9-mz.150-2.SE11.bin
    Config file         : flash:/config.text
    Private Config file : flash:/private-config.text
    Enable Break        : yes
    Manual Boot         : no
    Allow Dev Key         : yes
    HELPER path-list    : 
    Auto upgrade        : yes
    Auto upgrade path   : 
    NVRAM/Config file
        buffer size:   65536
    Timeout for Config
            Download:    0 seconds
    Config Download 
        via DHCP:       disabled (next boot: disabled)
    ```

=== "Step2"
    Example1: *only if necessary*, correct the "BOOT path-list" parameter

    ``` title='' hl_lines="1 4"
    From IOS:
    Switch(config)# boot system flash:/c2960-lanbasek9-mz.150-2.SE11.bin

    From ROMMON:
    switch: set BOOT flash:/c2960-lanbasek9-mz.150-2.SE11.bin
    ```

=== "Step3"
    Example2: *only if necessary*, correct the "BOOT manual" parameter.

    ``` title='' hl_lines="1 5"
    From IOS:
    Switch(config)# no boot manual
    Switch(config)#

    From ROMMON:
    switch: unset MANUAL_BOOT

    switch:
    ```

=== "Step4"
    Example3: *only if necessary*, correct the "Enable break" parameter.

    ``` title='' hl_lines="1 5"
    From IOS:
    Switch(config)# boot enable-break
    Switch(config)#

    From ROMMON:
    switch: unset ...

    switch:
    ```


## Reload

``` title='' hl_lines="1 6"
--- From IOS ---
Switch#reload
System configuration has been modified. Save? [yes/no]:     -----> answer "no"
Proceed with reload? [confirm]                              -----> press "Enter"

--- From ROMMON ---
switch:reset
```

## Clean switch
Say hi to the wizard. Answer "no" at the prompt. Now just pull the power plug to shutdown the switch, as there is no on/off switch like on e.g. a Cisco 1941 router.

``` title='' hl_lines="0"
        --- System Configuration Dialog ---

Enable secret warning
----------------------------------
In order to access the device manager, an enable secret is required
If you enter the initial configuration dialog, you will be prompted for the enable secret
If you choose not to enter the intial configuration dialog, or if you exit setup without setting the enable secret,
please set an enable secret using the following CLI in configuration mode-
enable secret 0 <cleartext password>
----------------------------------
Would you like to enter the initial configuration dialog? [yes/no]:     -----> answer "no"
Switch>enable
Switch#
```
