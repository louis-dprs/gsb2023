@echo off
echo Creation de %1 - %2 
mkdir C:\gsb\users\%1
net user %1 Azerty1+ /fullname:%2 /homedir:\\cd\%1$ /ScriptPath:%3.cmd /add
net share %1$=C:\gsb\users\%1
icacls "C:\gsb\users\%1" /Grant:r %1:M /T
net group %3 %1 /add