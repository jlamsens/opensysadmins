# Apt-key vs GPG

| Methode                   | Beschrijving                                                                 | Aanbevolen? |
|---------------------------|------------------------------------------------------------------------------|-------------|
| `apt-key add`             | Verouderde methode. Sleutel komt in de globale keyring (`/etc/apt/trusted.gpg`) | ❌ Nee      |
| `gpg --dearmor` + keyring | Moderne, veilige methode. Sleutel wordt repo-specifiek gebruikt via keyring-bestand | ✅ Ja       |

Oracle biedt dezelfde `.asc`-sleutel aan via beide methoden. De moderne aanpak is veiliger, gescheiden per repository en toekomstbestendig.