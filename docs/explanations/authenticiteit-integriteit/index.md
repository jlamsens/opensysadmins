# Verifiëren van de echtheid (authenticiteit) en integriteit van een gedownload bestand

## Introductie
`Authenticiteit` betekent dat het bestand van de juiste bron komt. `Integriteit` betekent dat het bestand onderweg niet is gewijzigd.

## Bestand sha256sum.txt
Het bestand sha256sum.txt bevat de officiële SHA256 hash-waarden (unieke, lange reeksen tekens, de "digitale vingerafdrukken") voor de bijbehorende Linux Mint ISO bestanden die je kan downloaden, samen met hun bestandsnamen, en dient als een referentielijst die de uitgever (Linux Mint) verstrekt om jou in staat te stellen de integriteit te verifiëren.

De inhoud ziet er als volgt uit:

``` title='sha256sum.txt' hl_lines="1"
ccf482436df954c0ad6d41123a49fde79352ca71f7a684a97d5e0a0c39d7f39f *linuxmint-22.1-cinnamon-64bit.iso
d286306d0f40bd7268f08c523ece5fba87c0369a27a72465a19447e3606c5fa0 *linuxmint-22.1-mate-64bit.iso
6451496af35e6855ffe1454f061993ea9cb884d2b4bc8bf17e7d5925ae2ae86d *linuxmint-22.1-xfce-64bit.iso
```

## Sleutels
Cryptografie met publieke sleutels werkt met een sleutelpaar:

- Private Sleutel (Geheim): om iets te ondertekenen (bijvoorbeeld een bestand). Alleen de eigenaar (Linux Mint team) heeft deze.
- Publieke Sleutel (Openbaar): om de handtekening te verifiëren. Deze wordt openbaar verspreid.

## Bestand sha256sum.txt.gpg
Het Linux Mint team heeft de sha256sum.txt file `ondertekend` met hun private key, wat resulteert in de `sha256sum.txt.gpg` file. 

!!! danger "Ondertekend <-> versleuteld"
    Opgelet: `ondertekend` en dus NIET `versleuteld`; de sha256sum.txt file is na dit proces nog steeds gewoon leesbaar. Versleuteling is bedoeld om de inhoud onleesbaar te maken voor onbevoegden (geheimhouding). Ondertekening is bedoeld om de authenticiteit en integriteit te bewijzen (zekerheid van de bron).

Dit is dus NIET de versleutelde inhoud van `sha256sum.txt`. Het bestand is niet volledig versleuteld; het is een binaire GPG-verpakking die twee hoofdcomponenten bevat:

1. Het Cruciale Versleutelde Deel; het enige deel dat cryptografisch is bewerkt met de private key is de hash (vingerafdruk) van het originele document (sha256sum.txt). Dit is wat de `digitale handtekening` is. Dit bewijst dat alleen de eigenaar van die private key de handtekening heeft kunnen maken (authenticiteit).

2. Het Onversleutelde Deel; de metadata wordt niet versleuteld; deze is leesbaar in de GPG-verpakking en wordt gebruikt door jouw GPG-software om de verificatie uit te voeren. Dit vertelt jouw computer welke publieke sleutel te gebruiken en welk tijdstip de handtekening is gezet.

De `sha256sum.txt.gpg` file bevat dus versleutelde tekens, maar alleen die van de gehashte vingerafdruk (hash), die door de private key tot de eigenlijke digitale handtekening wordt omgevormd. De metadata is gewone data die nodig is om het proces te laten werken.

## Bestand sha256sum.txt.gpg in detail

Laten we er de inhoud eens bijhalen:
``` title='sha256sum.txt.gpg' hl_lines="0"
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEJ96xVkTGs88719KRMA+Ea6JbrgkFAmeGS/YACgkQMA+Ea6Jb
rgkocRAAp4AGfU0tdKSy4F1+ZBEp2Eethr5LRShbjafwsIcL/qTQm9fFgoSo38A2
dG+6xcBhAeqMDPrZ5RnjA5qsySjQcOiBpRsfeFeBFz6TBZLmflpOLiKbBb6Aqfg8
/aRzzTlZ09wEuzUBcPhiyml5UcmoT+1fGXwE4LyoMs3fyvEVIATocAjhHOTj97kl
tiEFa3DSFJ3uHoJ1eVvRoMqXvTmsgN+kktsxN5CC/eM/7KSGq5rIMMLHJirrxuNl
+OSvV+tBMYeh5KXmJaG41f56JVJxb+/tg2p689QpZhphXHVf/8EpVRfuWSrHf0tI
GPwamgJ38+mRSwwTyqXjqrUo4niihnd1TqyNKBfNosSh2cv8FYKm4jqyAXQ0y4nb
+8qOAFDluj5jW+YEl+HrYqueW/bqhdK/07yWdPVzQIIraOLn9iM1g4zxD6VCSypL
SfMNjzJMSaCt3P6ZbRlNda4SYvInZms4wGRhsiD6RDnV0PWgrL5KrlLuHn3pubf1
pvmlEw7Pn1yJ2kUfwV0wMmrt5ZdqQ4e3vyIPgCa7xlr9/20oUQ5c1ezOHzwVmvM0
lu5b6gAVAbHjbxCRMfGz51zrBCFnAE+jOZUZbn4Ds4KaIHyiVM2WEpac3bcGgPMh
xCkuhjhPc4lr8HeLVYussf1MrWR3d6OYfvR+JbTZ1QPS8/U8FOk=
=C1Ne
-----END PGP SIGNATURE-----
```

Dit is een voorbeeld van een `PGP ASCII Armored Signature`, wat een tekstgecodeerde weergave is van de binaire handtekening. De "vingerafdruk" (de hash van de data) en de "metadata" zijn niet direct leesbaar als tekst in dit gecodeerde blok; ze zitten beide verpakt in de gecodeerde data tussen de BEGIN en END lijnen.

Waar zit nu wat?

- De Metadata (De Leesbare Pointers); dit is de informatie die jouw GPG-software vertelt wat voor soort handtekening dit is en welke sleutel het moet gebruiken. Het zijn de leesbare velden bovenaan.

| Veld | Waarde | Betekenis |
| :--- | :--- | :--- |
| **PGP Message Packet** | `iQIzBAABCgAd` | Code die aangeeft dat dit een standaard PGP-handtekening is. |
| **Key ID Hint** | `FiEEJ96xVkTGs88719KRMA+Ea6Jbrgk` | De verkorte identificatie van de publieke sleutel die gebruikt moet worden om de handtekening te verifiëren. |
| **Tijdstempel/Datum** | `FAmeGS/Y` | De datum en tijd waarop de ondertekening heeft plaatsgevonden (gecodeerd in Unix-tijd). |
| **Gecodeerd Blok Start** | `ACgkQMA+Ea6JbrgkocRA...` | Code die het begin van het grote, gecodeerde handtekeningblok markeert. |


- De Versleutelde Vingerafdruk (De Digitale Handtekening); dit is het binaire deel dat versleuteld is met de private key van de afzender. Dit vormt de kern van de authenticatie. Het zit verborgen in het grote blok willekeurige karakters tussen de metadata en de checksum. Nadat jouw GPG-software dit blok (van ACgkQMA+Ea6JbrgkocRA... tot het einde) decrypteert met de publieke sleutel, onthult het de oorspronkelijke hash (vingerafdruk) die de ondertekenaar had berekend van het document. Jouw GPG berekent de hash van het document opnieuw en vergelijkt deze met de onthulde hash. Als ze overeenkomen, krijg je "Good signature."

| Component | Behandeling | Doel |
| :--- | :--- | :--- |
| **Vingerafdruk** (de hash van `sha256sum.txt`) | **Versleuteld** met de **private key** van de afzender. | Dit bewijst dat alleen de eigenaar van die private key de handtekening heeft kunnen maken (**Authenticiteit**). |
| **Metadata** (Key-ID, tijdstempel, algoritme) | **Niet versleuteld** (gewone binaire of tekstdata). | Dit vertelt het verificatieprogramma **welke sleutel** te gebruiken en welk **tijdstip** de handtekening is gezet. |


## Conclusie

De authenticiteit wordt gecontroleerd via de digitale handtekening (GPG), en de integriteit wordt gecontroleerd via de hash-waarde (SHA256). Samen zorgen ze voor de maximale zekerheid.

De authenticiteitscheck moet altijd eerst gebeuren, omdat je moet weten of de integriteitsinformatie (de hash-waarden) wel van de juiste bron komt voordat je die gebruikt.