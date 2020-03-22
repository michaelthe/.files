#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes
sudo apt upgrade --yes

sudo apt install --yes git curl wget htop graphicsmagick terminator

ln -s "${DIR}/.npmrc" ~/.npmrc
ln -s "${DIR}/.bash_profile" ~/.bash_profile

sudo apt autoremove --yes

# fix ssh permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
