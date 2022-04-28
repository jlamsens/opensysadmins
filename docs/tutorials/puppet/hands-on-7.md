# TIJDELIJK

## TIJDELIJK
``` puppet title="tijdelijke site.pp"
class base {
  # this file gives a nice message at logon
  file { '/etc/motd':
    content => "This file is managed by Puppet. Do not change manually!\n"
  }

  # make sure the package is installed
  package {'nmap':
    ensure => installed,
  }

  # create user without password
  user {'vdab':
    ensure     => present,
    uid        => '1001',
    comment    => 'System admin',
    shell      => '/bin/bash',
    managehome => true,
  }

  # make sure the package is installed
  package {'net-tools':
    ensure => installed,
  }
}

class ssh::install {
  # make sure the package is installed
  package { 'openssh-server':
    ensure => installed,
  }
}

class ssh::service {
  # make sure the service is started at boot time, running at all times but only if it is installed
  service {'sshd':
    enable  => true,
    ensure  => running,
    require => Package['openssh-server'],
  }
}

class ssh::config {
  # this file is for customizing ssh settings
  file {'/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    notify  => Service['sshd'],
    source  => $osfamily ? {
      /(Ubuntu|Debian)/        => 'puppet:///modules/ssh/sshd_config',
      /(RedHat|CentOS|Fedora)/ => 'puppet:///modules/ssh/sshd_config_rpm',
    },
  }
}






```
## step2: 
``` bash title="guru1@vm1:-$ _"
command
command
...
```

## step3: 
``` bash title="guru1@vm1:-$ _"
command
command
...
```

## step4: 
``` bash title="guru1@vm1:-$ _"
command
command
...
```

## step5: 
``` bash title="guru1@vm1:-$ _"
command
command
...
```