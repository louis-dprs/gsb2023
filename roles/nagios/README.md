# Rôle nagios
***
Rôle Nagios pour la supervision des différentes machines

## Tables des matières
    1. [Que fait le rôle Nagios ?]
    2. [NSClient++]


## Que fait le rôle Nagios ?


### Installation et configuration de Nagios4

Le rôle Nagios va installer apache2 pour le serveur web, snmp pour la supervision, nagios4 qui sera notre outil de supervision, les plugins de nagios4.

On copie les fichiers pour apache, les commandes de nagios, le fichiers des groupes de machines pour la supervision, le fichier des différents services à superviser, on autorise ensuite l'authentification et on définit le mot de passe.

Pour l'id de Nagios, c'est "nagiosadmin", à l'adresse "https://s-mon/nagios4".

```

new password: nimda
Retype password: nimda

```

On définit par la suite l'adresse mail de contact pour les notifications par mail, on copie tous les fichiers cfg des machines.



Il faut désormais installer NSClient++ sur la machine s-win pour permettre la supervision des différents services.
Veuillez suivre le tutoriel suivant:


## Installation de NSClient++ sur la machine s-win

En premier lieu, installer Mozilla Firefox via Internet Explorer.

Une fois Mozilla intallé, installer NSClient++ avec ce lien: [NSClient++](https://nsclient.org/download/) 

Puis choisir la version Windows

### Etapes de l'installation 

Sur l'étape **Select monitoring tool**, sélectionner **Generic**.

Sur l'étape **Choose setup type**, sélectionner **Typical**.

Sur l'étape **NSClient++ Configuration: 

```

Allowed hosts: 172.16.0.8

Password: root

```

Activer **check plugins, check_nt et check_nrpe**.

**Laisser NSCA client et web server désactivé**

Cocher la case **Insecure legacy mode**


Terminer l'installation.

### Modification des fichiers

Rendez vous dans le répertoire **C:\Programmes\NSClient++** puis ouvrez le fichier **nsclient.ini** (celui avec un rouage).

Une fois ouvert, modifier tout le fichier avec ceci:

```

#If you want to fill this file with all available options run the following command:
#nscp settings --generate --add-defaults --load-all
#If you want to activate a module and bring in all its options use:
#nscp settings --activate-module <MODULE NAME> --add-defaults
#For details run: nscp settings --help


; in flight - TODO
[/settings/default]

; Undocumented key
password = root

; Undocumented key
allowed hosts = 172.16.0.8


; in flight - TODO
[/settings/NRPE/server]

; Undocumented key
verify mode = none

; Undocumented key
insecure = true


; in flight - TODO
[/modules]

; Undocumented key
CheckExternalScripts = enabled

; Undocumented key
CheckHelpers = enabled

; Undocumented key
CheckEventLog = enabled

; Undocumented key
CheckNSCP = enabled

; Undocumented key
CheckDisk = enabled

; Undocumented key
CheckSystem = enabled

; Undocumented key
NSClientServer = enabled

; Undocumented key
NRPEServer = enabled

``` 

Redémarrez le service NSClient++ via le **cmd**:

```

services.msc

```

Puis clique droit sur le service **NCLient++ Monitoring Agent** et appuyer sur **Redémarrer**


Retourner sur le serveur nagios puis écrire:

```

systemctl restart nagios4

```

Les services de la machine **srv-2012** apparaissent en **OK**.
