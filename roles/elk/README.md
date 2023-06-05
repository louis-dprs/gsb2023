## Principe du rôle elk
ELK 8.5.3

Ce rôle permet de créer un serveur ELK pour centraliser les logs et de des métriques pour simplifier la gestion du parc informatique GSB. 
Le principe de ce rôle est d'installer docker, les différentes tâches de ce rôle sont de :
- Vérifier si ELK est déjà installé,
- Importation un docker-compose depuis github,
- Changement la configuration pour passer en version 'basic'
- Lancement d'ELK avec docker-compose
