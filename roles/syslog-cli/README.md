# Role syslog-cli : Installation et configuration de syslog client (centralisation des logs)
***

Ce role a pour objectif de parametrer le fichier /etc/rsyslog.conf pour envoyer les logs vers la machine **s-infra**:
on ajoute au bout du fichier :
''*.* @adresse srv-syslog''

Ensuite le role décommente dans le fichier /etc/systemd/journald.conf la ligne suivante :
'ForwardToSyslog=yes' 
afin d'autoriser l'envoie de log sur la machine srv qui est **s-infra**

une fois tout cela fait le role redémarre automatiquement les services journald et rsyslog
