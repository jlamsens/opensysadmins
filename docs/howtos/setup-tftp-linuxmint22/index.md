# Setup tFTP op Linux Mint 22

Een tFTP-server (Trivial File Transfer Protocol) is een eenvoudige server die wordt gebruikt voor het snel overzetten van bestanden binnen een lokaal netwerk, zonder dat daar een wachtwoord of complexe login voor nodig is. Vanwege zijn eenvoud en lage overhead wordt het vooral ingezet voor het pushen van configuratiebestanden en firmware-updates naar netwerkapparatuur, zoals Cisco-switches en routers.

TODO

## Prereqs

## Update the APT cache

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo apt update
    Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
    Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease                                                      
    Hit:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease                                                        
    Ign:4 https://linuxmint-packages.mirror.liteserver.nl victoria InRelease                        
    Hit:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease                                
    Hit:6 https://linuxmint-packages.mirror.liteserver.nl victoria Release                          
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.
    guru@lab:~$ 
    ```

## Install the TFTP server package

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo apt install tftpd-hpa
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo apt install tftpd-hpa
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Suggested packages:
    pxelinux
    The following NEW packages will be installed:
    tftpd-hpa
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 40,7 kB of archives.
    After this operation, 122 kB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 tftpd-hpa amd64 5.2+20150808-1.2build2 [40,7 kB]
    Fetched 40,7 kB in 0s (83,4 kB/s)  
    Preconfiguring packages ...
    Selecting previously unselected package tftpd-hpa.
    (Reading database ... 561282 files and directories currently installed.)
    Preparing to unpack .../tftpd-hpa_5.2+20150808-1.2build2_amd64.deb ...
    Unpacking tftpd-hpa (5.2+20150808-1.2build2) ...
    Setting up tftpd-hpa (5.2+20150808-1.2build2) ...
    Processing triggers for man-db (2.10.2-1) ...
    guru@lab:~$ 
    ```

## Configure the service (optional)

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    cat /etc/default/tftpd-hpa
    ```

=== "output"

    ``` title='' hl_lines="5"
    guru@lab:~$ cat /etc/default/tftpd-hpa 
    # /etc/default/tftpd-hpa

    TFTP_USERNAME="tftp"
    TFTP_DIRECTORY="/srv/tftp"
    TFTP_ADDRESS=":69"
    TFTP_OPTIONS="--secure"
    guru@lab:~$ 
    ```

## View directory permissions/ownership

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    ls -ld /srv/tftp/
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ ls -ld /srv/tftp/
    drwxr-xr-x 2 root nogroup 4096 Sep  7 13:56 /srv/tftp/
    guru@lab:~$
    ```

## Verify the service

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo systemctl status tftpd-hpa
    ```

=== "output"

    ``` title='' hl_lines="4"
    guru@lab:~$ sudo systemctl status tftpd-hpa
    ● tftpd-hpa.service - LSB: HPA's tftp server
        Loaded: loaded (/etc/init.d/tftpd-hpa; generated)
        Active: active (running) since Thu 2023-09-07 13:56:28 CEST; 9min ago
        Docs: man:systemd-sysv-generator(8)
        Process: 3293 ExecStart=/etc/init.d/tftpd-hpa start (code=exited, status=0/SUCCESS)
        Tasks: 1 (limit: 4539)
        Memory: 404.0K
            CPU: 8ms
        CGroup: /system.slice/tftpd-hpa.service
                └─3301 /usr/sbin/in.tftpd --listen --user tftp --address :69 --secure /srv/tftp

    Sep 07 13:56:28 lab systemd[1]: Starting LSB: HPA's tftp server...
    Sep 07 13:56:28 lab tftpd-hpa[3293]:  * Starting HPA's tftpd in.tftpd
    Sep 07 13:56:28 lab tftpd-hpa[3293]:    ...done.
    Sep 07 13:56:28 lab systemd[1]: Started LSB: HPA's tftp server.
    guru@lab:~$ 
    ```
    
## Enable the service to start on boot (optional)

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo systemctl enable tftpd-hpa
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:/srv/tftp$ sudo systemctl enable tftpd-hpa
    [sudo] password for guru:     
    tftpd-hpa.service is not a native service, redirecting to systemd-sysv-install.
    Executing: /lib/systemd/systemd-sysv-install enable tftpd-hpa
    guru@lab:/srv/tftp$ 
    ```

## Serve a file
In this example, a [valid Cisco IOS image](../download-cisco-IOS/index.md){:target="_blank"} is copied to the tFTP directory and
permissions are set.

=== "guru@lab:~$_"

    ``` title='' hl_lines="0"
    sudo cp /home/guru/Downloads/c2960-lanbasek9-mz.152-7.E8.bin /srv/tftp/
    sudo chmod 644 /srv/tftp/c2960-lanbasek9-mz.152-7.E8.bin
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo cp /home/guru/Downloads/c2960-lanbasek9-mz.152-7.E8.bin /srv/tftp/
    [sudo] password for guru:     
    guru@lab:~$ sudo chmod 644 /srv/tftp/c2960-lanbasek9-mz.152-7.E8.bin 
    guru@lab:~$
    ```
