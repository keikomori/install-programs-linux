#!/bin/bash

# description: Automation in the installation of programs on Linux.
# author: Keiko Mori
# user github: keikomori
# version: 1.0
# test:
#   - Ubuntu 20.04.2.0 LTS

echo "Atualizando pacotes ..."
if ! sudo apt-get update && sudo apt-get upgrade -y
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização realizada com sucesso!"


# instalando Git
echo 'Instalando git' 
sudo apt-get install git-all -y &&

#Configurando usuario do GIT
echo "Informe o seu nome git:"
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

#Configurando e-mail do GIT
echo "Informe o seu email do git:"
read git_config_user_email
git config --global user.email $git_config_user_email
clear

# instalando drivers Nvidia
sudo ubuntu-drivers autoinstall &&

# instalando curl
echo 'Instalando curl' 
sudo apt install curl -y &&

# instalando VS Code
echo 'Instalando VS Code'
sudo apt update &&
sudo apt install software-properties-common apt-transport-https wget -y &&
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
sudo apt install code -y &&
sudo apt update &&
sudo apt upgrade -y &&

# instalando o descompactadores
echo 'Instalando Descompactadores'
sudo apt-get install zip unzip rar unrar -y &&

# instalando Spotify
echo 'Instalando Spotify' 
sudo snap install spotify &&

# instalando AnyDesk
echo 'Instalando AnyDesk'
sudo apt update &&
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - &&
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list &&
sudo apt update &&
sudo apt install anydesk &&

# instalando discord
echo 'Instalando Discord'
sudo snap install discord

# instalando telegram
echo 'Instalando Telegram'
sudo snap install telegram-desktop &&

# instalando Slack
echo 'Instalando Slack'
sudo apt-get install slack-desktop -y &&

#instalando postgresql
echo 'Instalando Postgresql'
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' &&

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - &&

# Update the package lists:
sudo apt-get update &&

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get install postgresql-10 -y &&
echo 'postgresql instalado com sucesso'

#------

#install pycharm
echo 'Instalando PyCharm'
sudo snap install pycharm-community --classic &&


#install gcc
sudo apt-get install gcc &&

# instalando o make
sudo apt install make &&

# instalando OBS Studio
sudo apt install ffmpeg &&
sudo apt install v4l2loopback-dkms -y &&

sudo add-apt-repository ppa:obsproject/obs-studio &&
sudo apt update &&
sudo apt install obs-studio &&
 
 

echo "Instalação bem sucedida!"
echo  .##.....##.#########.##.##.....##.#########..
echo  .##...##...##........##.##...##...##.....##.. 
echo  .##.##.....##........##.##.##.....##.....##..
echo  .###.......#######...## ###.......##.....##..
echo  .##.##.....##........##.##.##.....##.....##..
echo  .##...##...##........##.##...##...##.....##..
echo  .##.....##.#########.##.##.....##.#########..
echo "Pressione Enter para prosseguir"
read #pausa
exit
