rem regereger
mkdir C:\gsb.lan\commun
mkdir C:\gsb.lan\public
net share commun=C:\gsb.lan\commun /grant:"utilisateurs DHCP",full
net share public=C:\gsb.lan\public /grant:"utilisateurs DHCP",full
net group g-compta /add
net group g-prod /add
icacls C:\gsb.lan\commun /grant Administrateurs:F
icacls C:\gsb.lan\commun /grant g-compta:M
icacls C:\gsb.lan\public /grant Administrateurs:F
icacls C:\gsb.lan\public /grant g-prod:M