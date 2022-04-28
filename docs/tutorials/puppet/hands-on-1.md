# Install puppet-agent on Debian Linux 11.x

## step0: as this is a lab environment: don't ask for the sudo password
``` bash title="guru2@vm2:-$ _"
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
```

## step1: install wget package
``` bash title="guru2@vm2:-$ _"
sudo apt-get update
sudo apt-get install wget
```

## step2: enable puppet repo
``` bash title="guru2@vm2:-$ _"
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt-get update
```

## step3: install puppet package
``` bash title="guru2@vm2:-$ _"
sudo apt-get install puppet-agent
```

## step4: adjust system path
``` bash title="guru2@vm2:-$ _"
echo 'export PATH=/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:$PATH' >> .bashrc
source .bashrc
```

## step5: comment (#) sudo path defaults
=== "command"

    ``` bash title="guru2@vm2:-$ _"
    sudo /usr/sbin/visudo
    ```

=== "contents"

    ``` bash title="/etc/sudoers" hl_lines="11"
    #
    # This file MUST be edited with the 'visudo' command as root.
    #
    # Please consider adding local content in /etc/sudoers.d/ instead of
    # directly modifying this file.
    #
    # See the man page for details on how to write a sudoers file.
    #
    Defaults	env_reset
    Defaults	mail_badpass
    # Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

    # Host alias specification

    # User alias specification
    ```

## step6: test puppet
``` bash title="guru2@vm2:-$ _"
sudo puppet help
```