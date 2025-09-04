---
hide:
  - toc
---

# 04 Sysprep

Volg onderstaande instructies stap voor stap:

- [Stap 4.1: Maak een snapshot "clean install".](../../howtos/maak-snapshot-vm-virtualbox/index.md){:target="_blank"} 
Nu de basisinstallatie van Windows 11 is voltooid, is het tijd om een snapshot te maken. Deze snapshot, die we `clean install` noemen, fungeert als een herstelpunt. Zo kun je altijd terugkeren naar een schone, werkende staat van Windows 11, mocht er later iets misgaan.

- [Stap 4.2: Voer Sysprep uit.](../../howtos/sysprep-windows11-vm-virtualbox/index.md){:target="_blank"} 
Het is nu tijd om `Sysprep` (System Preparation Tool) uit te voeren. Met dit hulpprogramma bereid je de virtuele machine voor op eventuele duplicatie en verdere distributie. 

- [Stap 4.3: Maak een snapshot "Sysprep".](../../howtos/maak-snapshot-vm-virtualbox/index.md){:target="_blank"} 
Na het succesvol uitvoeren van Sysprep is het cruciaal om een tweede snapshot te maken. Deze snapshot fungeert nu als de ultieme "template image" of eventueel de basis voor al je toekomstige Windows 11 virtuele machines.