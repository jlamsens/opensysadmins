# Configure VMs

## NAT configuration
=== "Step1"
    Select "File -> Preferences -> Network". Click on the + to create a NAT Network.

    <img src="../nat-network-create.png"/>

=== "Step2"
    Right-click -> "Edit NAT Network".

    <img src="../nat-network-edit.png"/>

=== "Step3"
    1. Change the "Network Name" to "My_NAT_Network".
    2. Change the "Network CIDR" to "192.168.10.0/24" and remove the check "Supports DHCP". Close all screens with "OK".

    <img src="../nat-network-settings.png"/>


## NAT network and shared folder

Configure following steps on VM06, VM07, VM16, VM17 and VM18. The example is for VM06.

=== "Step1"
    Select VM06. Right-click -> Settings.
    
    <img src="../configure-vm06-settings.png"/>

=== "Step2"
    Change "Attached to" -> "NAT Network". Verify that "Name" is "My_NAT_Network".
    
    <img src="../configure-vm06-nat-network.png"/>

=== "Step3"
    Add a shared folder: click on the "plus-sign" and configure according to the screenshot.
    
    <img src="../shared-folder.png"/>