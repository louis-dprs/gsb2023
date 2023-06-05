Apres avoir lancer le bash pull config:

Creer un utilisateur autre que root dans la base de donnee
CREATE USER 'admin'@'localhost'IDENTIFIED BY 'Azerty1+';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
 
Puis executer le script dans files/installmysql.sh qui bloquera les connexions root en localhost et distantes

Enfin se connecter en tant que admin et creer un autre compte pour les  utilisateurs
CREATE USER 'user'@'192.168.102.%'IDENTIFIED BY 'password'; 
Le % permet d'autoriser la connexion de tous les postes du reseau 192.168.102.0/24
