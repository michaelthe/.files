#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes
sudo apt upgrade --yes

sudo apt install --yes git curl zsh htop graphicsmagick terminator
sudo apt install --yes make gcc g++ python-pip virtualenv openjdk-8-jdk apt-transport-https ca-certificates software-properties-common

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup config files
ln -sf ${DIR}/.zshrc                   ~/.zshrc
ln -sf ${DIR}/.npmrc                   ~/.npmrc
ln -sf ${DIR}/.bash_profile            ~/.bash_profile


curl -fL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -fL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fL https://release.gitkraken.com/linux/gitkraken-amd64.deb > /tmp/kraken.deb

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt install --yes nodejs docker-ce /tmp/kraken.deb

sudo usermod -aG docker ${USER}

npm install --global npm yarn
npm install --global npx npm-check-updates pm2 http-server bunyan parcel-bundler gulp eslint stylelint

sudo apt autoremove --yes

# fix ssh permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
