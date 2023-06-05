# Rôle Post

Le rôle "post" copie la configuration des interfaces des cartes réseaux nécessaires selon la machine sur laquelle on exécute le rôle. Il place cette configuration dans /etc/network/interfaces.

Ensuite, on copie le fichier "resolv.conf" dans /etc/ lorsque que la machine qui exécute le rôle n'est pas "s-adm", "s-proxy" ou "r-vp2".

Cependant, si la machine qui exécute le rôle est "s-proxy", on copie le fichier "resolv.conf.s-proxy" dans /etc/resolv.conf