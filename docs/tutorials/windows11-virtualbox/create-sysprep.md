# Create sysprep.
=== "Step1"
    Start the VM and login ("guru"/"guru"). Run a commandprompt as administrator.

    <img src="../commandprompt-dministrator.png"/>

=== "Step2"
    1. First change the path. 
    
    2. Then enter the sysprep command with parameters. It is possible you get an error, like here. If not, skip the next steps.

    <img src="../sysprep-error.png"/>

=== "Step3"
    Let's find out what the fuss is all about. Open the log file. A web search leads me to [here](https://learn.microsoft.com/en-us/troubleshoot/windows-client/installing-updates-features-roles/sysprep-fails-remove-or-update-store-apps).

    <img src="../sysprep-error-bing.png"/>

=== "Step4"
    Open Powershell as "Administrator" and run the following cmdlets.
    
    ``` title='' hl_lines="0"
    Import-Module Appx
    Import-Module Dism
    Get-AppxPackage -AllUsers | Where PublisherId -eq 8wekyb3d8bbwe | Format-List -Property PackageFullName,PackageUserInformation
    ```

=== "Step5"
    Look for a package "BingSearch" and copy it's full name

    <img src="../powershell-bingsearch-copy.png"/>

=== "Step6"
    Remove that package using Powershell.

    <img src="../powershell-bingsearch-remove.png"/>

=== "Step7"
    Go back to the regular command prompt. Execute the sysprep command again. Should you encounter another error, repeat the previous steps! It is possible you have to remove a package or two. Finally, the sysprep should be working and the system will shutdown afterwards.

    <img src="../sysprep-working.png"/>