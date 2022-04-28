# Connect puppet-agent on Debian 11.x to puppetserver on Linux Mint 20.x

## step1: run puppet manually on the puppet-agent (ask for a certificate)
``` bash title="guru2@vm2:-$ _"
sudo puppet agent --server=vm1.opensysadmins.lab --no-daemonize --verbose --onetime
```
## step2: sign and verify the certificate on the puppetserver
``` bash title="guru1@vm1:-$ _"
sudo /opt/puppetlabs/bin/puppetserver ca sign --certname vm2.opensysadmins.lab
sudo /opt/puppetlabs/bin/puppetserver ca list --all
```