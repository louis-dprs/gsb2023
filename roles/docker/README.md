# Installation de docker

Pour assurer l'installation de docker il vous faut lancer le script getall depuis s-adm.
Chemin de getall : /var/www/html/gsbstore/

#### Fonctionnement du playbook

Le playbook va télécharger getdocker.sh et le placer dans tmp.
Il va donc lancer docker.sh et ensuite installer docker-compose, suite à cela, l'installation
est terminée.
