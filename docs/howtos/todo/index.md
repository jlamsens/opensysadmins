# Todo

## Howto's
- Howto acquire a valid Cisco IOS image
- Howto access a Cisco 2960 switch using a direct local serial console connection
- Howto install and configure a tFTP service on Linux Mint 21
- Howto install and configure a SSH service on Linux Mint 21
- Howto configure an IP address on Windows 11 / Linux Mint 21

## References
### Environment variables 
- What?
"Environment variables" or "boot loader environment variables" in ROMMON mode are separate from the configuration settings stored in the switch's running configuration (RAM) or startup configuration file (NVRAM). They are specific to the boot process and have different storage and management mechanisms compared to the regular switch configuration. 

- What not?
In IOS, the "show environment" command provides information about the environmental conditions and status of the switch, such as temperature, power supply, fan status, and other hardware-related information. These "environment variables" are not the same as the "boot loader environment variables" stored in the ROMMON's reserved memory space. Once the switch has booted into IOS, the IOS environment takes over, and the boot loader environment variables are not directly accessible or displayed within the IOS environment.

- Examples?
The exact set of available variables may vary depending on the specific switch model and firmware version, but some common boot loader environment variables:
BOOT, BAUD rate, CONFIG_FILE, SDM prefer template

- Where?
They are stored in NVRAM. The exact memory address or location of the boot loader environment variables in NVRAM is not exposed or accessible through user commands or configurations. It is managed by the firmware and is not intended to be modified directly by users. You *can* manipulate and view these variables through the ROMMON command interface or by using specific ROMMON commands such as "set" or "setenv" to modify or display their values. The firmware internally handles the storage and updates the corresponding values in the boot loader environment variables region of NVRAM.

The "set" command is used to modify runtime variables within ROMMON, which are temporary and not saved to NVRAM. On the other hand, the "setenv" command is used to modify the boot loader environment variables, which are persistent and stored in NVRAM.


### POST
- What?
Power-On Self Test (POST), a built-in diagnostic routine that runs independently of the operating system, executed during the boot process, when a Cisco device is powered on or restarted. The POST is executed before ROMMON is executed on Cisco devices.

- Task?
    -> the initial step that checks the critical hardware components (CPU, mem, interfaces, other hw modules) to ensure they are functioning correctly
    -> once the POST completes successfully and determines that the hardware is operational, the control is passed to the ROMMON firmware.

### ROMMON-mode
- What?
ROMMON (ROM Monitor): ROMMON is a seperate firmware component embedded in the hardware of Cisco devices, a small program that runs - after POST - when a device is powered on or during the boot process. Both ROMMON and the "boot loader" are essential components in the boot sequence of a Cisco device, working together to facilitate the startup and loading of the operating system.

- Task?
It is responsible for providing basic boot and recovery functionality.  
    -> It helps initialize the hardware
    -> load the boot loader from a specific location (such as flash memory, who ultimately loads the operating system)
    -> transfers control to the boot loader

### Boot loader
- What?
The "boot loader", also known as the "bootstrap loader" or simply "boot image," is the software responsible for loading the operating system (such as Cisco IOS) into memory and initiating its execution. It is loaded and executed by ROMMON. Both ROMMON and the "boot loader" are essential components in the boot sequence of a Cisco device, working together to facilitate the startup and loading of the operating system.

- Where?
Like ROMMON, it is also embedded in hardware and is considered a "firmware" component. It is typically stored in a separate section of memory, such as flash memory, which is non-volatile and retains its contents even when the device is powered off. This allows the boot loader to persist across reboots and provides the ability to upgrade or change the boot loader software when necessary. 

- Task?
    -> additional hardware initialization
    -> file system management
    -> loading the operating system image into memory

### Boot sequence switch
Power-On: The device is powered on or restarted.
POST (Power-On Self Test): The POST is executed to check the hardware components' functionality.
ROMMON: After the successful completion of the POST, control is handed over to ROMMON.
Boot Loader: ROMMON loads and executes the boot loader software.
Operating System: The boot loader loads and executes the operating system image.

### NVRAM
NVRAM (non-volatile RAM) is a type of memory that retains its contents even when the switch is powered off or restarted. It is used to store important system information, configuration settings, and environment variables.


### SDM template
- What?
The "show sdm prefer" command is used on Cisco switches to display the currently configured Switching Database Manager (SDM) template preference. The SDM templates determine how the switch allocates its resources for various functions, such as Layer 2 switching, Layer 3 routing, and multicast. The "show sdm prefer" command is useful for understanding the current resource allocation and capabilities of the switch based on the selected SDM template. It can help in determining if the switch has sufficient resources allocated for the desired features or if a different SDM template should be used to optimize resource utilization for specific requirements.

- Where?
The Switching Database Manager (SDM) template preference is not stored in the startup configuration. It is stored in a separate area of the switch's memory called the "switch profile". The switch profile is stored in a specific region of the switch's memory and is not part of the running configuration that is stored in NVRAM. When you configure the SDM template preference using the "sdm prefer" command, the switch profile is updated, and the preference takes effect after reload. However, the preference is not reflected in the running configuration file. Once you have configured the SDM template preference and reloaded the switch, the preference will be maintained and applied consistently upon subsequent reboots.