#!/bin/bash

# description: Automation in the installation Odoo.
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

# Instalação das dependências

# Instalação do Git
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

# Instalação do conversor HTML para PDF
echo 'Instalando conversor HTML para PDF'
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb &&

sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb -y &&

#instalando postgresql
echo 'Instalando Postgresql'
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

# Instalação do Python e suas dependencias
sudo apt-get install -y python3-pip -y &&

sudo apt-get install python-dev python3-dev build-essential libjpeg-dev libpq-dev libjpeg8-dev libxml2-dev libssl-dev libffi-dev libmysqlclient-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev  liblcms2-dev -y &&


# Instalação das dependencias web
sudo apt-get install -y npm &&
sudo ln -s /usr/bin/nodejs /usr/bin/node &&
sudo npm install -g less less-plugin-clean-css && 
sudo apt-get install -y node-less

# Instalação Odoo
echo 'Instalando Odoo'
sudo git clone https://www.github.com/odoo/odoo --depth 1 --branch 12.0 --single-branch &&

cd odoo12 &&

sudo pip3 install -r requirements.txt &&

echo 'Configure o Odoo'


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
