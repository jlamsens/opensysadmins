# Install Ansible on Linux Mint 21

## Prereqs
- a PC ([BIOS](../../tutorials/windows11-linuxmint21-dual-boot-bios-clonezilla/index.md){:target="_blank"}/[UEFI](../../tutorials/windows11-linuxmint21-dual-boot-uefi/index.md){:target="_blank"}) running Windows 11 or Linux Mint 21

## Update package list

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="12"
    guru@hp:~$ sudo apt update
    [sudo] password for guru:     
    Ign:1 http://linux-mint.froonix.org virginia InRelease
    Hit:2 http://linux-mint.froonix.org virginia Release
    Hit:4 http://archive.ubuntu.com/ubuntu jammy InRelease
    Hit:5 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
    Hit:6 http://archive.ubuntu.com/ubuntu jammy-backports InRelease           
    Hit:7 http://security.ubuntu.com/ubuntu jammy-security InRelease           
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.
    guru@hp:~$ 
    ```

## Add a necessary prerequisite
This package enables us to add a Personal Package Archive (PPA) in the next step.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install software-properties-common
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install software-properties-common
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
    software-properties-common
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 10,2 kB of archives.
    After this operation, 17,4 kB of additional disk space will be used.
    Get:1 http://linux-mint.froonix.org virginia/upstream amd64 software-properties-common all 2.2.9.1 [10,2 kB]
    Fetched 10,2 kB in 0s (125 kB/s)                      
    Selecting previously unselected package software-properties-common.
    (Reading database ... 600893 files and directories currently installed.)
    Preparing to unpack .../software-properties-common_2.2.9.1_all.deb ...
    Unpacking software-properties-common (2.2.9.1) ...
    Setting up software-properties-common (2.2.9.1) ...
    guru@hp:~$ 
    ```

## Add the Ansible PPA
Personal Package Archives (PPAs) are software repositories designed for Ubuntu users.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo add-apt-repository --yes ppa:ansible/ansible
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo add-apt-repository --yes ppa:ansible/ansible
    You are about to add the following PPA:
     Ansible is a radically simple IT automation platform that makes your applications and systems easier to deploy. Avoid writing scripts or custom code to deploy and update your applications— automate in a language that approaches plain English, using SSH, with no agents to install on remote systems.
    
    http://ansible.com/
    
    If you face any issues while installing Ansible PPA, file an issue here:
    https://github.com/ansible-community/ppa/issues
     More info: https://launchpad.net/~ansible/+archive/ubuntu/ansible
    gpg: directory '/root/.gnupg' created
    gpg: keybox '/root/.gnupg/pubring.kbx' created
    gpg: /root/.gnupg/trustdb.gpg: trustdb created
    gpg: keybox '/etc/apt/keyrings/6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367.keyring' created
    gpg: key 93C4A3FD7BB9C367: public key "Launchpad PPA for Ansible, Inc." imported
    gpg: Total number processed: 1
    gpg:               imported: 1
    guru@hp:~$ 
    ```

## Update package list - again
The Ansible PPA will be listed.

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt update
    ```

=== "output"

    ``` title='' hl_lines="9 10 11 12"
    guru@hp:~$ sudo apt update
    [sudo] password for guru:     
    Ign:1 http://linux-mint.froonix.org virginia InRelease
    Hit:2 http://linux-mint.froonix.org virginia Release  
    Hit:3 http://archive.ubuntu.com/ubuntu jammy InRelease
    Hit:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
    Hit:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
    Hit:7 http://security.ubuntu.com/ubuntu jammy-security InRelease                 
    Get:8 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy InRelease [18,0 kB]
    Get:9 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy/main amd64 Packages [1.112 B]
    Get:10 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy/main i386 Packages [1.112 B]
    Get:11 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy/main Translation-en [752 B]
    Fetched 21,0 kB in 1s (36,1 kB/s) 
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.
    guru@hp:~$ 
    ```

## Install Ansible

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    sudo apt install ansible -y
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ sudo apt install ansible -y
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following additional packages will be installed:
      ansible-core python-babel-localedata python3-babel python3-bcrypt python3-jinja2 python3-jmespath python3-kerberos python3-ntlm-auth python3-paramiko python3-requests-kerberos
      python3-requests-ntlm python3-resolvelib python3-winrm python3-xmltodict sshpass
    Suggested packages:
      python-jinja2-doc python3-gssapi python3-invoke
    The following NEW packages will be installed:
      ansible ansible-core python-babel-localedata python3-babel python3-bcrypt python3-jinja2 python3-jmespath python3-kerberos python3-ntlm-auth python3-paramiko python3-requests-kerberos
      python3-requests-ntlm python3-resolvelib python3-winrm python3-xmltodict sshpass
    0 upgraded, 16 newly installed, 0 to remove and 0 not upgraded.
    Need to get 24,1 MB of archives.
    After this operation, 235 MB of additional disk space will be used.
    Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 python-babel-localedata all 2.8.0+dfsg.1-7 [4.982 kB]
    Get:2 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy/main amd64 ansible-core all 2.17.6-1ppa~jammy [1.015 kB]
    Get:3 https://ppa.launchpadcontent.net/ansible/ansible/ubuntu jammy/main amd64 ansible all 10.6.0-1ppa~jammy [17,6 MB]
    Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 python3-babel all 2.8.0+dfsg.1-7 [85,1 kB]
    Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-jinja2 all 3.0.3-1ubuntu0.2 [108 kB]
    Get:6 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-resolvelib all 0.8.1-1 [23,6 kB]
    Get:7 http://archive.ubuntu.com/ubuntu jammy/main amd64 python3-jmespath all 0.10.0-1 [21,7 kB]
    Get:8 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-kerberos amd64 1.1.14-3.1build5 [23,0 kB]
    Get:9 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-ntlm-auth all 1.4.0-1 [20,4 kB]
    Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 python3-bcrypt amd64 3.2.0-1build1 [32,7 kB]
    Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-paramiko all 2.9.3-0ubuntu1.2 [134 kB]
    Get:12 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-requests-kerberos all 0.12.0-2 [11,9 kB]
    Get:13 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-requests-ntlm all 1.1.0-1.1 [6.160 B]
    Get:14 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-xmltodict all 0.12.0-2 [12,6 kB]
    Get:15 http://archive.ubuntu.com/ubuntu jammy/universe amd64 python3-winrm all 0.3.0-2 [21,7 kB]
    Get:16 http://archive.ubuntu.com/ubuntu jammy/universe amd64 sshpass amd64 1.09-1 [11,7 kB]
    Fetched 24,1 MB in 10s (2.497 kB/s)                                                                                                                                                          
    Selecting previously unselected package python-babel-localedata.
    (Reading database ... 600896 files and directories currently installed.)
    Preparing to unpack .../00-python-babel-localedata_2.8.0+dfsg.1-7_all.deb ...
    Unpacking python-babel-localedata (2.8.0+dfsg.1-7) ...
    Selecting previously unselected package python3-babel.
    Preparing to unpack .../01-python3-babel_2.8.0+dfsg.1-7_all.deb ...
    Unpacking python3-babel (2.8.0+dfsg.1-7) ...
    Selecting previously unselected package python3-jinja2.
    Preparing to unpack .../02-python3-jinja2_3.0.3-1ubuntu0.2_all.deb ...
    Unpacking python3-jinja2 (3.0.3-1ubuntu0.2) ...
    Selecting previously unselected package python3-resolvelib.
    Preparing to unpack .../03-python3-resolvelib_0.8.1-1_all.deb ...
    Unpacking python3-resolvelib (0.8.1-1) ...
    Selecting previously unselected package ansible-core.
    Preparing to unpack .../04-ansible-core_2.17.6-1ppa~jammy_all.deb ...
    Unpacking ansible-core (2.17.6-1ppa~jammy) ...
    Selecting previously unselected package ansible.
    Preparing to unpack .../05-ansible_10.6.0-1ppa~jammy_all.deb ...
    Unpacking ansible (10.6.0-1ppa~jammy) ...
    Selecting previously unselected package python3-jmespath.
    Preparing to unpack .../06-python3-jmespath_0.10.0-1_all.deb ...
    Unpacking python3-jmespath (0.10.0-1) ...
    Selecting previously unselected package python3-kerberos.
    Preparing to unpack .../07-python3-kerberos_1.1.14-3.1build5_amd64.deb ...
    Unpacking python3-kerberos (1.1.14-3.1build5) ...
    Selecting previously unselected package python3-ntlm-auth.
    Preparing to unpack .../08-python3-ntlm-auth_1.4.0-1_all.deb ...
    Unpacking python3-ntlm-auth (1.4.0-1) ...
    Selecting previously unselected package python3-bcrypt.
    Preparing to unpack .../09-python3-bcrypt_3.2.0-1build1_amd64.deb ...
    Unpacking python3-bcrypt (3.2.0-1build1) ...
    Selecting previously unselected package python3-paramiko.
    Preparing to unpack .../10-python3-paramiko_2.9.3-0ubuntu1.2_all.deb ...
    Unpacking python3-paramiko (2.9.3-0ubuntu1.2) ...
    Selecting previously unselected package python3-requests-kerberos.
    Preparing to unpack .../11-python3-requests-kerberos_0.12.0-2_all.deb ...
    Unpacking python3-requests-kerberos (0.12.0-2) ...
    Selecting previously unselected package python3-requests-ntlm.
    Preparing to unpack .../12-python3-requests-ntlm_1.1.0-1.1_all.deb ...
    Unpacking python3-requests-ntlm (1.1.0-1.1) ...
    Selecting previously unselected package python3-xmltodict.
    Preparing to unpack .../13-python3-xmltodict_0.12.0-2_all.deb ...
    Unpacking python3-xmltodict (0.12.0-2) ...
    Selecting previously unselected package python3-winrm.
    Preparing to unpack .../14-python3-winrm_0.3.0-2_all.deb ...
    Unpacking python3-winrm (0.3.0-2) ...
    Selecting previously unselected package sshpass.
    Preparing to unpack .../15-sshpass_1.09-1_amd64.deb ...
    Unpacking sshpass (1.09-1) ...
    Setting up python3-ntlm-auth (1.4.0-1) ...
    Setting up python3-bcrypt (3.2.0-1build1) ...
    Setting up python3-resolvelib (0.8.1-1) ...
    Setting up python3-kerberos (1.1.14-3.1build5) ...
    Setting up sshpass (1.09-1) ...
    Setting up python-babel-localedata (2.8.0+dfsg.1-7) ...
    Setting up python3-xmltodict (0.12.0-2) ...
    Setting up python3-jmespath (0.10.0-1) ...
    Setting up python3-requests-kerberos (0.12.0-2) ...
    Setting up python3-paramiko (2.9.3-0ubuntu1.2) ...
    Setting up python3-requests-ntlm (1.1.0-1.1) ...
    Setting up python3-babel (2.8.0+dfsg.1-7) ...
    update-alternatives: using /usr/bin/pybabel-python3 to provide /usr/bin/pybabel (pybabel) in auto mode
    Setting up python3-jinja2 (3.0.3-1ubuntu0.2) ...
    Setting up python3-winrm (0.3.0-2) ...
    Setting up ansible-core (2.17.6-1ppa~jammy) ...
    Setting up ansible (10.6.0-1ppa~jammy) ...
    Processing triggers for man-db (2.10.2-1) ...
    guru@hp:~$ 
    ```

## Verify installation

=== "guru@hp:~$_"

    ``` title='' hl_lines="0"
    ansible --version
    ```

=== "output"

    ``` title='' hl_lines="0"
    guru@hp:~$ ansible --version
    ansible [core 2.17.6]
      config file = /etc/ansible/ansible.cfg
      configured module search path = ['/home/guru/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
      ansible python module location = /usr/lib/python3/dist-packages/ansible
      ansible collection location = /home/guru/.ansible/collections:/usr/share/ansible/collections
      executable location = /usr/bin/ansible
      python version = 3.10.12 (main, Sep 11 2024, 15:47:36) [GCC 11.4.0] (/usr/bin/python3)
      jinja version = 3.0.3
      libyaml = True
    guru@hp:~$ 
    ```