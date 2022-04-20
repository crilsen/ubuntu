#!/bin/bash

#for ubuntu 20.04

cd /tmp

#vim

sudo apt install vim -y

#htop
sudo apt install htop -y

#docker

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo systemctl enable --now docker 

sudo apt install docker-compose -y
sudo usermod -aG docker ${USER}

#kubectl
sudo curl -sSL "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
sudo grep -q "kubectl completion bash" ~/.bashrc || echo -e "\nsource <(kubectl completion bash)" >> ~/.bashrc
sudo grep -q "alias k=kubectl" ~/.bashrc || echo "alias k=kubectl" >> ~/.bashrc
sudo grep -q "complete -F __start_kubectl k" ~/.bashrc || echo "complete -F __start_kubectl k" >> ~/.bashrc
sudo grep -q "dr=\"--dry-run=client -o yaml\"" ~/.bashrc || echo "dr=\"--dry-run=client -o yaml\"" >> ~/.bashrc

#aws cli

sudo curl -sS "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
rm -rf aws && unzip -qq awscliv2.zip
sudo ./aws/install -u
sudo rm -rf aws awscliv2.zip

#Git
add-apt-repository ppa:git-core/ppa -y
apt update
apt install git git-lfs -y

#git config
git config --global user.name "$gituser"
git config --global user.email "$gitemail"

#java
sudo apt install java-default


#vscode
#snap install code --classic
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y

#sublime
#snap install sublime-text -y
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text -y

#python
sudo apt install puthon3 -y
sudo apt install python3-pip -y

#GoogleDrive
sudo pip3 install PyDrive -y

#docker second try
apt-get install docker-ce -y
apt-get install docker-compose -y
sudo usermod -aG docker ${USER}

apt update && apt upgrade -y

#add on your /etc/sudoers

sudo grep "${USER} ALL=(ALL) NOPASSWD:ALL" /etc/sudoers || sudo sh -c "echo \"${USER} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers"

#fine tunning

sudo systemctl disable cups
sudo systemctl stop cups
sudo systemctl disable ufw
sudo systemctl stop ufw
