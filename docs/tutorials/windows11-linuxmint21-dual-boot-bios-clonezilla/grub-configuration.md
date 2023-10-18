# GRUB configuration

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

    <img src="../1280-720.png" width="320" height="180"/>

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
    Copy over "Linux part".
    
    <img src="../1280-720.png" width="320" height="180"/>

=== "step4"
    Copy over "Windows part".
    
    <img src="../1280-720.png" width="320" height="180"/>

=== "step5"
    Add "empty menu" entry.
    
    <img src="../1280-720.png" width="320" height="180"/>

=== "step6a"
    Copy this text to paste later on.
    
    ``` title='' hl_lines="0"
    ...
    ...
    ...
    ```

=== "step6b"
    Add "Clonezilla restore" entry.
    
    <img src="../1280-720.png" width="320" height="180"/>

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
    ...
    ...
    ...
    ...
    ```

## Regenerate GRUB configuration

=== "guru@pc:~$_"

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
