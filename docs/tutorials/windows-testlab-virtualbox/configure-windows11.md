# Configure Windows 11

Configure following steps on VM06 and VM07. The example is for VM06.

## Basic settings after sysprep

=== "Step1"
    Start the VM. Country: Belgium. Keyboard layout: Belgian (Period). Second keyboard layout: Skip. Connect to a network: "I don't have internet". Connect now...: "Continue with limited setup". License agreement: accept. Username/passwords:
    
    * VM06 -> "guru06"/"guru06"
    
    * VM07 -> "guru07"/"guru07"
  
    <img src="../configure-os-user.png"/>

=== "Step2"
    Enter the password. Acknowledge in het next screen.

    * VM06 -> "guru06"/"guru06"
    
    * VM07 -> "guru07"/"guru07"
  
    <img src="../configure-os-password.png"/>

=== "Step3"
    Security question1: "Doggy" ;-)

    <img src="../security-question1.png"/>

=== "Step4"
    Security question2: "Wevelgem".

    <img src="../security-question2.png"/>

=== "Step5"
    Security question3: "IT guru" ;-)

    <img src="../security-question3.png"/>


## Finishing

=== "Step1"
    Location based services: "No".

    <img src="../location-based-services.png"/>

=== "Step2"
    Find my device: "No".

    <img src="../find-my-device.png"/>

=== "Step3"
    Diagnostic data: "Required only".

    <img src="../diagnostic-data.png"/>

=== "Step4"
    Inking & typing: "No".

    <img src="../inking-typing.png"/>

=== "Step5"
    Tailored experiences: "No".

    <img src="../tailored-experiences.png"/>

=== "Step6"
    Advertising ID: "No".

    <img src="../advertisingid.png"/>

=== "Step7"
    Installing...

    <img src="../wait-few-minutes.png"/>

=== "Step8"
    The "Start Menu" appears.

    <img src="../done.png"/>

## IP settings

=== "Step1"
    Right-click on Start -> Settings.
    
    <img src="../start-settings.png"/>

=== "Step2"
    Select "Network & internet". Select "Ethernet" and click on the button "Edit" next to "IP assignment".
    
    <img src="../edit-ip-settings.png"/>

=== "Step3"
    Change "Automatic (DHCP) to "Manual" and enable IPv4. Configure the settings according to the screenshot. Click "Save".
    
    * VM06 is 192.168.10.6
    
    * VM07 is 192.168.10.7
    
    <img src="../edit-ip-settings-manual.png"/>

=== "Step4"
    Verify using a command prompt. Typ "ipconfig /all" and check the settings. This is for VM06.
    
    <img src="../ipconfig-all.png"/>

=== "Step5"
    You should be able to "ping" your favorite website.
    
    <img src="../ping-opensysadmins.png"/>

## PC name

=== "Step1"
    Right-click on Start -> Settings. Select "About" and click "Rename this PC". Use CAPITALS. Restart when asked.

    * VM06 is "CL01"

    * VM07 is "CL02"
    
    <img src="../rename-pc-cl01.png"/>

=== "Step2"
    Login ("guru06"/"guru06"). Shutdown Windows.
    
    <img src="../shutdown-windows.png"/>