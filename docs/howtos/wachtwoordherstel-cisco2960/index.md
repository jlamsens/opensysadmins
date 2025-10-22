# Wachtwoordherstel op een Cisco 2960-switch

Je doet een wachtwoordherstel op een Cisco Catalyst 2960 switch, wanneer het `console-wachtwoord` of het `enable exec-mode` wachtwoord (of beide) verloren of vergeten zijn. Zonder deze wachtwoorden is het onmogelijk om via de consolekabel of een beveiligde sessie (zoals SSH/Telnet) toegang te krijgen tot de geprivilegieerde EXEC-modus, de modus die nodig is om de configuratie van de switch te bekijken, wijzigen of beheren.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- [minicom](../setup-minicom-linuxmint22/index.md){:target="_blank"} terminal emulation software
- een console cable
- een Cisco 2960 24TT-L of 24TC-L Plus switch
- een [werkend IOS](../setup-ios-cisco2960/index.md){:target="_blank"}, maar niet toegankelijk

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Setup

<img src="console-access.png"/>

## Situatie
Het "consolewachtwoord" en "enable-wachtwoord" (Privileged EXEC-modus) worden - naast andere switchconfiguratie-instellingen - opgeslagen in de startup-config (NVRAM). Het herstellen van een verloren wachtwoord is alleen nuttig als je een ontoegankelijk - maar werkend - IOS hebt. Zo niet, dan heb je een groter probleem en moet je eerst het [IOS-besturingssysteem (her)installeren](../setup-ios-cisco2960/index.md){:target="_blank"}

=== "Probleem1"
    Geen toegang tot de console.

    ``` title='' hl_lines="0"
    ...
    User Access Verification

    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    % Bad passwords
    ```

=== "Probleem2"
    Wél toegang tot de console, maar géén toegang tot de "bevoorrechte exec-modus".

    ``` title='' hl_lines="0"
    Switch>enable
    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    % Bad secrets

    Switch>
    ```

## ROMMON
Volg eerst de stappen, om de switch op te starten in [ROMMON-modus via een koude start](../toegang-cisco-rommon/index.md#cold-start){:target="_blank"}. Blijf in ROMMON voor de verdere stappen.

### Wachtwoord herstel mechanisme ingeschakeld
Als het [mechanisme voor wachtwoordherstel](../fabrieksinstellingen-herstellen-cisco2960/index.md#wachtwoordherstelmechanisme-inschakelen){:target="_blank"} is *ingeschakeld*, is het mogelijk om het opstartconfiguratiebestand te behouden.

=== "Stap1"
    Geef een overzicht van de bestanden die in Flash zijn opgeslagen. Het opstartconfiguratiebestand `startup-config` uit NVRAM heet in deze modus `config.text`. Gevoelige configuratiedetails `private-config` uit NVRAM heet in deze mode `private-config.text`.

    ``` title='' hl_lines="7 8"
    switch: dir flash:
    Directory of flash:/

        2  -rwx  15979776  <date>               c2960-lanbasek9-mz.150-2.SE11.bin
        3  drwx  128       <date>               pnp-tech
        4  drwx  0         <date>               pnp-info
        5  -rwx  1781      <date>               config.text
        8  -rwx  1921      <date>               private-config.text
        9  -rwx  3096      <date>               multiple-fs

    49462784 bytes available (16081408 bytes used)

    switch: 
    ```

=== "Stap2"
    Optioneel: als je ervoor kiest het opstartconfiguratiebestand te willen behouden (je wil bv. de switch naam, IP adres op VLAN1, ... niet kwijt maar enkel het wachtwoord opnieuw instellen), hernoem dat bestand dan tijdelijk. Zo niet, sla deze stap dan over. 

    ``` title='' hl_lines="0"
    switch: rename flash:config.text flash:config.text.bak
    switch:
    ```

=== "Stap3"
    Optioneel: als je ervoor kiest het opstartconfiguratiebestand te *verwijderen* (je wil starten vanaf een lege configuratie), verwijder dan dat bestand. Zo niet, sla deze stap dan over.

    ``` title='' hl_lines="0"
    switch: delete flash:config.text
    switch:
    ```

=== "Stap4"
    Er is geen noodzaak om `private-config.text` handmatig te wissen (die wordt later toch opnieuw overschreven bij het instellen van een nieuw wachtwoord). Start de switch handmatig op.

    ``` title='' hl_lines="0"
    switch: boot
    Loading "flash:c2960-lanbasek9-mz.150-2.SE11.bin"...@@@@@@@@@@@@@@@@@
    ...
    ```

### Wachtwoord herstel mechanisme uitgeschakeld
Als daarentegen het [mechanisme voor wachtwoordherstel](../fabrieksinstellingen-herstellen-cisco2960/index.md#wachtwoordherstelmechanisme-inschakelen){:target="_blank"} is *uitgeschakeld*, is het niet mogelijk om het opstartconfiguratiebestand te behouden en moet je het systeem terugzetten naar de standaardconfiguratie.

=== "Stap1"
    Geef een overzicht van de bestanden die in Flash zijn opgeslagen. Het opstartconfiguratiebestand ontbreekt! 

    ``` title='' hl_lines="7"
    switch: dir flash:
    Directory of flash:/

        2  -rwx  15979776  <date>               c2960-lanbasek9-mz.150-2.SE11.bin
        3  drwx  128       <date>               pnp-tech
        4  drwx  0         <date>               pnp-info
        8  -rwx  5         <date>               private-config.text
        9  -rwx  3096      <date>               multiple-fs

    49415168 bytes available (16129024 bytes used)

    switch: 
    ```

=== "Stap2"
    Er is geen noodzaak om `private-config.text` handmatig te wissen (die wordt later toch opnieuw overschreven bij het instellen van een nieuw wachtwoord). Start de switch handmatig op.

    ``` title='' hl_lines="0"
    switch: boot
    Loading "flash:c2960-lanbasek9-mz.150-2.SE11.bin"...@@@@@@@@@@@@@@@@@
    ...
    ```

## IOS

=== "Stap1"
    Er is op dit moment geen opstartconfiguratiebestand (alleen een back-up opstartconfiguratiebestand, indien je hier eerder voor had gekozen). Voer "nee" in bij de prompt voor de eerste configuratie en schakel over naar de privileged exec-modus.

    ``` title='' hl_lines="0"
            --- System Configuration Dialog ---

    Would you like to enter the initial configuration dialog? [yes/no]:     -----> enter "no"
    Switch>enable
    Switch#
    ```

=== "Stap2"
    Als je een back-up van een opstartconfiguratiebestand hebt en dit wil herstellen, kopieer dan de inhoud van het back-up opstartconfiguratiebestand naar de actieve configuratie (het geheugen) en verwijder dan dat back-upbestand. Zo niet, sla deze stap dan over.

    ``` title='' hl_lines="1 21"
    Switch#copy flash:config.text.bak running-config
    Destination filename [running-config]?                  ---> ENTER
    % Login disabled on line 1, until 'password' is set
    % Login disabled on line 2, until 'password' is set
    % Login disabled on line 3, until 'password' is set
    % Login disabled on line 4, until 'password' is set
    % Login disabled on line 5, until 'password' is set
    % Login disabled on line 6, until 'password' is set
    % Login disabled on line 7, until 'password' is set
    % Login disabled on line 8, until 'password' is set
    % Login disabled on line 9, until 'password' is set
    % Login disabled on line 10, until 'password' is set
    % Login disabled on line 11, until 'password' is set
    % Login disabled on line 12, until 'password' is set
    % Login disabled on line 13, until 'password' is set
    % Login disabled on line 14, until 'password' is set
    % Login disabled on line 15, until 'password' is set
    % Login disabled on line 16, until 'password' is set
    1781 bytes copied in 0.964 secs (1848 bytes/sec)
    
    Switch#delete flash:config.text.bak
    Delete filename [config.text.bak]?                      ---> ENTER
    Delete flash:/config.text.bak? [confirm]                ---> ENTER
    Switch#
    ```

=== "Stap3"
    Wil je geen back-up herstellen, kan je indien gewenst de benodigde wachtwoorden instellen. Opgelet: het "privileged exec" wachtwoord via "enable secret" is een sterke versleuteling, het "console wachtwoord" via "service password-encryption" is een zwakke versleuteling (en eenvoudig te kraken).

    ``` title='' hl_lines="0"
    Switch#configure terminal 
    Enter configuration commands, one per line.  End with CNTL/Z.
    Switch(config)#enable secret cisco-EN-pass
    Switch(config)#line console 0
    Switch(config-line)#password cisco-CON-pass
    Switch(config-line)#login
    Switch(config-line)#exit
    Switch(config)#service password-encryption 
    Switch(config)#end
    Switch#
    ```

=== "Stap4"
    Kopieer de actieve configuratie naar de opstartconfiguratie. Herstart de switch.

    ``` title='' hl_lines="0"
    Switch#copy running-configuration startup-configuration         
    Building configuration...
    [OK]

    Switch#reload
    Proceed with reload? [confirm]                          ---> ENTER

    *Mar  1 00:15:53.633: %SYS-5-RELOAD: Reload requested by console. Reload Reason: Reload command.
    ...
    ```

=== "Stap5"
    Meld je aan met het nieuwe consolewachtwoord. Ga naar de privileged exec-modus met het nieuwe "enable"-wachtwoord.

    ``` title='' hl_lines="0"
    User Access Verification

    Password:                                               ---> enter "cisco-CON-pass"

    Switch>

    Switch>enable
    Password:                                               ---> enter "cisco-EN-pass"
    Switch#
    ```