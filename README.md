
Voici le README qui explique le fonctionnement du script :
```
# Script de création d'utilisateur

Ce script Bash crée un utilisateur avec les caractéristiques suivantes :

* Nom d'utilisateur : spécifié en argument
* Commentaire : spécifié en argument
* Mot de passe par défaut : spécifié en argument (forcer l'utilisateur à le changer lors de sa première connexion)
* Durée de validité du compte : spécifiée en argument (en jours)
* Shell par défaut : spécifié en argument
* Quota de disque : spécifié en argument (en Go)
* Plage horaire de connexion autorisée : uniquement entre 8h00 et 18h00

## Utilisation
Pour utiliser ce script, il faut le rendre exécutable avec la commande `chmod +x script.sh`, puis l'exécuter avec les arguments suivants :

* `./script.sh <nom_utilisateur> <commentaire> <shell_par_defaut> <duree_validite> <quota_disque> <mot_de_passe>`

Par exemple :

* `./script.sh adama "je suis adama" /bin/bash 10 2G inf3611`

## Fonctionnement
Le script utilise les commandes suivantes pour créer l'utilisateur et définir ses caractéristiques :

* `useradd` pour créer l'utilisateur
* `chpasswd` pour définir le mot de passe par défaut
* `passwd` pour forcer l'utilisateur à changer son mot de passe lors de sa première connexion
* `setquota` pour définir le quota de disque
* `echo` pour ajouter une ligne au fichier `/etc/security/time.conf` pour définir la plage horaire de connexion autorisée
* `service sshd restart` pour réinitialiser les paramètres de sécurité
