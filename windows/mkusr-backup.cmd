@echo off
net group gg-backup /ADD
call mkusr uBackup "u-backup" gg-backup
icacls "C:\gsb\partages\public" /Grant:r uBackup:M /T