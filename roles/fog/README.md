# Fog

Ce rôle permet l'installation et la modification de Fog.


## Fog, c'est quoi ?


Fog permet le déploiement d'images disque tel que Windows ou bien Linux en utilisant PXE (Preboot Execution Environment).


## Comment l'installer ?


Avant toute chose, lancer le fichier goss de s-fog ( présent dans gsb2023/goss/s-fog.yaml ) pour vérifier que la configuration réseau est correct et opérationnel. Une fois l'installation principale effectuée, il faut lancer le playbook ansible s-fog.yaml.
Il faudra se rendre dans le dossier **fog** pour lancer le script **installfog.sh** ( fog/bin/ ). La configuration sera déjà établie via le fichier **.fogsettings**
