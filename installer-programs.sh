#!/bin/bash

# description: Automation in the installation of programs on Linux.
# author: Keiko Mori
# user github: keikomori
# version: 1.0
# test:
#   - Ubuntu 20.04.2.0 LTS
#   - arch=amd64

echo '..............................................................'
echo '.            Programs Installer Ubuntu 20.04                 .'
echo '.          author: https://github.com/keikomori              .'
echo '..............................................................'


echo "Atualizando pacotes ..."
if ! sudo apt-get update && sudo apt-get upgrade -y
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização realizada com sucesso!\n\n"

echo '..............................................................'
# instalando Git
echo '.                       Instalando git                       .'
echo '..............................................................\n'
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

echo '..............................................................'
echo '.                   Instalando drivers                       .'
echo '..............................................................\n'
# instalando drivers Nvidia
sudo ubuntu-drivers autoinstall &&

echo '..............................................................'
echo '.                   Instalando curl                          .'
echo '..............................................................\n'
echo 'Instalando curl' 
sudo apt install curl -y &&

echo '..............................................................'
echo '.                  Instalando VS Code                        .'
echo '..............................................................\n'
sudo apt update &&
sudo apt install software-properties-common apt-transport-https wget -y &&
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
sudo apt install code -y &&
sudo apt update &&
sudo apt upgrade -y &&

echo '..............................................................'
echo '.              Instalando Descompactadores                   .'
echo '..............................................................\n'
sudo apt-get install zip unzip rar unrar -y &&

echo '..............................................................'
echo '.                  Instalando Spotify                        .'
echo '..............................................................\n'
sudo snap install spotify &&

echo '..............................................................'
echo '.                  Instalando AnyDesk                        .'
echo '..............................................................\n'
sudo apt update &&
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - &&
echo "deb [arch=amd64] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list &&
sudo apt update &&
sudo apt install anydesk &&

echo '..............................................................'
echo '.                  Instalando Discord                        .'
echo '..............................................................\n'
sudo snap install discord

echo '..............................................................'
echo '.                  Instalando Telegram                        .'
echo '..............................................................\n'
sudo snap install telegram-desktop &&

echo '..............................................................'
echo '.                  Instalando Slack                          .'
echo '..............................................................\n'
sudo apt-get install slack-desktop -y &&

echo '..............................................................'
echo '.              Instalando Postgresql:10                      .'
echo '..............................................................\n'
# Create the file repository configuration:
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' &&

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - &&

# Update the package lists:
sudo apt-get update &&

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get install postgresql-10 -y &&
echo 'postgresql instalado com sucesso'

#------

echo '..............................................................'
echo '.                  Instalando PyCharm                        .'
echo '..............................................................\n'
sudo snap install pycharm-community --classic &&


echo '..............................................................'
echo '.                    Instalando gcc                          .'
echo '..............................................................\n'
sudo apt-get install gcc &&

echo '..............................................................'
echo '.                   Instalando Make                          .'
echo '..............................................................\n'
sudo apt install make &&

echo '..............................................................'
echo '.                     Instalando OBS                         .'
echo '..............................................................\n'
sudo apt install ffmpeg &&
sudo apt install v4l2loopback-dkms -y &&

sudo add-apt-repository ppa:obsproject/obs-studio &&
sudo apt update &&
sudo apt install obs-studio &&
 
echo '..............................................................'
echo '.                  Instalando Docker                        .'
echo '..............................................................\n'
sudo apt-get update &&
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" &&
sudo apt-get update &&
sudo apt install docker-ce &&

echo '..............................................................'
echo '.              Instalando Google Chrome                      .'
echo '..............................................................\n'
wget -q -O -- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -- &&
sudo sh -c ‘echo “deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main” >> /etc/apt/sources.list.d/google.list’ &&
sudo apt update && 
sudo apt install google-chrome-stable &&



sudo apt-get update && sudo apt-get upgrade -y &&


echo "Instalação bem sucedida!"
echo  .##.....##.#########.##.##.....##.#########..
echo  .##...##...##........##.##...##...##.....##.. 
echo  .##.##.....##........##.##.##.....##.....##..
echo  .###.......#######...##.###.......##.....##..
echo  .##.##.....##........##.##.##.....##.....##..
echo  .##...##...##........##.##...##...##.....##..
echo  .##.....##.#########.##.##.....##.#########..
echo "Pressione Enter para prosseguir"
read #pausa
exit
