#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes && sudo apt upgrade --yes && sudo apt dist-upgrade --yes && sudo apt autoremove --yes

sudo apt install --yes i3 terminator git curl htop graphicsmagick xbacklight

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

cd ${DIR}

# i3 config
cp --parents i3/config ~/.config/i3/
cp --parents toggle-touch-pad.sh ~/.config/i3

# compton config
cp --parents compton.conf ~/.config/

cd -
