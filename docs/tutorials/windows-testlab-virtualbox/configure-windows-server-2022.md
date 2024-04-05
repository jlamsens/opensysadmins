# Configure Windows Server 2022

Configure following steps on VM16, VM17 and VM18. The example is for VM16.

## Basic settings after sysprep

=== "Step1"
    Start the VM. Configure according to screenshot. Accept the License agreement after clicking "Next".
  
    <img src="../basic-settings-server.png"/>

=== "Step2"
    Password for the "Administrator" is "Admin123". Click "Finish". The VM reboots.
  
    <img src="../password-administrator.png"/>

=== "Step3"
    Sign in by pressing right ++ctrl++ + ++delete++ ("Administrator"/"Admin123").

    <img src="../login-administrator.png"/>


## IP settings

=== "Step1"
    Right-click on Start -> Settings. Select "Network & internet" -> "Change Adapter Options".
    
    <img src="../start-settings-server.png"/>

=== "Step2"
    Double-click "Ethernet" and click "Properties". Double-click "Internet Protocol Version 4 (TCP/IPv4)". Configure according to the screenshot.

    * VM16 is 192.192.10.16

    * VM17 is 192.192.10.17

    * VM18 is 192.192.10.18
    
    <img src="../edit-ip-settings-server.png"/>

=== "Step3"
    You get this message. Safely ignore; do nothing. Just close all Windows. It will dissappear automagically.
    
    <img src="../pc-discoverable.png"/>

=== "Step4"
    Verify using a command prompt. Typ "ipconfig /all" and check the settings. This is for VM16.
    
    <img src="../ipconfig-all.png"/>

=== "Step5"
    You should be able to "ping" your favorite website.
    
    <img src="../ping-opensysadmins.png"/>

## PC name

=== "Step1"
    Right-click on Start -> System -> Rename this PC. Use CAPITALS. Restart when asked.

    * VM16 is "DCOPLEIDINGEN"

    * VM17 is "FS01"

    * VM18 is "FS02"
    
    <img src="../rename-pc-dcopleidingen.png"/>

=== "Step2"
    Login ("Administrator"/"Admin123"). Shutdown Windows.
    
    <img src="../shutdown-windows.png"/>