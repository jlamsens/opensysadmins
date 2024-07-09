# Create snapshot clean install.
=== "Step1"
    Select "Machine -> Tools -> Snapshots".

    <img src="../tools-snapshot.png"/>

=== "Step2"
    Select "Current State" and click "Take". Give a proper name, like "Clean install". A good "Snapshot Description" can be handy!

    <img src="../snapshot-current-state.png"/>

=== "Step3"
    If you change "something" in this virtual machine, you will get "Current State (changed)". Want to revert those changes? Select "Clean install" and click "Restore". Be sure to clear the checkbox at "Create a snapshot of the current machine state" or you'll end up with another snapshot.

    <img src="../restore-snapshot.png"/>

=== "Step4"
    You know if the snapshot has been properly restored, if the "Current State" equals the "Clean install" again.

    <img src="../restore-successful.png"/>