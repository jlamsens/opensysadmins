# VirtualBox installatie methoden

## VirtualBox installeren op Linux Mint 22 (Ubuntu 24.04)
Oracle onderhoudt vaak twee reeksen van VirtualBox, bv.

- **VirtualBox 7.0**
  - Stabiliteit en lange ondersteuning
  - Gericht op conservatieve gebruikers en bedrijven
  - ⚠️ End of Life sinds maart 2025, maar laatste versie **7.0.26** bevat nog belangrijke bugfixes

- **VirtualBox 7.1**
  - Actief onderhouden
  - Nieuwe functies en verbeteringen
  - Gericht op ontwikkelaars en testers
  - Laatste versie: **7.1.12**

De standaard Linux Mint 22 / Ubuntu 24.04 repositories bevatten **v7.0.16**, een verouderde versie met bekende problemen, o.a. freezes bij Windows 11 24H2.

## Overzicht van installatiemethoden

Er zijn drie manieren om VirtualBox te installeren:

1. Via de [standaard Linux Mint / Ubuntu repositories](../../howtos/setup-virtualbox7-linuxmint22-distributierepo/index.md){:target="_blank"}
2. Via de [officiële Oracle APT-repository](../../howtos/setup-virtualbox7-linuxmint22-oraclerepo/index.md){:target="_blank"}
3. Via [manuele installatie van `.deb`-pakketten](../../howtos/setup-virtualbox7-linuxmint22-oracledeb/index.md){:target="_blank"} van de Oracle-website