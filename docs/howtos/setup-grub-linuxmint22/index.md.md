# Setup GRUB op Linux Mint 22 (LAB PC)

TODO


Let's create a nice and simple boot menu with 3 choices.

## Download Clonezilla

=== "Step1"
    Use your favorite search engine to search for "Clonezilla" and choose the official website.

    <img src="../clonezilla-search-iso.png" width="320" height="180"/>

=== "Step2"
    Choose the "Ubuntu-based alternative stable" version.

    <img src="../clonezilla-select-edition.png" width="320" height="180"/>

=== "Step3"
    Make sure the CPU archictecture is "amd64" and the file type is "iso". Click "Download".

    <img src="../clonezilla-download-iso.png" width="320" height="180"/>

=== "Step4"
    The file will be downloaded to the "Downloads" folder.

    <img src="../clonezilla-downloads-folder.png" width="320" height="180"/>

=== "Step5"
    Create a directory "ISO" and move the file into that directory.

    <img src="../directory-iso.png" width="320" height="180"/>

## Remove GRUB countdown timer

=== "guru@lab:~$_"

    ``` bash title=''
    sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=-1/g' /etc/default/grub
    ```

=== "output"
    ``` title=''
    guru@lab:~$ sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=-1/g' /etc/default/grub
    [sudo] password for guru:     
    guru@lab:~$ 
    ```

## Custom configuration

=== "step1"
    
    Open /etc/grub.d/40_custom in an editor (as root)

    ``` title=''
    sudo xed /etc/grub.d/40_custom &
    ```
=== "step2"
    
    Open /boot/grub/grub.cfg in an editor (as non-root user)
    ``` title=''
    xed /boot/grub/grub.cfg &
    ```
=== "step3"
    Copy over the "Linux part".
    
    <img src="../copy-over-linux-part.png" width="320" height="180"/>

=== "step4"
    Copy over the "Windows part". Then close grub.cfg, we don't need that file anymore.
    
    <img src="../copy-over-windows-part.png" width="320" height="180"/>

=== "step5"
    Add "empty menu" entry.
    
    <img src="../empty-menu.png" width="320" height="180"/>

=== "step6a"
    Copy this text to paste later on.
    
    ``` title='' hl_lines="0"
    menuentry 'Restore CLEAN INSTALL' {
        set isofile="/home/guru/Downloads/ISO/clonezilla-live-20230426-lunar-amd64.iso"
        loopback loop $isofile
        linux (loop)/live/vmlinuz boot=live union=overlay username=user config components quiet noswap nolocales edd=on nomodeset ocs_prerun=\"mount /dev/sda7 /home/partimag\" ocs_live_run=\"/usr/sbin/ocs-sr --batch -e1 auto -e2 -t -r -j2 -k -scr -p poweroff restoreparts win-lin sda1 sda2 sda3 sda4 sda5 sda6\" ocs_live_extra_param=\"\" keyboard-layouts=\"NONE \" ocs_live_batch=\"yes\" locales= vga=788 ip=frommedia nosplash toram=filesystem.squashfs findiso=$isofile
        initrd (loop)/live/initrd.img
    }
    ```

=== "step6b"
    Add "Clonezilla restore" entry.
    
    <img src="../add-clonezilla-restore.png" width="320" height="180"/>

## Adjust file permissions

=== "guru@lab:~$_"

    ``` title=''
    cd /etc/grub.d/
    sudo chmod -x *
    sudo chmod +x 00* 05* 40*
    ls -lh
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ cd /etc/grub.d
    guru@lab:/etc/grub.d$ sudo chmod -x *
    guru@lab:/etc/grub.d$ sudo chmod +x 00* 05* 40*
    guru@lab:/etc/grub.d$ ls -lh
    total 136K
    -rwxr-xr-x 1 root root  11K Dec 18  2022 00_header
    -rwxr-xr-x 1 root root 6,2K Dec  2  2022 05_debian_theme
    -rw-r--r-- 1 root root  19K Dec 18  2022 10_linux
    -rw-r--r-- 1 root root  43K Dec 18  2022 10_linux_zfs
    -rw-r--r-- 1 root root  15K Dec 18  2022 20_linux_xen
    -rw-r--r-- 1 root root  14K Dec 18  2022 30_os-prober
    -rw-r--r-- 1 root root 1,4K Dec 18  2022 30_uefi-firmware
    -rw-r--r-- 1 root root  700 Sep 20  2022 35_fwupd
    -rwxr-xr-x 1 root root 2,8K Oct 11 13:26 40_custom
    -rw-r--r-- 1 root root  215 Dec 18  2022 41_custom
    -rw-r--r-- 1 root root  483 Dec 18  2022 README
    guru@lab:/etc/grub.d$ 
    ```

## Regenerate GRUB configuration

=== "guru@lab:~$_"

    ``` title=''
    sudo update-grub
    ```

=== "output"
    
    ``` title='' hl_lines="0"
    guru@lab:~$ sudo update-grub
    [sudo] password for guru:     
    Sourcing file `/etc/default/grub'
    Sourcing file `/etc/default/grub.d/50_linuxmint.cfg'
    Sourcing file `/etc/default/grub.d/init-select.cfg'
    Generating grub configuration file ...
    done
    guru@lab:~$ 
    ```
