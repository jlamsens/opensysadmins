# Connect puppet-agent on Rocky 6.x to puppetserver on Linux Mint 20.x

## step1: run puppet manually (ask for a certificate)
``` bash title="guru3@vm3:-$ _"
sudo puppet agent --server=vm1.opensysadmins.lab --no-daemonize --verbose --onetime
```

## step2: sign and verify the certificate on the puppetserver
``` bash title="guru1@vm1:-$ _"
sudo /opt/puppetlabs/bin/puppetserver ca sign --certname vm2.opensysadmins.lab
sudo /opt/puppetlabs/bin/puppetserver ca list --all
```

## step3: run puppet manually (apply catalog)
``` bash title="guru3@vm3:-$ _"
sudo puppet agent --server=vm1.opensysadmins.lab --no-daemonize --verbose --onetime
```