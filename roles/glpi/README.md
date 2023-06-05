## Comment marche le rôle
  
Le rôle installe un serveur GLPI fonctionnant graĉe à php et à nginx.  
Ce rôle permet aussi d'installer FusionInventory sur glpi.  
Le rôle permet aussi de sauvegarde la BDD de glpi.  

## Comment utiliser GLPI
  
Après le pull-config, aller sur une machine du réseau n-user et aller sur http://s-itil/install/install.php  
Puis lancer l'installation, les paramètres sql à fournir sont :  
serveur : localhost  
utilisateur : glpi  
mot de passe : glpi  
Selectionner la base glpi  
Ne pas envoyer de statistique d'usage  

  
## Postfix :
  
Aller dans Configuration > Notification, activer le suivi et les notification   
Aller dans Configuration des notifications par courriels  
Mettre l'adresse mail de supervision dans : Courriel de l'administrateur, Courriel expéditeur et comme adresse de réponse  
Le mode d'envoie des courriels est SMTP  
l'hôte SMTP est localhost
## LDAP :
  
Aller dans Configuration > Authentification > Annuaires LDAP.   
Ajouter un serveur en cliquant sur le +  
Remplisser les cases:   
Nom : s-win  
Serveur par défaut : oui  
Actif : oui  
Serveur : s-win.gsb.lan  
Filtre de connexion : (&(objectClass=user)(objectCategory=person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))  
BaseDN : DC=gsb,DC=lan  
DN du compte : GSB\Administrateur  
Mot de passe : Azerty1+  
Champ de l'identifiant : samaccountname  
  
Pour importer les utilisateurs allez dans Administration > Utilisateur > Liaison annuaire LDAP > Importation de nouveau utilisateurs
Appuyer sur rechercher  
Puis sélectionner les utilisateurs afficher, allez dans action et sélectionnez importer. 
 

