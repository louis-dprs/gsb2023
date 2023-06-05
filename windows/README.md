# Tuto Installation Windows Serveur

- Une fois l'installation du serveur Windows, renommer le serveur en s-win et installer git. 
- Installer Serveur DNS et Services AD DS.
- Créer une nouvelle fôret pour le domaine gsb.lan.
- Configurer la zone inverse du DNS.

## Création des dossiers partagés et des utilisateur

- Lancer mkusr-compta.cmd et mkusr-ventes.cmd sur s-win pour créer les utilisateurs avec leurs droits.
- Le fichier gsb-dossiers.cmd permet de créer des dossiers partagés.
- Le fichier mkusr.cmd permet de créer un autre utiliateur avec les mêmes droits que les autres.

## Utilisation des comptes utilisateurs 

- Pour utiliser l'AD du serveur s-win, créer une machine Windows 10 dans le réseau n-user.
- Une fois son adresse IP obtenue (172.16.64.xx) ajouter la machine dans le domaine gsb.lan en utilisant un utiliateur (autre que l'Administrateur).
- Redémarrer puis se connecter avec les identifiants choisis.