---
hide:
  - toc
---

# No matching key exchange method found

## Setup
<img src="../no-matching-cypher-found-setup.png"/>

=== "S1"
    ``` title='' hl_lines="0"
    Switch>enable 
    Switch#clock set 11:59:00 Jul 02 2024
    Switch#conf terminal 
    Switch(config)#hostname S1
    S1(config)#int vlan1
    S1(config-if)#ip add 192.168.10.3 255.255.255.0
    S1(config-if)#no shut
    S1(config-if)#end
    S1#
    ```

=== "R1"
    ``` title='' hl_lines="0"
    Router>enable
    Router#clock set 11:59:00 Jul 02 2024
    Router#conf t
    Router(config)#enable secret admin
    Router(config)#hostname R1
    R1(config)#ip domain-name opensysadmins.lab
    R1(config)#crypto key generate rsa modulus 2048
    R1(config)#username admin secret admin
    R1(config)#line vty 0 15
    R1(config-line)#transport input ssh
    R1(config-line)#login local
    R1(config-line)#exit

    R1(config)#int g0/1
    R1(config-if)#ip add 192.168.10.254 255.255.255.0
    R1(config-if)#no shut
    R1(config-if)#end
    R1#
    ```

## Problem
Connecting from a Linux Mint 21 LAB-PC to a Cisco 1941 router using SSH gives a "no matching key exchange method found" error. Notice that the router gives a "No matching cipher found" error, which is different than the error on the LAB-PC! (Nevermind the date/time settings on switch and router, they are a bit off as I set them manually)

=== "LAB-PC"

    ``` title='' hl_lines="2"
    guru@lab:~$ ssh -l admin 192.168.10.254
    Unable to negotiate with 192.168.10.254 port 22: no matching key exchange method found. Their offer: diffie-hellman-group-exchange-sha1,
    diffie-hellman-group14-sha1
    guru@lab:~$ 
    ```

=== "R1"

    ``` title='' hl_lines="2"
    R1#
    Jul  9 11:25:38.179: %SSH-3-NO_MATCH: No matching cipher found: client aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc server aes25
    6-cbc
    R1#
    ```

## Cipher list.
Via [this post](./no-matching-cypher-found.md), we already know how to fix that cipher error on the "server side". Here, we will use a cipher on the Linux client that the server (R1) understands. Now we are left with "no matching key exchange method found" error on both sides.

=== "LAB-PC"

    ``` title='' hl_lines="7"
    # By default, the SSH client speaks these Ciphers
    guru@lab:~$ grep "Cipher" /etc/ssh/ssh_config
        Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
    
    # Make the SSH client speak a cipher that the router understands
    guru@lab:~$ ssh -c aes256-cbc -l admin 192.168.10.254
    Unable to negotiate with 192.168.10.254 port 22: no matching key exchange method found. Their offer: diffie-hellman-group-exchange-sha1,
    diffie-hellman-group14-sha1
    guru@lab:~$ 
    S1#
    ```

=== "R1"

    ``` title='' hl_lines="2"
    R1#
    Jul  9 12:43:57.403: %SSH-3-NO_MATCH: No matching kex algorithm found: client curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-n
    istp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,sntrup761x25519-sha512@openssh.com,diffie-hellman-group-exchange-sha256,diffie-hellman-gro
    up16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,ext-info-c,kex-strict-c-v00@openssh.com server diffie-hellman-gr
    oup-exchange-sha1,diffie-hellman-group14-sha1
    R1#
    ```

## Key exchange
There is a discrepancy between the key exchange algorithms shown in the output of `ssh -Q kex` and those observed during the actual SSH negotiation with `ssh -vvv`. The algorithms listed in `ssh -Q kex` include all supported algorithms, but some may be deprecated or considered less secure. During actual connections, OpenSSH may prioritize more secure algorithms.

=== "LAB-PC"

    ``` title='' hl_lines="13 14 18"
    # Do a verbose connection to see which key exchange algorithms are tried
    guru@lab:~$ ssh -vvv -c aes256-cbc -l admin 192.168.10.254
    ...
    ...
    debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,sntrup76
    1x25519-sha512@openssh.com,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellm
    an-group14-sha256,ext-info-c,kex-strict-c-v00@openssh.com
    ...


    # List the supported key exchange algorithms on the SSH client
    guru@lab:~$ ssh -Q kex
    diffie-hellman-group1-sha1 NOT TRIED
    diffie-hellman-group14-sha1 NOT TRIED
    diffie-hellman-group14-sha256 <--- TRIED
    diffie-hellman-group16-sha512 <--- TRIED
    diffie-hellman-group18-sha512 <--- TRIED
    diffie-hellman-group-exchange-sha1 NOT TRIED
    diffie-hellman-group-exchange-sha256 <--- TRIED
    ecdh-sha2-nistp256 <--- TRIED
    ecdh-sha2-nistp384 <--- TRIED
    ecdh-sha2-nistp521 <--- TRIED
    curve25519-sha256 <--- TRIED
    curve25519-sha256@libssh.org <--- TRIED
    sntrup76 <--- TRIED
    1x25519-sha512@openssh.com <--- TRIED
    guru@lab:~$
    ```

=== "R1"

    ``` title='' hl_lines="8"
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


## Solution and new problem
The Linux client (LAB-PC) has to use a key exchange algorithm that the server (R1) supports; either diffie-hellman-group-exchange-sha1 or diffie-hellman-group14-sha1 in this case. Let's use the first one. Now we get the error "no matching host key type found".

=== "LAB-PC"

    ``` title='' hl_lines="2 7"
    guru@lab:~$ ssh -c aes256-cbc -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -l admin 192.168.10.254
    Unable to negotiate with 192.168.10.254 port 22: no matching host key type found. Their offer: ssh-rsa
    guru@lab:~$
    ```

=== "R1"

    ``` title='' hl_lines="0"
    R1# Jul  9 13:17:59.767: %SSH-3-NO_MATCH: No matching hostkey algorithm found: client ssh-ed25519-cert-v01@openssh.com,ecdsa-sha2-nistp256-c
    ert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,sk-ssh-ed25519-cert-v01@openssh.co
    m,sk-ecdsa-sha2-nistp256-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-ed25519,ecdsa-sha2
    -nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ssh-ed25519@openssh.com,sk-ecdsa-sha2-nistp256@openssh.com,rsa-sha2-512,rsa-sha2-25
    6 server ssh-rsa
    R1#
    ```

## Host key type
There is a discrepancy between the host key types shown in the output of `ssh -Q key` and those observed during the actual SSH negotiation with `ssh -vvv`. The algorithms listed in `ssh -Q key` include all supported key types, but during actual connections, OpenSSH may prioritize more secure key types.

=== "LAB-PC"

    ``` title='' hl_lines="18"
    # Do a verbose connection to see which host key types are tried
    guru@lab:~$ ssh -vvv -c aes256-cbc -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -l admin 192.168.10.254
    ...
    ...
    debug2: host key algorithms: ssh-ed25519-cert-v01@openssh.com,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@open
    ssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,sk-ecdsa-sha2-nistp256-cert-v01@openssh.com,rsa-sha
    2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-ed25519,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-
    ssh-ed25519@openssh.com,sk-ecdsa-sha2-nistp256@openssh.com,rsa-sha2-512,rsa-sha2-256
    ...


    # List the supported host key types on the SSH client
    guru@lab:~$ ssh -Q key
    ssh-ed25519
    ssh-ed25519-cert-v01@openssh.com
    sk-ssh-ed25519@openssh.com
    sk-ssh-ed25519-cert-v01@openssh.com
    ssh-rsa <--- NOT TRIED
    ssh-dss
    ecdsa-sha2-nistp256
    ecdsa-sha2-nistp384
    ecdsa-sha2-nistp521
    sk-ecdsa-sha2-nistp256@openssh.com
    ssh-rsa-cert-v01@openssh.com
    ssh-dss-cert-v01@openssh.com
    ecdsa-sha2-nistp256-cert-v01@openssh.com
    ecdsa-sha2-nistp384-cert-v01@openssh.com
    ecdsa-sha2-nistp521-cert-v01@openssh.com
    sk-ecdsa-sha2-nistp256-cert-v01@openssh.com
    guru@lab:~$ 
    ```

=== "R1"

    ``` title='' hl_lines="5"
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

## Solution
The client (LAB-PC) has to use a host key type that the server (R1) supports; ssh-rsa

=== "LAB-PC"

    ``` title='' hl_lines="0"
    guru@lab:~$ ssh -c aes256-cbc -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -o HostKeyAlgorithms=+ssh-rsa -l admin 192.168.10.254
    The authenticity of host '192.168.10.254 (192.168.10.254)' can't be established.
    RSA key fingerprint is SHA256:X+55b1YqibQQ6qlzHP/DxeEbUQ7b1J8k9z78syYa3bY.
    This key is not known by any other names
    Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
    Warning: Permanently added '192.168.10.254' (RSA) to the list of known hosts.
    (admin@192.168.10.254) Password: 

    R1# 
    ```

=== "R1"

    ``` title='' hl_lines="9"
    R1#show ssh
    Connection Version Mode  Encryption  Hmac          State                Username
    0          2.0     IN   aes256-cbc  hmac-sha2-256 Session started       admin
    0          2.0     OUT  aes256-cbc  hmac-sha2-256 Session started       admin

    R1#show users
        Line       User       Host(s)              Idle       Location
    *  0 con 0                idle                 00:00:00   
    132 vty 0     admin      idle                 00:01:32 192.168.10.2

      Interface    User               Mode         Idle     Peer Address

    R1#    
    ```
