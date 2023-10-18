# Create storage partition

## Check partition number and unallocated disk space

=== "guru@pc:~$_"

    ``` title=''
    sudo parted -s /dev/sda unit s print free
    ```

=== "output"
    The extended partition has number 4 and ends at sector 1702858751. There is some unallocated disk space available.

    ``` title='' hl_lines="14 17"
    guru@lab:~$ sudo parted -s /dev/sda unit s print free
    Model: ATA ST1000DM003-1CH1 (scsi)
    Disk /dev/sda: 1953525168s
    Sector size (logical/physical): 512B/4096B
    Partition Table: msdos
    Disk Flags: 

    Number  Start        End          Size        Type      File system     Flags
            63s          2047s        1985s                 Free Space
    1      2048s        206847s      204800s     primary   ntfs            boot
    2      206848s      837578751s   837371904s  primary   ntfs
    3      837578752s   838858751s   1280000s    primary   ntfs            msftres
            838858752s   838860797s   2046s                 Free Space
    4      838860798s   1702858751s  863997954s  extended
    5      838860800s   902858751s   63997952s   logical   linux-swap(v1)
    6      902860800s   1702858751s  799997952s  logical   ext4
            1702858752s  1953525167s  250666416s            Free Space

    guru@lab:~$ 
    ```

## Expand and verify extended partition

=== "guru@pc:~$_"
    This is an interactive command. See output.

    ``` title=''
    sudo parted /dev/sda
    ```

=== "output"

    ``` title='' hl_lines="6 8 9 10"
    guru@lab:~$ sudo parted /dev/sda
    [sudo] password for guru:     
    GNU Parted 3.4
    Using /dev/sda
    Welcome to GNU Parted! Type 'help' to view a list of commands.
    (parted) resizepart 4                                                     
    Warning: Partition /dev/sda4 is being used. Are you sure you want to continue?
    Yes/No? Yes                                                               
    End?  [872GB]? -0                                                         
    (parted) quit                                                             
    Information: You may need to update /etc/fstab.
    guru@lab:~$
    ```

## Create partition
We'll use all remaining unallocated (free) space. First use the sector found in step one. This will fail. See output.

=== "guru@pc:~$_"

    ``` title=''
    sudo parted -s /dev/sda mkpart logical ext4 1702858752s -- -1s      <--- fails
    sudo parted -s /dev/sda mkpart logical ext4 1702858753s -- -1s      <--- OK
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo parted -s /dev/sda mkpart logical ext4 1702858752s -- -1s
    Error: You requested a partition from 872GB to 1000GB (sectors 1702858752..1953525167).
    The closest location we can manage is 872GB to 1000GB (sectors 1702858753..1953525167).

    guru@lab:~$ sudo parted -s /dev/sda mkpart logical ext4 1702858753s -- -1s
    Warning: The resulting partition is not properly aligned for best performance: 1702858753s % 2048s != 0s
    guru@lab:~$ 
    ```

## Create filesystem
Just create it. No need to mount it.

=== "guru@pc:~$_"

    ``` title=''
    sudo mkfs.ext4 /dev/sda7
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@lab:~$ sudo mkfs.ext4 /dev/sda7
    mke2fs 1.46.5 (30-Dec-2021)
    /dev/sda7 alignment is offset by 3584 bytes.
    This may result in very poor performance, (re)-partitioning suggested.
    Creating filesystem with 31333301 4k blocks and 7839744 inodes
    Filesystem UUID: 4d53f383-64b7-4aa7-9093-b3829e27c1f4
    Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
        4096000, 7962624, 11239424, 20480000, 23887872

    Allocating group tables: done                            
    Writing inode tables: done                            
    Creating journal (131072 blocks): done
    Writing superblocks and filesystem accounting information: done   

    guru@lab:~$ 
    ```