# Configuration operating system

## Linux Mint 20.X

### IPv4/default gateway/DNS

=== "Step1"
    Rechtsklik op het "netwerk icoontje".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/network-settings.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/network-settings.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/ipv4-and-dns.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/ipv4-and-dns.png) </kbd>

=== "Step3"
    Gebruik de "schuif button" bij "Wired" om de connectie te activeren. Mocht de "Connection established" niet verschijnen, moet je mogelijks "herstarten".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/connection-established.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/connection-established.png) </kbd>

### Full update 1 / 2

=== "Step1"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-icon.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-icon.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-ok.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-ok.png) </kbd>

=== "Step3"
    Klik voorlopig op "No" in de blauwe balk.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/local-mirror.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/local-mirror.png) </kbd>

=== "Step4"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/refresh.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/refresh.png) </kbd>

=== "Step5"
    Mogelijks is een nieuwe versie van de "Update Manager" beschikbaar. Doe de update.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-new-version.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-new-version.png) </kbd>

=== "Step6"
    Reminder: password is "guru1".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-authenticate.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-authenticate.png) </kbd>

### Full update 2 / 2

=== "Step7"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-install-updates.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-install-updates.png) </kbd>

=== "Step8"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-trigger-additional-changes.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-trigger-additional-changes.png) </kbd>

=== "Step9"
    Reminder: paswoord is "guru1".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-trigger-additional-changes-authenticate.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-trigger-additional-changes-authenticate.png) </kbd>

=== "Step10"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-downloading-packages.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-downloading-packages.png) </kbd>

=== "Step11"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-icon.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-icon.png) </kbd>

=== "Step12"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-system-updated.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/update-manager-system-updated.png) </kbd>


### Ignore system reports

=== "Step1"
    Menu -> Administration -> System Reports. Selecteer telkens "Ignore this report" bij alle openstaande "reports".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-ignore-all.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-ignore-all.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-no-problems-detected.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/system-reports-no-problems-detected.png) </kbd>

### Resolving host names

=== "Step1"
    Reminder: password is "guru1".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/sudo-nano-etc-hosts.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/sudo-nano-etc-hosts.png) </kbd>

=== "Step2"
    Text editor "nano" wijst zichzelf uit. Gebruikers van "vi", laat je gaan!

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/nano-hosts-adjust.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/nano-hosts-adjust.png) </kbd>

### Shutdown
We verwijderen nog gauw even onze commando historiek en zetten de machine uit.

<kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/mint/history-clear-shutdown.png "Linux Mint 20.X")](../../assets/images/virtualbox-windows/configure-os/mint/history-clear-shutdown.png) </kbd>

## Debian 11.X

### IPv4/default gateway/DNS

=== "Step1"
    Login met gebruiker "guru2". Password is ook "guru2".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/login-guru2.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/login-guru2.png) </kbd>

=== "Step2"
    De netwerkinterface heet "enp0s3". We gaan die configureren.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/check-nic-name-nano-etc-network-interfaces.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/check-nic-name-nano-etc-network-interfaces.png) </kbd>

=== "Step3"
    Neem onderstaande configuratie over.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-network-interfaces.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-network-interfaces.png) </kbd>

=== "Step4"
    Instellen nameserver.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-resolv-conf.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-resolv-conf.png) </kbd>

=== "Step5"
    Neem onderstaande configuratie over.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/etc-resolv-conf.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/etc-resolv-conf.png) </kbd>

=== "Step6"
    Herstart de netwerk service. Vervolgens zou de ping moeten lukken.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/restart-network-ping.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/restart-network-ping.png) </kbd>

### Full update

=== "Step1"
    Configuratie van de package source file.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-apt-sources-list.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-apt-sources-list.png) </kbd>

=== "Step2"
    Dit wordt het meeste typwerk. Geen fouten maken! ;-)

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/etc-apt-sources-list.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/etc-apt-sources-list.png) </kbd>

=== "Step3"
    Bijwerken van de lijst met beschikbare pakketten en hun versies.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/apt-update.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/apt-update.png) </kbd>

=== "Step4"
    Uitvoeren van de effectieve "upgrade" van alle geïnstalleerde pakketten.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/apt-dist-upgrade.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/apt-dist-upgrade.png) </kbd>

### Resolving host names

=== "Step1"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-hosts.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/nano-etc-hosts.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/etc-hosts.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/etc-hosts.png) </kbd>

### Shutdown

<kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/debian/clear-history-shutdown.png "Debian 11.X")](../../assets/images/virtualbox-windows/configure-os/debian/clear-history-shutdown.png) </kbd>

## Rocky Linux 8.X

### IPv4/default gateway/DNS

=== "Step1"
    Inloggen met "guru3". Password is ook "guru3".

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/login-guru3.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/login-guru3.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/check-nic-vi-nano-ifcfg-enp0s3.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/check-nic-vi-nano-ifcfg-enp0s3.png) </kbd>

=== "Step3"
    Neem onderstaande configuratie over. Sommige regels zijn reeds aanwezig (en/of moeten aangepast worden).

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/vi-ifcfg-enp0s3.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/vi-ifcfg-enp0s3.png) </kbd>

=== "Step4"
    Herstart de netwerk service. Vervolgens zou de ping moeten lukken.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/ifup-ping.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/ifup-ping.png) </kbd>

### Full update

=== "Step1"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-yum-check-update.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-yum-check-update.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-yum-update.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-yum-update.png) </kbd>

=== "Step3"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/gpgkey-import-y.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/gpgkey-import-y.png) </kbd>

### Resolving host names

=== "Step1"
    Of gebruik "nano" indien meer comfortabel.

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/vi-etc-hosts.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/vi-etc-hosts.png) </kbd>

=== "Step2"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/etc-hosts.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/etc-hosts.png) </kbd>

=== "Step3"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/vi-etc-hostname.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/vi-etc-hostname.png) </kbd>

=== "Step4"

    <kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/etc-hostname.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/etc-hostname.png) </kbd>

### Shutdown

<kbd> [![Configuration operating system](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-shutdown.png "Rocky Linux 8.X")](../../assets/images/virtualbox-windows/configure-os/rocky/sudo-shutdown.png) </kbd>