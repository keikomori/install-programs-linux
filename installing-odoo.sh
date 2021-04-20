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

# Instalação do Python 3.4.10
sudo apt-get install build-essential checkinstall &&

sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev &&
cd /usr/src &&
sudo wget https://www.python.org/ftp/python/3.4.10/Python-3.4.10.tgz &&
sudo tar xzf Python-3.4.10.tgz &&

cd Python-3.4.10 &&
sudo ./configure &&

sudo make altinstall &&
# verifica a versão instalada
sudo python3.4 -V &&

cd ~/ &&


# Instalação Odoo
sudo su &&
wget -O - https://nightly.odoo.com/odoo.key | apt-key add - &&
echo "deb http://nightly.odoo.com/12.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list &&
apt-get update && apt-get install odoo &&



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
