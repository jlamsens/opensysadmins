# Cisco switch and router components

The hardware components of a Cisco switch and router include the following:

## Chassis
The physical casing that houses all internal components of the switch. It includes mounting options for rack or wall installation.

## Power Supply Unit (PSU)
Provides the necessary power to the switch. Some models come with internal power supplies, while others support external power supplies. Additionally, some models offer Power over Ethernet (PoE) or PoE+ capabilities.

## Central Processing Unit (CPU)
Manages the switch's operations, processing control plane activities, and executing the switch's operating system (IOS).

## Memory
Cisco devices have many different locations where they can store images, configuration files, and microcode.

### FLASH
- non-volatile (permanent) after reboot
- a kind of EEPROM designed for high speed and high density
- different types, depending on the hardware (EPROM, SIMM, DIMM, Flash memory card)
- stores the Cisco "IOS image" and VLAN database file "vlan.dat"
- different forms, depending on the hardware
    - internal (onboard)
        - flash:
            - the main “Flash memory storage area” on all platforms
            - alias slot0: for platforms without a device named flash:
            - can store as many "IOS images" as there is space to hold
        - bootflash:
            - depending on model/essentially the difference is just naming convention between ”flash:” and “bootflash:”
            - can store "images", "configuration files", crashinfo, … but generally hosts a (small basic) "bootloader program” on high-end systems
    
    - external (removable)
        - a Flash memory card that is inserted in to a Personal Computer Memory Card International Association (PCMCIA) slot
        - additional flash memory
        - slot0: PCMCIA flash card in slot0, slot1: PCMCIA flash card in slot1
- some routers, including the Cisco 2500 series routers, do not have sufficient RAM to hold the Cisco "IOS image" and, therefore, run the Cisco "IOS image" directly from flash memory (Cisco IOS images that are run from flash memory are not compressed)
- has a directory structure and typical flash commands (dir, format, copy, del)

### (SD)RAM
- (Synchronous Dynamic) Random Access Memory
- volatile (temporary memory)
- 2 types:
    - primary, main, or processor memory, which is reserved for the CPU to execute Cisco IOS software and to hold the running configuration and routing tables
    - shared, packet, or I/O memory, which buffers data transmitted or received by the router’s network interfaces
- provides temporary storage for the operating system during runtime and for data structures used by the CPU
- fastest amongst all memories
- often comes on dual in-line memory modules (DIMMs)
- runs the "IOS image"

### NVRAM
- Non Volatile Random Access Memory
- small chunk of RAM between 32 K and 128 K in size
- kept alive by a battery in the system board so the contents are not lost
- stores the "startup-configuration" and the software "configuration register"

### (EP)ROM
- (Electrically Erasable) Read Only Memory
- non-volatile (permanent): code defined in silicon, cannot accidentally be erased by users
- often referred to simply as "ROM"
- stores hardcoded micro-code: POST, bootstrap, ROMMON, RXBoot (mini-IOS), ...
    
## Switching Fabric
The internal architecture that handles data packet processing and switching within the switch.

## Network Ports
- Ethernet Ports: The primary interfaces for connecting devices, available in various speeds (Fast Ethernet, Gigabit Ethernet).
- Uplink Ports: Often support higher speeds (Gigabit or 10 Gigabit Ethernet) and are used to connect to other switches or routers in the network.

## PoE Controllers
In PoE models, these controllers manage the power distribution to connected devices (such as IP phones or wireless access points) over Ethernet cables.

## LED Indicators
Provide status information for power, network activity, and port status, helping with troubleshooting and monitoring.

## Cooling System
Includes fans and heat sinks to manage the thermal output and maintain optimal operating temperatures for the switch components.

## Console and Management Ports
- Console Port: Used for initial setup and configuration via a direct serial connection.
- Management Ethernet Port: Provides out-of-band management access to the switch.

## ASICs 
Application-Specific Integrated Circuits: custom chips designed to handle specific tasks such as packet forwarding, QoS (Quality of Service), and security features, offloading these tasks from the CPU.

## Backplane
The internal data pathway that interconnects the various components, allowing data to move efficiently within the switch.

These components work together to provide the functionality required for network connectivity, management, and performance in an enterprise environment.
