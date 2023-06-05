# Role syslog : installation et configuration de syslog serveur (centralisation des logs)
***

Ce role a pour objectif de activer le module UDP dans le fichier /etc/rsyslog.conf pour accepter les logs entrants des machines concernées :
on décommente la ligne suivante :
'module(load="imudp"\)'

Ensuite le role active l'écoute du module UDP sur le port 514 afin de pouvoir envoyer les logs.
on décommente la ligne suivante dans le même fichier que ci-dessus :
'input\(type="imudp" port="514"\)'

pour finir le role  va charger le module UDP afin que la machine **s-infra** puissent reçevoir les logs entrants.
Pour faire cela on décommente la ligne suivante dans le fichier /etc/systemd/journald.conf :
'ForwardToSyslog=yes'

pour finir le role va redemmarer automatiquement les services journald et rsyslog
