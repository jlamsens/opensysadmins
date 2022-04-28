# Install puppetserver on Linux Mint 20.x

## step0: as this is a lab environment: don't ask for the sudo password
``` bash title="guru1@vm1:-$ _"
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
```

## step1: enable puppet repo and refresh package list
``` bash title="guru1@vm1:-$ _"
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt-get update
```

## step2: install puppetserver
``` bash title="guru1@vm1:-$ _"
sudo apt-get install puppetserver -y
```

## step3: configure puppetserver
=== "command"

    ``` bash title="guru1@vm1:-$ _"
    sudo vi /etc/puppetlabs/puppet/puppet.conf
    ```

=== "contents"

    ``` bash title="/etc/puppetlabs/puppet/puppet.conf" hl_lines="14 15 16"
    # This file can be used to override the default puppet settings.
    # See the following links for more details on what settings are available:
    # - https://puppet.com/docs/puppet/latest/config_important_settings.html
    # - https://puppet.com/docs/puppet/latest/config_about_settings.html
    # - https://puppet.com/docs/puppet/latest/config_file_main.html
    # - https://puppet.com/docs/puppet/latest/configuration.html
    [server]
    vardir = /opt/puppetlabs/server/data/puppetserver
    logdir = /var/log/puppetlabs/puppetserver
    rundir = /var/run/puppetlabs/puppetserver
    pidfile = /var/run/puppetlabs/puppetserver/puppetserver.pid
    codedir = /etc/puppetlabs/code

    [main]
    certname = vm1.opensysadmins.lab
    server = vm1.opensysadmins.lab
    ```

## step4: start and verify puppetserver service
``` bash title="guru1@vm1:-$ _"
sudo systemctl start puppetserver
systemctl status puppetserver
/opt/puppetlabs/bin/puppetserver -v
```

## step5: check current certificates
``` bash title="guru1@vm1:-$ _"
sudo /opt/puppetlabs/bin/puppetserver ca list --all
```