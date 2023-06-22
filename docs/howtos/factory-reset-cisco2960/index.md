# Factory reset a Cisco 2960 switch

## Prereqs
- a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/)/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/)) running Linux Mint 21
- [minicom](../install-minicom-linux-mint/index.md) terminal emulation software
- a working IOS, so if necessary first [(re)install an IOS operating system](../reinstall-ios-cisco2960/index.md)

Following commands can be executed from within IOS or from within [ROMMON-mode](../access-cisco-device-rommon/index.md).

## Erase startup configuration

=== "Step1"
    Check if the startup configuration is empty. If not, the file exists. In IOS the file is known as startup-config. In ROMMON, the file is config.text.

    ``` title='' hl_lines="5 12"
    --- From IOS ---
    Switch#dir nvram:startup-config
    Directory of nvram:/startup-config

        65  -rw-        1326                    <no date>  startup-config
    ...

    --- From ROMMON ---
    switch: dir flash:
    Directory of flash:/
       ...
       11  -rwx  1362      <date>               config.text
       ...
    ```

=== "Step2"
    If necessary, erase the file using "erase startup-config", "erase nvram:" or "write erase" from IOS. In ROMMON, use the delete command.

    ``` title='' hl_lines="4"
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
    Verify.

    ``` title='' hl_lines="3 8"
    --- From IOS ---
    Switch#show startup-config 
    startup-config is not present
    Switch#

    --- From ROMMON ---
    switch: dir flash:config.text
    unable to stat flash:config.text/: no such file or directory

    switch: 

    ```
## Erase vlan.dat

=== "Step1"
    Check if the VLAN database file exists.

    ``` title='' hl_lines="5 12"
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

    ``` title='' hl_lines="0"
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

    ``` title='' hl_lines="5 13"
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
    Check if the password recovery mechanism is enabled or disabled.

    ``` title='' hl_lines="0"
    Switch#show ver | incl password-recovery
    The password-recovery mechanism is disabled.
    Switch#
    ```

=== "Step2"
    If necessary, enable it.

    ``` title='' hl_lines="0"
    Switch#conf t
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#service password-recovery 
    Switch(config)#end
    Switch#
    ```

=== "Step3"
    Verify.

    ``` title='' hl_lines="0"
    Switch#show ver | incl password-recovery
    The password-recovery mechanism is enabled.
    Switch#
    ```

## Set default SDM template

=== "Step1"
    Show the current SDM prefer template. For example:

    ``` title='' hl_lines="3 13"
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
    If necessary, change it back to the default. We will reload the switch at the end.

    ``` title='' hl_lines="9 16"
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

    ``` title='' hl_lines="3 7"
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
    Command "show boot" should look something like this. Most of these variables can be set from within IOS and/or ROMMON.

    ``` title='' hl_lines="0"
    Switch#show boot
    BOOT path-list      : flash:c2960-lanbasek9-mz.152-7.E7.bin
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
    Example1: BOOT path-list.

    ``` title='' hl_lines="0"
    From IOS:
    Switch(config)# boot system flash:<ios-file>

    From ROMMON:
    switch: set BOOT flash:<ios-file>
    ```

=== "Step3"
    Example2: BOOT manual.

    ``` title='' hl_lines="0"
    From IOS:
    Switch(config)# no boot manual
    Switch(config)#

    From ROMMON:
    switch: unset MANUAL_BOOT

    switch:
    ```

## Reload

``` title='' hl_lines="0"
--- From IOS ---
Switch#reload
System configuration has been modified. Save? [yes/no]:     -----> answer "no"
Proceed with reload? [confirm]                              -----> press "Enter"

--- From ROMMON ---
switch:reset
```

## Clean switch
Say hi to the wizard. Answer "no".

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
Switch>ena
Switch#
```