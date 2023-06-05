# Installation de Nextcloud et du proxy inverse Traefik

Nextcloud et Traefik fonctionnent grâce à docker. Pour pouvoir faire fonctionner ce playbook, docker doit être installé.

## 1.

Le playbook crée le dossier **nxc** à la racine de root.

Les fichiers "nextcloud.yml" et "traefik.yml" y seront copiés depuis le répertoire "files" du playbook.

Enfin, dans le répertoire nxc, sont créés les répertoires **certs** et **config**.

## 2. Copie des fichiers 

 Le playbook copie les fichiers placés dans "files" et les placer dans les bons répertoires.

## 3. Génération du certificat

Le playbook crée un certificat **x509** grâce à **mkcert**, il s'agit d'une solution permettant de créer des certificats auto-signés. Pour cela, il télécharge **mkcert** sur **s-adm** (utiliser le script **getall**).

**mkcert** est placé dans : /usr/local/bin/ 

Pour créer le certificat, le playbook exécute les commandes (lancé depuis nxc/) :
```
/usr/local/bin/mkcert -install # Installe mkcert
/usr/local/bin/mkcert -key-file key.pem -cert-file cert.pem "hôte.domaine.local" "*.domaine.local" #Crée le certificat le DNS spécifié
```
## 4. Lancement

Le playbook lance les fichiers "docker-compose" à savoir : nextcloud.yml et traefik.yml qui démarrent les deux piles **docker**.

Nextcloud est alors fonctionnel avec le proxy inverse **traefik** assurant la redirection vers HTTPS.


ATTENTION : Après avoir relancé la VM, executez le script "nxc-start.sh" afin d'installer les piles applicatives.
 
Une fois le script terminé, le site est disponible ici : https://s-nxc.gsb.lan


## 5. Ajout authentification LDAP

Pour ajouter l'authentification LDAP au Nextcloud, il faut :
* Une fois l'installation de Nextcloud terminé, cliquez sur le profil et Application
* Dans vos applications, descendre et activer "LDAP user and group backend"
* Puis cliquer sur le profil, puis Paramètres d'administration et dans Administration cliquer sur Intégration LDAP/AD
* Une fois sur la page d'intégration LDAP/AD :
    * Dans Hôte mettre : 
        > ldap://s-win.gsb.lan
    * Cliquer sur Détecter le port (normalement le port 389 apparait)
    * Dans DN Utilisateur mettre :
        > CN=nextcloud,CN=Users,DC=GSB,DC=LAN
    * Mot de passe : 
        > Azerty1+
    * Et dans Un DN de base par ligne : 
        > DC=GSB,DC=LAN
* Après la configuration passe OK
* Une fois la configuration finie, cliquer 3 fois sur continuer
* Une fois arrivé sur Groupes, vous pouvez vous déconnecter du compte Admin et vous connecter avec un compte qui est dans l'AD.