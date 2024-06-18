# Cisco switch and router boot sequence

## General overview
- Power-On Self Test (POST)
- Boot Loader Initialization
- Loading the Cisco IOS Image
- Loading the Configuration
- System Initialization

## Step-by-step boot process

### Power-On Self Test (POST)
- When a Cisco router or switch is powered on, it performs a Power-On Self Test (POST) to verify the integrity and functionality of its hardware components, including:
    - CPU
    - memory
    - network interfaces
    - detect new installed components (added memory, ...)

- A switch, for example, checks its system LEDs during this phase, and the System LED will initially be amber. Because a full operating system has not yet been loaded when the switch performs POST, it needs a way to tell the human user if POST worked well, if it failed partly, or if the switch is totally unusable. To communicate the status, the switch uses the light-emitting diodes (LEDs) on the front panel of the switch. During POST, these LEDs have one set of meanings; during normal operation, the LEDs are used for other purposes.

- The POST is stored in and run from ROM.

### Boot Loader Initialization
- The "boot loader", also called "boot loader program" or "boot loader image" or "system bootstrap" or "bootstrap", is the first program executed after "POST". 
 It:
    - initializes the basic hardware components, including the CPU, memory and interfaces
    - provides basic system functions such as access to the file system in "flash" memory and network interfaces
    - locates the "IOS image" in a certain order, depending on the value of the "configuration register".

- It is a small, specialized piece of software/program (no IOS!) typically stored in and run from "flash" memory or a dedicated "boot ROM".

=== "Boot loader mode"
    The boot loader provides a command-line interface (CLI) that allows for recovery and diagnostic functions. If the main IOS image cannot be loaded, the "boot loader mode" can be used to perform tasks such as loading a new IOS image, recovering passwords, or formatting the flash memory.

    ``` title='' hl_lines="0"
    ...
    switch:
    ...
    ```

=== "ROMMON-mode"
    ROMMON-mode is a lower-level diagnostic and recovery environment than the "boot loader mode". It provides a more comprehensive set of commands for troubleshooting, hardware diagnostics, and recovery operations. It is used when the device fails to load the "boot loader" or "IOS", or when manually invoked for recovery purposes using "break" or via the "configuration register". "Break" (system interrupt) is always enabled for 60 seconds after the router reboots, regardless of whether it is configured on or off in the "configuration register". During this 60-second window, you can break to the ROM monitor prompt by pressing the "Break key".

    ``` title='' hl_lines="0"
    ...
    rommon 1>
    ...
    ```

=== "RXBOOT"
    Older routers (e.g. Cisco AS2511 or Cisco 1600) would actually run IOS straight from FLASH, so you could not overwrite it whilst running, they did not have the ability to load an IOS image via the network either, so you needed to use RXBOOT, a reduced command set image. It contains only IP-code (but no routing capabilities!) just to able to boot from tFTP and mainly used to download "system images" to a router. You can see it as an intermediate step between the ROMMON mode and the IOS mode.
    RXBOOT is also called:

    - a "mini operating system" (0x2101)
    - a "MINI-IOS"
    - a "limited functions IOS"
    - a "limited feature IOS"
    - a "partial IOS"
    - a "cut-down version of IOS"
    - a "stripped down version of IOS"
    - a "helper image"
    - a "subset of IOS image"

    Modern day routers don’t have that (0x2102). RXBOOT is stored in ROM (low-end routers) or bootflash (high-end routers).

    ``` title='' hl_lines="0"
    ...
    X
    ...
    ```

### Loading the Cisco IOS Image
The "configuration register" is a special 16-bit value used to control various aspects of the device's behavior during the boot process. This register can be configured to alter how the device behaves when it starts up, including how it locates its operating system image and how it handles its "startup configuration".





### Loading the Configuration

### System Initialization

## Recovery and troubleshooting
"boot loader mode" (switch: prompt). A Cisco router drops into "ROMMON-mode" or "ROM monitor MODE" (rommon 1> prompt). A switch "boot loader mode" is not the same as a router "ROMMON-mode"!