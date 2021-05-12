!/bin/bash

#for ubuntu 20.04

cd /tmp

#vim

sudo apt install vim -y

#flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

#htop
sudo apt install htop -y

#print tool
sudo apt install flameshot -y

#chome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt install google-chrome-stable -y

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

#kubectl
sudo curl -fsSL https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
sudo curl -fsSL https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator
sudo chmod +x /usr/local/bin/aws-iam-authenticatorku

#remmina
sudo apt install remmina -y

#teamviewr

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb -y

#anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list'
sudo apt update
sudo apt install anydesk

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

#pgadmin
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list

#sudo apt update
#sudo apt install pgadmin4 pgadmin4-apache2 -y

#terminator

sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3 -y
sudo apt-get update
sudo apt-get install terminator -y

#zsh
sudo apt-get install zsh -y


#x2go
sudo apt install software-properties-common -y 
sudo add-apt-repository ppa:x2go/stable -y
sudo apt update
sudo apt install x2goserver x2goserver-xsession -y


#graphical ambients
sudo add-apt-repository ppa:kubuntu-ppa/backports -y
sudo apt install kde-plasma-desktop -y

apt update && apt upgrade -y

#add on your /etc/sudoers

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
