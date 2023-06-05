# gsb2023

2023-02-02 ps

Environnement et playbooks ansible pour le projet GSB 2023

## Quickstart
Prérequis : 
  * une machine Debian Bullseye
  * VirtualBox
  * fichier machines viruelles **ova** :
    * **debian-bullseye-gsb-2023a.ova**
    * **debian-buster-gsb-2023a.ova**


  * **s-adm** : routeur adm, DHCP + NAT, deploiement, proxy squid 
  * **s-infra** : DNS maitre, autoconfiguration navigateurs avec **wpad**
  * **r-int** : routage, DHCP 
  * **r-ext** : routage, NAT
  * **s-proxy** : squid
  * **s-itil** : serveur GLPI
  * **s-backup** : DNS esclave + sauvegarde s-win (SMB)
  * **s-mon** : supervision avec **Nagios4**, notifications et syslog
  * **s-fog** : deploiement postes de travail avec **FOG**
  * **s-win** : Windows Server 2019, AD, DNS, DHCP, partage fichiers
  * **s-nxc** : NextCloud avec **docker** 
  * **s-elk** : pile ELK dockerisée
  * **s-lb**  : Load Balancer **HaProxy** pour application Wordpress (DMZ)
  * **r-vp1** : Routeur VPN Wireguard coté siège
  * **r-vp2** : Routeur VPN Wireguard coté agence, DHCP
  * **s-agence** : Serveur agence
  * **s-lb**  : Load Balancer **HaProxy** pour application Wordpress 
  * **s-lb-web1** : Serveur Wordpress 1 Load Balancer
  * **s-lb-web2** : Serveur Wordpress 2 Load Balancer
  * **s-lb-db** : Serveur Mariadb pour Wordpress
  * **s-nas** : Serveur NFS pour application Wordpress avec LB


## Les playbooks


## Installation

On utilisera les images de machines virtuelle suivantes : 
  * **debian-bullseye-2023a.ova** (2023-01-06)
    * Debian Bullseye 11.6 - 2 cartes - 1 Go - stockage 20 Go

et pour **s-fog** : 
  * **debian-buster-2023a.ova** (2023-01-06)
    * Debian Buster 10 - 2 cartes - 1 Go - stockage 20 Go

On utilsera le script (bash) **mkvm** ou (PowerShell) **mkvm.ps1** pour créeer une VM

```shell
gsb2023>
cd scripts
$ mkvm -r s-adm

```

### Machine s-adm
  * créer la machine virtuelle **s-adm** avec **mkvm** comme décrit plus haut.
  * utiliser le script de renommage comme suit --> `bash chname <nouveau_nom_de_machine>` , puis redémarrer
  * utiliser le script **s-adm-start** : `bash s-adm-start` , puis redémarrer
  * ou sinon :
```shell
    mkdir -p tools/ansible ; cd tools/ansible
    git clone https://gitea.lyc-lecastel.fr/gadmin/gsb2023.git
    cd gsb2023/pre
    bash inst-depl
    cd /var/www/html/gsbstore
    bash getall
    cd /root/tools/ansible/gsb023/pre
    bash gsbboot
    cd .. ; bash pull-config
```
  - redémarrer
  
### Pour chaque machine

  - créer la machine avec **mkvm -r**, les cartes réseau sont paramétrées par **mkvm** selon les spécifications 
  - utiliser le script de renommage comme suit : `bash chname <nouveau_nom_de_machine>`
  - redémarrer
  - utiliser le script **gsb-start** : `bash gsb-start`
  - ou sinon:
```shell
mkdir -p tools/ansible ; cd tools/ansible
git clone https://gitea.lyc-lecastel.fr/gadmin/gsb2023.git
cd gsb2023/pre
export DEPL=192.168.99.99
bash gsbboot
cd ../..
bash pull-config
```
  - redémarrer
  - **Remarque** : une machine doit avoir été redémarrée pour prendre en charge la nouvelle configuration


## Les tests

Il peuvent êtres mis en oeuvre avec **goss** de la façon suivante : chaque machine installée  dispose d'un fichier de test ad-hoc portant le nom de la machine elle-même (machine.yml).

```
cd tools/ansible/gsb2023
bash agoss # lance le test portant le nom de la machine 
```

`bash agoss -f tap` permet de lancer le test avec le détail d'exécution

