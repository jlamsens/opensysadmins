# Configure OS

## Guest additions
=== "StepX"
    Op dit moment draait Windows 11 nog niet “fullscreen” én is de shared folder “/home/guru/Downloads” nog niet zichtbaar in de Verkenner. Hiervoor dien je de “VirtualBox Guest Additions” te installeren. Selecteer in het Devices -> Insert Guest Additions CD Image (op het eerste zicht, gebeurt er niets, maar er wordt een virtuele CD “gemount”).

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    start de Verkenner: je ziet deze “virtuele CD” nu via de D:\ drive

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Dubbelklik op “VboxWindowsAdditions-amd64”. Lees en begrijp alle meldingen. Volg de standaard installatie procedure + herstart.


    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Login (“guru”/”guru”).

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Klik op View -> Full-screen Mode.

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Lees/begrijp wat vervolgens als pop-up verschijnt.

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    Start de “Verkenner”: rechtermuisknop op D:\ -> Eject (= “verwijder de virtuele CD”, de Verkenner sluit)

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    de shared folder “/home/guru/Downloads” is nu wel zichtbaar in de verkenner, via een drive-letter Z:

    <img src="../1280-720.png" width="320" height="180"/>



## IP address
=== "StepX"
    rechtermuisknop netwerk icoontje -> Network and Internet settings

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    klik op “Ethernet”

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    klik op “Edit”

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    we gaan “DHCP” wijzigen naar “Manual”, zet ineens “IPv4” aan en configureer IP, subnetmask, gateway en DNS server

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    “Windows Key + R” om het “run” venster te tonen + typ “cmd” om een commando-regel te starten: verifieer je Internetverbinding

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    het netwerkicoon rechtsonderaan zal weldra wijzigen in dit:

    <img src="../1280-720.png" width="320" height="180"/>

## Computername
wijzig de computernaam naar “vm6” (herstart “later”)

<img src="../1280-720.png" width="320" height="180"/>

## Automatic updates
=== "StepX"
    doe een volledige update van Windows en herstart indien nodig

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    klik op “Check for updates”, tot geen updates meer beschikbaar zijn

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    “disable” daarna de automatic updates; “Windows Key + R” om het “run” venster te tonen

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    typ “services.msc” en druk “Enter”

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    XXX

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    scroll in de lijst tot je “Windows Update” ziet. Dubbelklik. Onder tab “General” kies je bij “Startup type” voor “Disabled”. Klik vervolgens “OK”.

    <img src="../1280-720.png" width="320" height="180"/>

## Restart and shutdown
=== "StepX"
    doe nog een laatste “herstart”

    <img src="../1280-720.png" width="320" height="180"/>

=== "StepX"
    “shutdown” (afsluiten) van Windows

    <img src="../1280-720.png" width="320" height="180"/>







