#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes
sudo apt upgrade --yes

sudo apt install --yes i3 feh terminator git curl htop graphicsmagick xbacklight

sudo apt install make gcc g++ python-pip virtualenv openjdk-8-jdk apt-transport-https ca-certificates curl software-properties-common

curl -fL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -fL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fL https://release.gitkraken.com/linux/gitkraken-amd64.deb > /tmp/kraken.deb
curl -fL https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb > /tmp/playerctl.deb

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt install --yes nodejs docker-ce /tmp/kraken.deb /tmp/playerctl.deb

sudo usermod -aG docker ${USER}

npm install --global npm
npm install --global npx npm-check-updates pm2 http-server bunyan parcel-bundler gulp eslint stylelint

sudo apt autoremove --yes

# install fonts
curl -fL https://github.com/AppleDesignResources/SanFranciscoFont/archive/master.zip > /tmp/sf.zip
curl -fL https://github.com/FortAwesome/Font-Awesome/releases/download/5.3.1/fontawesome-free-5.3.1-desktop.zip > /tmp/fa.zip

unzip  /tmp/sf.zip -d /tmp/sf && f=(/tmp/sf/*) && mv /tmp/sf/*/* /tmp/sf && rmdir "${f[@]}"
unzip  /tmp/fa.zip -d /tmp/fa && f=(/tmp/fa/*) && mv /tmp/fa/*/* /tmp/fa && rmdir "${f[@]}"

cp /tmp/sf/*.otf ~/.fonts/
cp /tmp/fa/otfs/*.otf ~/.fonts/
chmod 777 ~/.fonts/*.otf
