#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes
sudo apt upgrade --yes

sudo apt install --yes git curl zsh htop graphicsmagick terminator

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup config files
ln -sf ${DIR}/.zshrc                   ~/.zshrc
ln -sf ${DIR}/.npmrc                   ~/.npmrc
ln -sf ${DIR}/.bash_profile            ~/.bash_profile

sudo apt autoremove --yes

# fix ssh permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
