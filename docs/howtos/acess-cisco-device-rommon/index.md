# Access a Cisco device in ROMMON-mode
## Cisco 2960 switch
### From IOS

=== "StepX"
    <todo>

### Missing or corrupt IOS

=== "Step1"
    Let's simulate a non-working IOS by "accidently" erasing the flash filesystem. Restart the switch afterwards.

    ``` title='' hl_lines="0"
    Switch#erase flash:
    Erasing the flash filesystem will remove all files! Continue? [confirm]
    flashfs[2]: 0 files, 1 directories
    flashfs[2]: 0 orphaned files, 0 orphaned directories
    flashfs[2]: Total bytes: 65544192
    flashfs[2]: Bytes used: 1024
    flashfs[2]: Bytes available: 65543168
    flashfs[2]: flashfs fsck took 25 seconds.
    Erase of flash: complete
    Switch#
    Switch#reload

    System configuration has been modified. Save? [yes/no]: no  <----- if asked
    Proceed with reload? [confirm]

    ```

=== "Step2"
    The BOOT environment variable is still set to boot c2960-lanbasek9-mz.152-7.E7.bin but it's not there. The switch will not be able to boot and will enter ROMMON-mode automatically.

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 09:36:24

    Press CTRL-A Z for help on special keys


    Boot Sector Filesystem (bs) installed, fsid: 2
    Base ethernet MAC Address: 6c:41:0e:18:0b:00
    Xmodem file system is available.
    The password-recovery mechanism is enabled.
    Initializing Flash...
    flashfs[0]: 1 files, 1 directories
    flashfs[0]: 0 orphaned files, 0 orphaned directories
    flashfs[0]: Total bytes: 65544192
    flashfs[0]: Bytes used: 3584
    flashfs[0]: Bytes available: 65540608
    flashfs[0]: flashfs fsck took 18 seconds.
    ...done Initializing Flash.
    done.
    Loading "flash:/c2960-lanbasek9-mz.152-7.E7.bin"...flash:/c2960-lanbasek9-mz.152-7.E7.bin: no such file or directory

    Error loading "flash:/c2960-lanbasek9-mz.152-7.E7.bin"

    Interrupt within 5 seconds to abort boot process.
    Boot process failed...

    The system is unable to boot automatically.  The BOOT
    environment variable needs to be set to a bootable
    image.


    switch:
    ```

### Cold start

=== "Step1"
    First disconnect the power cable from the switch. Minicom gives no output yet.

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 13:50:27

    Press CTRL-A Z for help on special keys

    <blinking_cursor>
    ```

=== "Step2"
    Now reconnect the power cable. The switch boots and while doing the POST, the SYST LED blinks green.
    This takes about X seconds. After POST, the blinking LED changes pattern. Press the Mode button once. The switch _does not_ initialize Flash and enters ROMMON-mode.

    ``` title='' hl_lines="0"
    Welcome to minicom 2.8

    OPTIONS: I18n 
    Port /dev/ttyUSB0, 09:44:08

    Press CTRL-A Z for help on special keys


    Boot Sector Filesystem (bs) installed, fsid: 2
    Base ethernet MAC Address: 6c:41:0e:18:0b:00
    Xmodem file system is available.
    The password-recovery mechanism is enabled.
    Initializing Flash...
    flashfs[0]: filesystem check interrupted!
    ...done Initializing Flash.

    The system has been interrupted, or encountered an error
    during initialization of the flash filesystem.  The following
    commands will initialize the flash filesystem, and finish
    loading the operating system software:

        flash_init
        boot


    switch:
    ```