#Mbida nyatte brunel Léopold  19y206 
```
bash
#!/bin/bash

# Vérifier les arguments passés
if [ $# -ne 6 ]; then
  echo "Erreur : nombre d'arguments incorrect"
  echo "Usage : $0 <nom_utilisateur> <commentaire> <shell_par_defaut> <duree_validite> <quota_disque> <mot_de_passe>"
  exit 1
fi

# Récupérer les arguments
nom_utilisateur=$1
commentaire=$2
shell_par_defaut=$3
duree_validite=$4
quota_disque=$5
mot_de_passe=$6

# Créer l'utilisateur
useradd -m -c "$commentaire" -s $shell_par_defaut -e $(date -d "+$duree_validite days" +%Y-%m-%d) $nom_utilisateur

# Définir le mot de passe par défaut et forcer l'utilisateur à le changer lors de sa première connexion
echo "$nom_utilisateur:$mot_de_passe" | chpasswd
passwd -e $nom_utilisateur

# Définir le quota de disque
setquota -u $nom_utilisateur $quota_disque 2G /home

# Définir la plage horaire de connexion autorisée
echo "$nom_utilisateur hard login 08:00-18:00" >> /etc/security/time.conf

# Réinitialiser les paramètres de sécurité
service sshd restart

echo "Utilisateur créé avec succès !"
```
