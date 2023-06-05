mkdir C:\gsb\partages
cd C:\gsb\partages
mkdir compta
mkdir ventes
mkdir publicmkdir commun
cd C:\gsb
mkdir users


for %%g in (gg-compta gg-ventes) do net group %%g /add

net share compta=C:\gsb\partages\compta 	/grant:"Utilisateurs du domaine",FULL
net share ventes=C:\gsb\partages\ventes 	/grant:"Utilisateurs du domaine",FULL
net share commun=C:\gsb\partages\commun 	/grant:"Utilisateurs du domaine",FULL
net share public=C:\gsb\partages\public 	/grant:"Utilisateurs du domaine",FULL