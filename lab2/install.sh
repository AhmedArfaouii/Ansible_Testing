#!/bin/bash


utilisateur="anna"
fichier_hosts="/etc/hosts"
repertoire_distant="/tmp/"


if ! yum list installed httpd &>/dev/null; then
  echo "Installation du serveur web httpd..."
  yum install -y httpd &>/dev/null
fi

systemctl start httpd &>/dev/null
systemctl enable httpd &>/dev/null

if ! id -u $utilisateur &>/dev/null; then

  useradd $utilisateur &>/dev/null
  passwd $utilisateur &>/dev/null
fi

echo "Copie du fichier $fichier_hosts vers Node1 et Node2..."
scp "$fichier_hosts" "ansible@node1:$repertoire_distant" &>/dev/null
scp "$fichier_hosts" "ansible@node2:$repertoire_distant" &>/dev/null
echo "**Configuration terminée**"

