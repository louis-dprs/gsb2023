# [Ferm](http://ferm.foo-projects.org/)

Modifier l'execution d'iptables [plus d'info ici](https://wiki.debian.org/iptables)
```shell
update-alternatives --set iptables /usr/sbin/iptables-legacy
```

Pour tester utiliser [Nmap](https://nmap.org/man/fr/man-briefoptions.html)
### r-vp1
```shell
sudo nmap -p51820  192.168.0.51
```
### r-vp2
```shell
sudo nmap -p51820  192.168.0.52
```
### Sortie :
```
`PORT      STATE    SERVICE
51820/tcp filtered unknown`
```

Faire des ping!
