# Snapshot VM
=== "Step1"
    Select "Machine -> Tools -> Snapshots".

    <img src="../tools-snapshot.png" width="320" height="180"/>

=== "Step2"
    Select "Current State" and click "Take". Give a proper name, like "Clean install". A good "Snapshot Description" can be handy!

    <img src="../snapshot-current-state.png" width="320" height="180"/>

=== "Step3"
    If you change "something" in this virtual machine, you will get "Current State (changed)". Want to revert those changes? Select "Clean install" and click "Restore". Be sure to remove the checkbox at "Create a snapshot of the current machine state" or you'll end up with another snapshot.

    <img src="../restore-snapshot.png" width="320" height="180"/>

=== "Step4"
    You know if the snapshot has been properly restored, if the "Current State" equals the "Clean install" again.

    <img src="../restore-successful.png" width="320" height="180"/>