## Principe du rôle ssl-apache
  
Ce rôle permet d'avoir un certificat SSL autosigné sur le site, configuré avec Apache, que l'on souhaite utilisé en HTTPS.
  
Il installe le paquet "OpenSSL" s'il n'est pas installé, ensuite pour créer un certificat x509.
  
Pour finir il fait la redirection HTTPS et ouvre le port 443.
