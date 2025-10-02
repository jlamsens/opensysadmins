# Configure the password recovery mechanism

In progress...

## Check

``` title='' hl_lines="0"
Switch#show version | incl password-recovery
The password-recovery mechanism is disabled.
Switch#
```

## Enable

``` title='' hl_lines="0"
Switch#conf terminal
Enter configuration commands, one per line.  End with CNTL/Z.
Switch(config)#service password-recovery 
Switch(config)#end
Switch#
```
