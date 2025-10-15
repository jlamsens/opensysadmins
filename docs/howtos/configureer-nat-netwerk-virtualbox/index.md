# Configureer een "NAT netwerk" in VirtualBox

De term "NAT netwerk" in VirtualBox definieert een intern netwerk waarin alle virtuele machines (VM's) met elkaar kunnen communiceren en tevens toegang krijgen tot de buitenwereld via de Network Address Translation (NAT) service van VirtualBox, waarbij alle VM's hetzelfde virtuele NAT-apparaat delen.  Dit is significant anders dan de standaard "NAT"-modus (ook bekend als Single NAT), waarbij elke VM een afzonderlijke en onafhankelijke NAT-verbinding met de host en de buitenwereld heeft; in die standaardmodus kunnen VM's niet onderling communiceren, terwijl dat in een "NAT netwerk" wel het geval is.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- een werkende installatie van [VirtualBox](../setup-virtualbox7-linuxmint22-oracledeb/index.md){:target="_blank"}
- ...

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## NAT netwerk

## Windows 11

## Windows Server 2025

## Linux Mint 22

## Debian 13
### Oude configuratie uitschakelen
Schakel de configuratie voor enp0s3 uit door deze uit te commentariëren (#). Laat enkel de loopback-configuratie actief (compatibiliteit).

=== "guru@vm:~$_"
    
    ``` title='' hl_lines="0"
    sudo nano /etc/network/interfaces
    ```

=== "output"

    ``` title='' hl_lines="11 12 14"
    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).

    source /etc/network/interfaces.d/*

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    # allow-hotplug enp0s3              # zet in commentaar
    # iface enp0s3 inet dhcp            # zet in commentaar
    # This is an autoconfigured IPv6 interface
    # iface enp0s3 inet6 auto           # zet in commentaar
    ```

### Oude netwerk service uitschakelen
Schakel de networking.service unit uit en stop de service direct.

=== "guru@vm:~$_"
    
    ``` title='' hl_lines="0"
    sudo systemctl disable --now networking.service
    ```

=== "output"

    ``` title='' hl_lines="0"
    Synchronizing state of networking.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
    Executing: /usr/lib/systemd/systemd-sysv-install disable networking
    Removed '/etc/systemd/system/network-online.target.wants/networking.service'.
    Removed '/etc/systemd/system/multi-user.target.wants/networking.service'.
    ```

### Check dhcpcd daemons
Het kan al eens voorvallen dat de onderliggende dhcpcd daemons niet netjes worden opgeruimd. Sluit dan de resterende daemons manueel af.

=== "guru@vm:~$_"
    Lijst de dhcpcd processen op. Noteer de PID (process ID) van het hoofdproces.

    ``` title='' hl_lines="0"
    # oplijsten DHCP processen
    ps faux | grep [d]hcp

    # uit de output blijkt hier proces 665 het hoofdproces; ruim deze op via het `kill commando` en verifieer opnieuw.
    sudo kill 665

    # verifieer; er mogen geen processen meer draaien
    ps faux | grep [d]hcp
    ```

=== "output"
    Hier blijkt proces 665 het hoofdproces. Ruim deze op via het `kill commando` en verifieer opnieuw.

    ``` title='' hl_lines="0"
    guru@vm:~$ ps faux | grep [d]hcp
    dhcpcd       665  0.0  0.2  10492  4352 ?        S    12:04   0:00 dhcpcd: enp0s3 [ip4] [ip6]
    root         668  0.0  0.1  10508  2632 ?        S    12:04   0:00  \_ dhcpcd: [privileged proxy] enp0s3 [ip4] [ip6]
    dhcpcd      1014  0.0  0.1  10508  2120 ?        S    12:04   0:00  |   \_ dhcpcd: [BPF BOOTP] enp0s3
    dhcpcd      1015  0.0  0.1  10508  2308 ?        S    12:04   0:00  |   \_ dhcpcd: [DHCP6 proxy] fe80::f9d9:3451:764b:b5d9
    dhcpcd      1041  0.0  0.1  10508  2180 ?        S    12:04   0:00  |   \_ dhcpcd: [BPF ARP] enp0s3 169.254.59.178
    dhcpcd       669  0.0  0.1  10484  2032 ?        S    12:04   0:00  \_ dhcpcd: [network proxy] enp0s3 [ip4] [ip6]
    dhcpcd       670  0.0  0.1  10484  2096 ?        S    12:04   0:00  \_ dhcpcd: [control proxy] enp0s3 [ip4] [ip6]
    guru@vm:~$ sudo kill 665
    guru@vm:~$ ps faux | grep [d]hcp
    guru@vm:~$
    ```

### Nieuwe netwerk manier configureren
Hoewel de configuratie voor de loopback interface meestal automatisch is, is het een best practice om een expliciet .network-bestand aan te maken.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo nano /etc/systemd/network/10-loopback.network
    ```

=== "inhoud"

    ``` title='' hl_lines="0"
    [Match]
    Name=lo

    [Network]
    Address=127.0.0.1/8
    Address=::1/128
    ```

Configureer de (primaire) interface (enp0s3).

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo nano /etc/systemd/network/20-enp0s3.network
    ```

=== "inhoud"

    ``` title='' hl_lines="0"
    [Match]
    Name=enp0s3

    [Network]
    Address=192.168.10.36/24
    Gateway=192.168.10.1
    DNS=192.168.10.1    # zal pas kunnen worden gebruikt na installatie van systemd-resolved    
    ```

### DNS-koppeling
De nameserver uit `/etc/systemd/network/20-enp0s3.network` kan nog niet worden gebruikt wegens het ontbrekende pakket `systemd-resolved`. Verwijder alle aanwezige regels. en stel (tijdelijk) handmatig een statische nameserver in.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo nano /etc/resolv.conf
    ```

=== "inhoud"

    ``` title='' hl_lines="0"
    nameserver 192.168.10.1
    ```

Activeer de systemd-networkd netwerkservice en test.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo systemctl enable --now systemd-networkd
    networkctl status
    ip a
    ip r
    ping -c4 opensysadmins.com
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@vm:~$ sudo systemctl enable --now systemd-networkd
    Created symlink '/etc/systemd/system/dbus-org.freedesktop.network1.service' → '/usr/lib/systemd/system/systemd-networkd.service'.
    Created symlink '/etc/systemd/system/multi-user.target.wants/systemd-networkd.service' → '/usr/lib/systemd/system/systemd-networkd.service'.
    Created symlink '/etc/systemd/system/sockets.target.wants/systemd-networkd.socket' → '/usr/lib/systemd/system/systemd-networkd.socket'.
    Created symlink '/etc/systemd/system/sysinit.target.wants/systemd-network-generator.service' → '/usr/lib/systemd/system/systemd-network-generator.service'.
    Created symlink '/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service' → '/usr/lib/systemd/system/systemd-networkd-wait-online.service'.
    
    guru@vm:~$ networkctl status
    ● Interfaces: 1, 2
           State: routable
    Online state: online
         Address: 192.168.10.36 on enp0s3
                  fe80::a00:27ff:fea6:e02f on enp0s3
                  fe80::f9d9:3451:764b:b5d9 on enp0s3
         Gateway: 192.168.10.1 on enp0s3
             DNS: 192.168.10.1
    
    guru@vm:~$ ip a
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
        link/ether 08:00:27:a6:e0:2f brd ff:ff:ff:ff:ff:ff
        altname enx080027a6e02f
        inet 192.168.10.36/24 brd 192.168.10.255 scope global enp0s3
           valid_lft forever preferred_lft forever
        inet6 fe80::a00:27ff:fea6:e02f/64 scope link proto kernel_ll 
           valid_lft forever preferred_lft forever
        inet6 fe80::f9d9:3451:764b:b5d9/64 scope link 
           valid_lft forever preferred_lft forever
    guru@vm:~$ ip r
    default via 192.168.10.1 dev enp0s3 proto static 
    192.168.10.0/24 dev enp0s3 proto kernel scope link src 192.168.10.36 

    guru@vm:~$ ping -c4 opensysadmins.com
    PING opensysadmins.com (185.199.109.153) 56(84) bytes of data.
    64 bytes from cdn-185-199-109-153.github.com (185.199.109.153): icmp_seq=1 ttl=56 time=17.8 ms
    64 bytes from cdn-185-199-109-153.github.com (185.199.109.153): icmp_seq=2 ttl=56 time=17.6 ms
    64 bytes from cdn-185-199-109-153.github.com (185.199.109.153): icmp_seq=3 ttl=56 time=11.2 ms
    64 bytes from cdn-185-199-109-153.github.com (185.199.109.153): icmp_seq=4 ttl=56 time=15.9 ms

    --- opensysadmins.com ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3005ms
    rtt min/avg/max/mdev = 11.249/15.638/17.819/2.644 ms
    ```

Nu we handmatig een DNS hebben ingesteld, kunnen we pakket systemd-resolved installeren.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    sudo apt install systemd-resolved
    ```

=== "output"

    ``` title='' hl_lines="65"
    guru@vm:~$ sudo apt update
    Hit:1 http://security.debian.org/debian-security trixie-security InRelease
    Hit:2 http://deb.debian.org/debian trixie InRelease
    Hit:3 http://deb.debian.org/debian trixie-updates InRelease
    Reading package lists...
    Building dependency tree...
    Reading state information...
    All packages are up to date.

    guru@vm:~$ sudo apt install systemd-resolved
    Reading package lists...
    Building dependency tree...
    Reading state information...
    Installing:
      systemd-resolved

    Installing dependencies:
      libnss-myhostname  libnss-resolve

    Suggested packages:
      polkitd

    Summary:
      Upgrading: 0, Installing: 3, Removing: 0, Not Upgrading: 0
      Download size: 616 kB
      Space needed: 1,484 kB / 16.2 GB available

    Continue? [Y/n] Get:1 http://deb.debian.org/debian trixie-updates/main amd64 libnss-myhostname amd64 257.8-1~deb13u2 [114 kB]
    Get:2 http://deb.debian.org/debian trixie-updates/main amd64 systemd-resolved amd64 257.8-1~deb13u2 [361 kB]
    Get:3 http://deb.debian.org/debian trixie-updates/main amd64 libnss-resolve amd64 257.8-1~deb13u2 [141 kB]
    Fetched 616 kB in 0s (4,137 kB/s)
    Selecting previously unselected package libnss-myhostname:amd64.
    (Reading database ... 
    (Reading database ... 5%
    (Reading database ... 10%
    (Reading database ... 15%
    (Reading database ... 20%
    (Reading database ... 25%
    (Reading database ... 30%
    (Reading database ... 35%
    (Reading database ... 40%
    (Reading database ... 45%
    (Reading database ... 50%
    (Reading database ... 55%
    (Reading database ... 60%
    (Reading database ... 65%
    (Reading database ... 70%
    (Reading database ... 75%
    (Reading database ... 80%
    (Reading database ... 85%
    (Reading database ... 90%
    (Reading database ... 95%
    (Reading database ... 100%
    (Reading database ... 60081 files and directories currently installed.)
    Preparing to unpack .../libnss-myhostname_257.8-1~deb13u2_amd64.deb ...
    Unpacking libnss-myhostname:amd64 (257.8-1~deb13u2) ...
    Selecting previously unselected package systemd-resolved.
    Preparing to unpack .../systemd-resolved_257.8-1~deb13u2_amd64.deb ...
    Unpacking systemd-resolved (257.8-1~deb13u2) ...
    Selecting previously unselected package libnss-resolve:amd64.
    Preparing to unpack .../libnss-resolve_257.8-1~deb13u2_amd64.deb ...
    Unpacking libnss-resolve:amd64 (257.8-1~deb13u2) ...
    Setting up libnss-myhostname:amd64 (257.8-1~deb13u2) ...
    Setting up systemd-resolved (257.8-1~deb13u2) ...
    Converting /etc/resolv.conf to a symlink to /run/systemd/resolve/stub-resolv.conf...
    Creating group 'systemd-resolve' with GID 987.

    Creating user 'systemd-resolve' (systemd Resolver) with UID 987 and GID 987.

    Created symlink '/etc/systemd/system/dbus-org.freedesktop.resolve1.service' → '/usr/lib/systemd/system/systemd-resolved.service'.

    Created symlink '/etc/systemd/system/sysinit.target.wants/systemd-resolved.service' → '/usr/lib/systemd/system/systemd-resolved.service'.

    Setting up libnss-resolve:amd64 (257.8-1~deb13u2) ...
    Processing triggers for man-db (2.13.1-1) ...
    Processing triggers for dbus (1.16.2-2) ...
    Processing triggers for libc-bin (2.41-12) ...
    guru@vm:~$
    ```

Systemd-resolved heeft `/etc/resolv.conf` nu overschreven en geconverteerd in een symbolische link.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    ls -lh /etc/resolv.conf
    cat /etc/resolv.conf
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@vm:~$ ls -lh /etc/resolv.conf
    lrwxrwxrwx 1 root root 39 Oct 15 17:35 /etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

    guru@vm:~$ cat /etc/resolv.conf
    # This is /run/systemd/resolve/stub-resolv.conf managed by man:systemd-resolved(8).
    # Do not edit.
    #
    # This file might be symlinked as /etc/resolv.conf. If you're looking at
    # /etc/resolv.conf and seeing this text, you have followed the symlink.
    #
    # This is a dynamic resolv.conf file for connecting local clients to the
    # internal DNS stub resolver of systemd-resolved. This file lists all
    # configured search domains.
    #
    # Run "resolvectl status" to see details about the uplink DNS servers
    # currently in use.
    #
    # Third party programs should typically not access this file directly, but only
    # through the symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a
    # different way, replace this symlink by a static file or a different symlink.
    #
    # See man:systemd-resolved.service(8) for details about the supported modes of
    # operation for /etc/resolv.conf.

    nameserver 127.0.0.53
    options edns0 trust-ad
    search .
    ```

Ik stel wel vast, dat eerst de DNS daemon moet worden herstart (bugje?).

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    # geeft fout
    resolvectl status

    # herstart service
    sudo systemctl restart --now systemd-resolved

    # fout is weg
    resolvectl status
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@vm:~$ resolvectl status
    Failed to get global data: Failed to activate service 'org.freedesktop.resolve1': timed out (service_start_timeout=25000ms)
    
    guru@vm:~$ sudo systemctl restart --now systemd-resolved
    guru@vm:~$

    guru@vm:~$ resolvectl status
    Global
             Protocols: +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
      resolv.conf mode: stub

    Link 2 (enp0s3)
        Current Scopes: DNS LLMNR/IPv4 LLMNR/IPv6
             Protocols: +DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
           DNS Servers: 192.168.10.1
         Default Route: yes
    ```

### Hostname
Stel de hostname in.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    echo "de01" | sudo tee /etc/hostname
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@vm:~$ echo "de01" | sudo tee /etc/hostname
    de01
    guru@vm:~$
    ```

Creëer een statische lokale naamresolutie.

=== "guru@vm:~$_"

    ``` title='' hl_lines="0"
    sudo nano /etc/hosts
    ```

=== "inhoud"

    ``` title='' hl_lines="2 3"
    127.0.0.1	localhost
    # 127.0.1.1	vm.vdab.lab	vm
    192.168.10.36	de01.opensysadmins.lab de01

    # The following lines are desirable for IPv6 capable hosts
    ::1     localhost ip6-localhost ip6-loopback
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ```

Herstart en test.
=== "guru@de01:~$_"

    ``` title='' hl_lines="0"
    guru@vm:~$ sudo reboot
    guru@de01:~$ hostname
    guru@de01:~$ hostname -d
    guru@de01:~$ hostname -f
    ping -c4 de01
    ping -c4 de01.opensysadmins.lab
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@de01:~$ sudo reboot

    guru@de01:~$ hostname
    de01
    guru@de01:~$ hostname -d
    opensysadmins.lab
    guru@de01:~$ hostname -f
    de01.opensysadmins.lab
    
    guru@de01:~$ ping -c4 de01
    PING de01.opensysadmins.lab (192.168.10.36) 56(84) bytes of data.
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=1 ttl=64 time=0.012 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=2 ttl=64 time=0.058 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=3 ttl=64 time=0.062 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=4 ttl=64 time=0.021 ms

    --- de01.opensysadmins.lab ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3074ms

    rtt min/avg/max/mdev = 0.012/0.038/0.062/0.022 ms

    guru@de01:~$ ping -c4 de01.opensysadmins.lab
    PING de01.opensysadmins.lab (192.168.10.36) 56(84) bytes of data.
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=1 ttl=64 time=0.012 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=2 ttl=64 time=0.023 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=3 ttl=64 time=0.024 ms
    64 bytes from de01.opensysadmins.lab (192.168.10.36): icmp_seq=4 ttl=64 time=0.032 ms

    --- de01.opensysadmins.lab ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3711ms
    rtt min/avg/max/mdev = 0.012/0.022/0.032/0.007 ms    
    guru@de01:~$
    ```