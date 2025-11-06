# Wachtwoordherstel op een Cisco 1941 router

Je doet een wachtwoordherstel op een Cisco 1941 router, wanneer het `console-wachtwoord` of het `enable exec-mode` wachtwoord (of beide) verloren of vergeten zijn. Zonder deze wachtwoorden is het onmogelijk om via de consolekabel of een beveiligde sessie (zoals SSH/Telnet) toegang te krijgen tot de geprivilegieerde EXEC-modus, de modus die nodig is om de configuratie van de router te bekijken, wijzigen of beheren.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- [minicom](../setup-minicom-linuxmint22/index.md){:target="_blank"} terminal emulation software
- een console cable
- een Cisco 1941 router
- een [werkend IOS](../setup-ios-cisco1941/index.md){:target="_blank"}, maar niet toegankelijk

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Setup

<img src="console-access.png"/>

## Situatie
Het "consolewachtwoord" en "enable-wachtwoord" (Privileged EXEC-modus) worden - naast andere switchconfiguratie-instellingen - opgeslagen in de startup-config (NVRAM). Het herstellen van een verloren wachtwoord is alleen nuttig als je een ontoegankelijk - maar werkend - IOS hebt. Zo niet, dan heb je een groter probleem en moet je eerst het [IOS-besturingssysteem (her)installeren](../setup-ios-cisco1941/index.md){:target="_blank"}

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
    Router>enable
    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    Password:           <--- typ een fout wachtwoord
    % Bad secrets

    Router>
    ```

## ROMMON
Volg eerst de stappen, om de router op te starten in [ROMMON-modus](../toegang-cisco-rommon/index.md#cisco-1941-router){:target="_blank"}. Blijf in ROMMON voor de verdere stappen. Bij mijn weten, is er geen "password recovery mechanism" zoals op een Cisco 2960 switch.

=== "Step1"
    Het configuratieregister is normaal gesproken ingesteld op 0x2102. Wijzig dit naar 0x2142. Hiermee omzeilen we het opstartconfiguratiebestand.

    ``` title='' hl_lines="0"
    rommon 1 > confreg 0x2142 


    You must reset or power cycle for new config to take effect
    rommon 2 > 
    ```

=== "Step2"
    Herstart de router.

    ``` title='' hl_lines="0"
    rommon 3 > reset
    
    System Bootstrap, Version 15.0(1r)M16, RELEASE SOFTWARE (fc1)
    ...
    ```

=== "Step3"
    Je wordt begroet met het dialoogvenster voor de eerste configuratie. Antwoord "nee" en druk op ++enter++. Ga naar de privileged exec-modus.

    ``` title='' hl_lines="0"
    --- System Configuration Dialog ---

    Would you like to enter the initial configuration dialog? [yes/no]: no


    Press RETURN to get started!
    ...
    ...
    Router>enable
    Router#
    ```

=== "Step4a"
    Optioneel: als je de opstartconfiguratie niet wil behouden, verwijder je deze nu. Anders sla je deze stap over.

    ``` title='' hl_lines="0"
    Router#erase startup-config 
    Erasing the nvram filesystem will remove all configuration files! Continue? [confirm]
    [OK]
    Erase of nvram: complete
    Router#
    ```

=== "Step4b"
    Optioneel: als je de opstartconfiguratie wil behouden, kopieer deze dan naar het geheugen. Zoniet, sla deze stap dan over.

    ``` title='' hl_lines="0"
    Router#copy startup-config running-config
    Destination filename [running-config]? 
    1170 bytes copied in 0.132 secs (8864 bytes/sec)

    Router#
    ```

=== "Step5"
    Configureer de nieuwe privileged exec-modus en consolewachtwoorden. Wijzig het configuratieregister terug naar 0x2102. Sla de actieve configuratie op en laad deze opnieuw.

    ``` title='' hl_lines="0"
    Router#conf t
    Router(config)#enable secret cisco-EN-pass

    Router(config)#line console 0
    Router(config-line)#password cisco-CON-pass
    Router(config-line)#login
    Router(config-line)#exit

    Router(config)#config-register 0x2102
    Router(config)#end

    Router#copy running-config startup-config
    Destination filename [startup-config]? 
    Building configuration...
    [OK]

    Router#reload

    System configuration has been modified. Save? [yes/no]: no      <--- mogelijks krijg je deze extra vraag
    Proceed with reload? [confirm]                                  <--- druk ENTER

    *Apr  4 12:22:50.391: %SYS-5-RELOAD: Reload requested by console. Reload Reason: Reload Command.
    ```

=== "Step6"
    Meld je aan met het nieuwe consolewachtwoord. Ga naar de privileged exec-modus met het nieuwe "enable"-wachtwoord.

    ``` title='' hl_lines="0"
    User Access Verification

    Password:                                               ---> typ "cisco-CON-pass"

    Router>

    Router>enable
    Password:                                               ---> typ "cisco-EN-pass"
    Router#
    ```
