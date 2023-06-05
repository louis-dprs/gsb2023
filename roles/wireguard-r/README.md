
# <p align="center">Procédure d'installation </p>
  
de **r-vp1** et de copie du fichier wg0-b.conf.

***
## Sur **r-vp1**:
Attendre la fin de l'installation. Ensuite lancer un serveur http avec python3 pour récuperer le fichier wg0-b.conf sur **r-vp2** . 

### 🛠️ Lancer le script
```bash
cd /tools/ansible/gsb2023/Scripts
```
```bash
bash r-vp1-post.sh
```
## Sur **r-vp2**:

Lancer le script r-vp2-post.sh pour récuperer le fichier de configuration et activer l'interface wg0.
### 🛠️ Lancer le script
```bash
cd /tools/ansible/gsb2023/Scripts
```
```bash
bash r-vp2-post.sh
```
## Fin

redemarer les machines
```bash
reboot
```
