# Test een Windows/Linux lab omgeving

Deze howto is de afsluiting van je labopzet en laat zien hoe je de functionaliteit van je gemengde virtuele omgeving test. Je leert hoe je de onderlinge communicatie en netwerkverbindingen verifieert tussen je Windows 11 clients, Windows Servers, Linux Mint en Debian 13 VM's binnen het geconfigureerde NAT Network. Dit zorgt ervoor dat je virtuele lab, klaar voor beheer- en testtaken, correct functioneert voordat je met je projecten begint.

## Vereisten
- een [PC met Linux Mint 22](../../tutorials/setup-windows11-linuxmint22-dual-boot-uefi/index.md ){:target="_blank"}
- een werkende installatie van [VirtualBox](../setup-virtualbox7-linuxmint22-oracledeb/index.md){:target="_blank"}
- een werkende [Windows 11 virtuele machine](../../tutorials/setup-windows11-vm-virtualbox/index.md){:target="_blank"} template.
- een werkende [Windows Server 2025 virtuele machine](../../tutorials/setup-windows-server2025-vm-virtualbox/index.md){:target="_blank"} template.
- een werkende [Linux Mint 22 virtuele machine](../../tutorials/setup-linuxmint22-vm-virtualbox/index.md){:target="_blank"} template.
- een werkende [Debian 13 virtuele machine](../../tutorials/setup-debian13-vm-virtualbox/index.md){:target="_blank"} template.
- [gekloonde virtuele machines](../maak-clone-vm-virtualbox/index.md){:target="_blank"}
- een VirtualBox [NAT network](../configureer-natnetwork-virtualbox/index.md){:target="_blank"}
- een compleet VirtualBox [virtueel LAB](../configureer-lab-vm-virtualbox/index.md){:target="_blank"}
- een [LAB clean install snapshot](../maak-snapshot-vm-virtualbox-labclean/index.md){:target="_blank"} van het virtuele LAB

## Demo
<iframe width="854" height="480" src="https://www.youtube.com/embed/xiRsG7-qaQY?autoplay=0&loop=0&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>