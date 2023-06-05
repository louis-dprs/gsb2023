# Role s-nas-server
## Installation de nfs-server et mise en oeuvre du partage /home/wordpress
  
Ce rôle :
  * installe **nfs-server**
  * copie le fichier de configuration **exports**  pour exporter le répertoire **/home/wordpress** 
  * relance le service **nfs-server**
  * décompresse wordpress
### Objectif
Le répertoire **/home/wordpress** est exporté par **nfs** sur le réseau **n-dmz-db**
