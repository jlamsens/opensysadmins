# Title howto

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et enim pulvinar, tempor justo vitae, tincidunt nulla. Mauris dictum diam sem, non consequat nulla rhoncus id. Nunc quis velit ut arcu maximus blandit. Proin magna velit, tempor sed mollis quis, malesuada vitae dui. Fusce facilisis neque et bibendum tristique.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Setup
Tekening van hoe het eruit ziet.

## Use tabs for a task that has more than 1 step with a picture.
(Optional) task explanation.

=== "Step1"
    (Optional) step explanation.
    
    <img src="1280-720.png" width="320" height="180"/>

=== "StepX"
    (Optional) step explanation.
    
    <img src="1280-720.png" width="320" height="180"/>

## No need for tabs for a task with only 1 step with a picture.

(Optional) task explanation.

<img src="1280-720.png" width="320" height="180"/>


## De syntax van een shell commando 
Optionele uiteg: hier maak je een "copy" mogelijk van het commando. De output die vaak lang is, in een tab.

- 2 aparte tabs
- Het pad (PWD) `guru@hp:~$_` en het resultaat `output` in de tab naam.

=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <execute some command>
    ```

=== "output"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```

## De syntax van een shell commando - optie1
Optionele uiteg: hier maak je een "copy" mogelijk van het commando. De output die vaak lang is, in een tab.

- 2 aparte tabs
- GEEN pad maar het commando teken `$_` en het resultaat `output` in de tab naam.
- titel van box1 en box2


=== "$_"
    Optionele uitleg.

    ``` title='Titel van box1' hl_lines="0"
    sudo <execute some command>
    ```

=== "output"
    Optionele uitleg.

    ``` title='Titel van box2' hl_lines="0"
    guru@hp:~$ sudo <execute some command>
    [sudo] password for guru:     
    ...
    ...
    ```

## De syntax van een shell commando - optie2
Optionele uiteg: hier maak je een "copy" mogelijk van het commando. De output die vaak lang is, in een tab.

- 2 aparte tabs
- GEEN pad maar het commando teken `$_` en het resultaat `resultaat` in de tab naam.
- enkel titel van box2


=== "$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <editor> /path/to/file
    ```

=== "resultaat"
    Optionele uitleg.

    ``` title='/path/to/file' hl_lines="0"
    # inhoud van bestand
    ...
    ```

## De syntax van een shell commando - optie3 (mix)
Optionele uiteg: hier maak je een "copy" mogelijk van het commando. De output die vaak lang is, in een tab.

- 2 aparte tabs
- Het pad (PWD) `guru@hp:~$_` en het resultaat `resultaat` in de tab naam.
- enkel titel van box2


=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <editor> /path/to/file
    ```

=== "resultaat"
    Optionele uitleg.

    ``` title='/path/to/file' hl_lines="0"
    # inhoud van bestand
    ...
    ```

## De syntax van een shell commando - optie4 (mix en meerdere commando's)
Optionele uiteg: hier maak je een "copy" mogelijk van beide commando's. De output die vaak lang is, in een tab.

- 2 aparte tabs
- Het pad (PWD) `guru@hp:~$_` en het resultaat `resultaat` in de tab naam.
- geen titel van box1/2


=== "guru@hp:~$_"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    sudo <editor> /path/to/file
    ls -l
    ```

=== "resultaat"
    Optionele uitleg.

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo <editor> /path/to/file
    # inhoud file

    guru@hp:~$ ls -l
    total 32
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Desktop
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Documents
    drwxr-xr-x 2 guru guru 4096 Oct  7 13:11 Downloads
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Music
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Pictures
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Public
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Templates
    drwxr-xr-x 2 guru guru 4096 Jun  5 15:09 Videos
    ```


## Een Windows Powershell commando
(Optional) task explanation.

=== "PS C:\Users\guru06\Downloads>_"
    (Optional) step explanation.

    ``` title='' hl_lines="0"
    <execute some command>
    ```

=== "output"
    (Optional) step explanation.

    ``` title='' hl_lines="0"
    "PS C:\Users\guru06\Downloads>_ <execute some command>
    ...
    ...
    ```

