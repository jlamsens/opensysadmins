# ...

#### Installatie via Oracle-website (.deb-pakket)

- **Flexibel**: kies manueel een specifieke versie  
- **Voordeel**: geen afhankelijkheid van repo's  
- **Nadeel**: geen automatische updates via APT

1. Download het `.deb`-pakket van de gewenste versie vanaf [https://www.virtualbox.org/wiki/Download_Old_Builds](https://www.virtualbox.org/wiki/Download_Old_Builds)
2. Installeer het pakket:

```bash
sudo dpkg -i virtualbox-<versie>.deb
sudo apt -f install
```

3. Vergrendel de versie ("hold") zodat die niet automatisch wordt geüpdatet

```bash
sudo apt-mark hold virtualbox
```

Wil je later toch upgraden, hef dan de hold op:
```bash
sudo apt-mark unhold virtualbox
```


## 🔐 Uitleg: verschil tussen `apt-key` en `gpg --dearmor`

| Methode                   | Beschrijving                                                                 | Aanbevolen? |
|---------------------------|------------------------------------------------------------------------------|-------------|
| `apt-key add`             | Verouderde methode. Sleutel komt in de globale keyring (`/etc/apt/trusted.gpg`) | ❌ Nee      |
| `gpg --dearmor` + keyring | Moderne, veilige methode. Sleutel wordt repo-specifiek gebruikt via keyring-bestand | ✅ Ja       |

Oracle biedt dezelfde `.asc`-sleutel aan via beide methoden. De moderne aanpak is veiliger, gescheiden per repository en toekomstbestendig.
