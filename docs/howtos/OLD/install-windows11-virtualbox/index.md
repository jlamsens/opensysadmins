# Install Windows 11 in VirtualBox 6.1.44
## Create VM
=== "StepX"
    XXX

    <img src="1280-720.png" width="320" height="180"/>

=== "StepX"
    XXX

    <img src="1280-720.png" width="320" height="180"/>



## Configure VM
11 steps

## Install OS
### Boot from ISO
3 steps

### Bypass
4 steps

### Time and currency format
Dutch (Belgium). Keyboard or input method: “Belgian (Period).

### Activation (depends)
The presence or absence of the "Windows activation" screen during the installation of Windows 11 22H2 can depend on various factors. If you get this screen, choose "I don't have a product key". If not, proceed to the next step.

### Select OS (depends)
The presence or absence of the "Select the operating system you want to install" screen during the installation of "Windows 11 22H2" can depend on various factors. If you get this screen, choose "Windows 11 Pro". If not, proceed to the next step.

### Install now
Notice, you also have a "repair" option here... Choose "Install now".

### License agreement
Accept.

### Type of installation
Select “Custom: Install Windows only (advanced)".

### Installation location & partitioning
There are no partitions yet. Click "next".

### Installing
Grab a coffee.
The VM reboots for the first time. Virtual UEFI/BIOS won't boot of the ISO image, as it finds a Windows installation on the virtual harddrive.
Getting ready.
Restart2.

### Configuration
Personal preference here. I select "Belgium".
Personal preference here. I select "Belgian (Period)".
Select "Skip".

### Bypass internet connection
Momenteel is nog geen Internetverbinding actief (NAT-network). Microsoft wil ons hier nl. zoveel mogelijk pushen in de
richting van een Microsoft account. Dit omzeilen we even. Druk “shift+F10” en typ op de
commando-regel: “OOBE\BYPASSNRO” (opgelet: letters “O” en geen cijfer “0”, mag in kleine letters)

De virtuele machine herstart en de OOBE (Out-of-the-box-experience) herstart. Helaas moet je
nogmaals de correcte regio (Belgium) en keyboard layout (Belgium(period)) kiezen. “Skip” ook opnieuw
de extra keyboard layout.

We krijgen nu de optie “I don’t have internet”. Kies deze.

Selecteer “Continue with limited setup”.

### Account
Login: guru
Password: guru
Acknowlege the password: guru
Security question1: Doggy
Security question2: Wevelgem
Security question3: IT guru

### Finishing
Location based services: “No”.
Find my device: “No”.
Diagnostic data: “Required only”.
Inking & typing: “No”.
Tailored experiences: “No”.
Advertising ID: “No”.
Installing...
Installation done! Merk op, dat je in deze fase o.a. nog geen “full screen” kan bekomen. Hiervoor zijn de
“virtualbox guest additions” nodig die we straks installeren.

## Configure OS

### Guest additions
Op dit moment draait Windows 11 nog niet “fullscreen” én is de shared folder “/home/guru/Downloads” nog niet zichtbaar in de Verkenner. Hiervoor dien je de “VirtualBox Guest Additions” te installeren. Selecteer in het Devices -> Insert Guest Additions CD Image (op het eerste zicht, gebeurt er niets, maar er wordt een virtuele CD “gemount”)

start de Verkenner: je ziet deze “virtuele CD” nu via de D:\ drive

Dubbelklik op “VboxWindowsAdditions-amd64”. Lees en begrijp alle meldingen. Volg de
standaard installatie procedure + herstart.

Login (“guru”/”guru”)

Klik op View -> Full-screen Mode

Lees/begrijp wat vervolgens als pop-up verschijnt

Start de “Verkenner”: rechtermuisknop op D:\ -> Eject (= “verwijder de virtuele CD”, de Verkenner sluit)

de shared folder “/home/guru/Downloads” is nu wel zichtbaar in de verkenner, via een drive-letter Z:

### IP address
rechtermuisknop netwerk icoontje -> Network and Internet settings

klik op “Ethernet”

klik op “Edit”

we gaan “DHCP” wijzigen naar “Manual”, zet ineens “IPv4” aan en configureer IP, subnetmask,
gateway en DNS server

“Windows Key + R” om het “run” venster te tonen + typ “cmd” om een commando-regel te
starten: verifieer je Internetverbing

het netwerkicoon rechtsonderaan zal weldra wijzigen in dit:

### Computername
wijzig de computernaam naar “vm6” (herstart “later”)

### Automatic updates
doe een volledige update van Windows en herstart indien nodig

klik op “Check for updates”, tot geen updates meer beschikbaar zijn

“disable” daarna de automatic updates; 
- “Windows Key + R” om het “run” venster te tonen
- typ “services.msc” en druk “Enter”
- scroll in de lijst tot je “Windows Update” ziet. Dubbelklik. Onder tab “General” kies je bij “Startup type” voor “Disabled”. Klik vervolgens “OK”.

### Restart and shutdown
doe nog een laatste “herstart”

“shutdown” (afsluiten) van Windows

## Snapshot VM
Klik op het icoontje met de 3 vierkantjes/streepjes en kies “Snapshots”. Windows moet zeker “Powered
Off” zijn.

Selecteer de “current state” en klik op “Take”. Geef als naam “Clean install”

Vanaf je iets wijzigt in deze virtuele machine, krijg je “Current State (changed). Mocht je nu “Windows”
om zeep helpen, dan kan je steeds terugkeren naar een “Clean install” situatie via “Restore snapshot”.
