# Install puppet-agent on Rocky Linux 8.5

## step1: enable puppet repo (run the rpm tool in upgrade mode)
``` bash title="guru3@vm3:-$ _"
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
```

## step2: install package
``` bash title="guru3@vm3:-$ _"
sudo yum install puppet-agent
```

## step3: adjust system path
``` bash title="guru3@vm3:-$ _"
echo 'export PATH=/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:$PATH' >> .bashrc
source .bashrc
```

## step4: comment (#) sudo path defaults
=== "command"

    ``` bash title="guru3@vm3:-$ _"
    sudo /usr/sbin/visudo
    ```

=== "contents"

    ``` bash title="/etc/sudoers" hl_lines="10"
    ## Sudoers allows particular users to run various commands as
    ## the root user, without needing the root password.
    ##
    ## Examples are provided at the bottom of the file for collections
    ## of related commands, which can then be delegated out to particular
    ## users or groups.
    ## 
    ...
    ...
    # Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
    ...
    ...
    ```

## step5: test puppet
``` bash title="guru3@vm3:-$ _"
sudo puppet help
```