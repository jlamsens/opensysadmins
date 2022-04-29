# Explore resource syntax

## step1: request a file resource description that does not yet exist
``` bash title="guru2@vm2:-$ _"
puppet resource file /tmp/hello
```

## step2: create an empty file and do the request again
``` bash title="guru2@vm2:-$ _"
touch /tmp/hello
puppet resource file /tmp/hello
```

## step3: modify a file resource using puppet and verify
``` bash title="guru2@vm2:-$ _"
puppet resource file /tmp/hello content='Hello world!'
cat /tmp/hello
```

## step4: request a package resource description that does not yet exist
``` bash title="guru2@vm2:-$ _"
puppet resource package apache2
```

## step5: install a package resource
``` bash title="guru2@vm2:-$ _"
sudo puppet resource package apache2 ensure=present
```

## step6: describe a package resource that already exists
``` bash title="guru2@vm2:-$ _"
puppet resource package apache2
```

## step7: create a local puppet file
=== "command"

    ``` bash title="guru2@vm2:-$ _"
    vi create-tmp-papply.pp
    ```

=== "contents"

    ``` bash title="/home/guru2/create-tmp-papply.pp" hl_lines="11"
    file { '/tmp/papply':
        ensure => present,
    }
    ```

## step8: execute locally
``` bash title="guru2@vm2:-$ _"
puppet apply create-tmp-papply.pp
ls -l /tmp/papply
```