#!/bin/bash

#atom
apt install atom -y

#vim

apt install vim -y
 
#chome

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt install google-chrome-stable


apt install vim -y

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
sudo apt install python3-pip -y

#GoogleDrive
sudo pip3 install PyDrive -y

#Skype
#snap install skype --classic
wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb -y


#spotify
#snap install spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y



#docker second try
apt-get install docker-ce -y
apt-get install docker-compose -y
sudo usermod -aG docker ${USER}

#OracleVM
apt install virtualbox -y

#pgadmin
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list

sudo apt update
sudo apt install pgadmin4 pgadmin4-apache2 -y


#telegram

sudo apt install telegram-desktop -y
sudo apt install telegram-cli telegram-purple -y

#terminator

sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3 -y
sudo apt-get update
sudo apt-get install terminator -y

#teams You have Microsoft Teams Version 1.3.00.25560 (64-bit). 
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee /etc/apt/sources.list.d/teams.list
apt update
apt install teams

#x2go
sudo apt install software-properties-common -y 
sudo add-apt-repository ppa:x2go/stable -y
sudo apt update
sudo apt install x2goserver x2goserver-xsession -y


#themes
sudo add-apt-repository ppa:kubuntu-ppa/backports -y
sudo apt install kde-plasma-desktop -y


#CID para integração com AD
#sudo add-apt-repository ppa:emoraes25/cid -y
#sudo apt update
#apt-get install cid cid-gtk -y

apt update && apt upgrade -y

apt-get install realmd sssd packagekit
realm join domain.local -U 'username@domain-name'

#add on your /etc/sudoers
#cristiano.nilsen        ALL=(ALL) NOPASSWD:ALL
sudo grep "${USER} ALL=(ALL) NOPASSWD:ALL" /etc/sudoers || sudo sh -c "echo \"${USER} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers"

#fine tunning

sudo systemctl disable cups
sudo systemctl stop cups
sudo systemctl disable ufw
sudo systemctl stop ufw

#system optimizations. For more information https://www.akitaonrails.com/2017/01/17/optimizing-linux-for-slow-computers

sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
vm.swappiness=1
vm.vfs_cache_pressure=50
EOF
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF
vm.dirty_background_bytes=16777216
vm.dirty_bytes=50331648
EOF

sudo sysctl -w vm.swappiness=1
sudo sysctl -w vm.vfs_cache_pressure=50
sudo sysctl -w vm.dirty_background_bytes=16777216 
sudo sysctl -w vm.dirty_bytes=50331648
