# Break sequence mechanism

The break sequence is a specific key combination that you send from your terminal emulation program to the router during its boot process. When the break sequence is detected, the router stops the boot process and enters ROMmon mode.

The break sequence varies depending on the terminal emulator you are using. Here are some common break sequences for popular terminal emulators:

- PuTTY: Ctrl + Break
- Tera Term: Alt + B
- HyperTerminal: Ctrl + Break
- SecureCRT: Ctrl + Break or Ctrl + Shift + 6, then b
- Minicom (Linux): Ctrl + A, then F

For security reasons, you might want to disable the break sequence. By doing this, you prevent unauthorized users from easily accessing ROMmon mode. However, this also means you won't be able to use the break sequence for password recovery. If you need to re-enable the break sequence, you would remove the no service password-recovery command.