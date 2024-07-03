---
hide:
  - toc
---

# No matching cypher found

## Problem
Connecting from a Cisco 2960 switch to a Cisco 1941 router using SSH gives a "no matching cypher found" error. (Nevermind the date/time settings on switch and router, they are a bit off as I set them manually).

=== "S1"

    ``` title='' hl_lines="0"
    S1#ssh -l admin 192.168.10.254
    [Connection to 192.168.10.254 aborted: error status 0]
    S1#
    Jul  2 13:32:48.621: %SSH-3-NO_MATCH: No matching cipher found: client aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc server aes128-ctr,aes192-ctr,aes256-ctr
    S1#
    ```

=== "R1"

    ``` title='' hl_lines="0"
    R1#
    Jul  2 13:32:46.639: %SSH-3-NO_MATCH: No matching cipher found: client aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc server aes128-ctr,aes192-ctr,aes256-ctr
    R1#
    ```

## Setup
<img src="../no-matching-cypher-found-setup.png"/>

=== "S1"
    ``` title='' hl_lines="0"
    Switch>enable 
    Switch#conf terminal 
    Switch(config)#hostname S1
    S1(config)#int vlan1
    S1(config-if)#ip add 192.168.10.3 255.255.255.0
    S1(config-if)#no shut
    S1(config-if)#end
    S1#clock set 11:59:00 Jul 02 2024
    S1#
    ```

=== "R1"
    ``` title='' hl_lines="0"
    Router>enable
    Router#conf t
    Router(config)#hostname R1
    R1(config)#ip domain-name opensysadmins.lab
    R1(config)#crypto key generate rsa modulus 2048
    R1(config)#username admin secret admin
    R1(config)#line vty 0 15
    R1(config-line)#transport input ssh
    R1(config-line)#exit

    R1(config)#int g0/1
    R1(config-if)#ip add 192.168.10.254 255.255.255.0
    R1(config-if)#no shut
    R1(config-if)#end
    R1#clock set 11:59:00 Jul 02 2024
    R1#
    ```

## Cipher list on the switch.
First things first. What does a cipher list like *aes256-cbc* mean on a Cisco 2960 switch?

It refers to the *encryption method* used for secure communication, for example, with SSH (Secure Shell) or for securing data transfer.

* AES: Advanced Encryption Standard, a highly secure and widely used encryption standard.
* 256: The key size in bits. In this case, it is a 256-bit key, which provides a very high level of security.
* CBC: Cipher Block Chaining, a mode of AES that provides additional security by making each data block dependent on the previous block.

When you run `ssh -c ?` the system displays a list of *all supported encryption algorithms* for the SSH client that can be used when establishing an SSH connection to another device. When you run `show ip ssh`, it shows the default configured and supported encryption algorithms for the SSH server service, should the client be running one. This indicates which algorithms will be used by default when an SSH connection is established to the switch. In this case, the switch is not running an SSH server.

=== "S1 as client"

    ``` title='' hl_lines="0"
    S1#ssh -c ?
      3des        triple des
    SSHv2 only cipher list:
      aes128-cbc  AES 128 bits
      aes192-cbc  AES 192 bits
      aes256-cbc  AES 256 bits

    S1#
    ```

=== "S1 as server"

    ``` title='' hl_lines="2"
    S1#show ip ssh
    SSH Disabled - version 1.99
    ...
    S1#
    ```

## Cipher list on the router.

On a Cisco 1941 router, e.g. *aes256-ctr* refers to a different mode of the AES encryption standard, where:

* AES: Advanced Encryption Standard.
* 256: The key size in bits, again 256 bits.
* CTR: Counter mode, a mode of AES where a counter is used to make each data block independent of the other blocks.

In CTR (Counter) mode, a counter value is combined with an initial value and then encrypted. The resulting output is then combined with the plaintext block to form the encrypted text block. This mode makes each block encryption independent, which has advantages such as the ability to encrypt and decrypt blocks in parallel, improving speed.

=== "R1 as client"

    ``` title='' hl_lines="0"
    R1#ssh -c ?
      3des        triple des
    SSHv2 only cipher list:
      aes128-cbc  AES 128 bits
      aes128-ctr  AES-CTR 128 bits
      aes192-cbc  AES 192 bits
      aes192-ctr  AES-CTR 192 bits
      aes256-cbc  AES 256 bits
      aes256-ctr  AES-CTR 256 bits

    R1#    
    ```

=== "R1 as server"

    ``` title='' hl_lines="2 6"
    R1#show ip ssh 
    SSH Enabled - version 1.99
    Authentication methods:publickey,keyboard-interactive,password
    Authentication Publickey Algorithms:x509v3-ssh-rsa,ssh-rsa
    Hostkey Algorithms:x509v3-ssh-rsa,ssh-rsa
    Encryption Algorithms:aes128-ctr,aes192-ctr,aes256-ctr
    MAC Algorithms:hmac-sha2-256,hmac-sha2-512,hmac-sha1,hmac-sha1-96
    KEX Algorithms:diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1
    ...
    ```
## Different cypher lists.
Why is e.g. *aes256-ctr* not available on a Cisco 2960 switch?

* Hardware and software support: Not all devices support all encryption modes. The absence of aes256-ctr on the Cisco 2960 switch may be due to hardware or software limitations of the switch. Cisco 2960 switches are primarily designed as access switches and may not have the same extensive cryptographic capabilities as a router like the Cisco 1941.
* Different use cases: Switches and routers often have different use cases. Routers, such as the Cisco 1941, are more often used for WAN connections and VPN tunnels, where strong and flexible encryption is necessary. Therefore, they may support a broader range of encryption algorithms and modes. Switches, on the other hand, are usually used within LANs and may not need the same level of encryption support.
* Configuration and licenses: The available cipher suites on a switch or router may also depend on the configuration, the IOS version, or specific licenses installed on the device.

It is important to consult the documentation of specific Cisco devices and IOS versions to know which encryption methods and modes are supported.

## Solution
You can customize the list of supported and used encryption algorithms for the SSH server through Cisco IOS configuration. This can be done by adjusting the SSH server configuration to add or remove specific ciphers. This would limit the show ip ssh output to only the specifically configured algorithms.

To be continued...
