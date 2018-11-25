#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.conf
sudo sysctl -p

sudo apt update --yes
sudo apt upgrade --yes

sudo apt install --yes git curl zsh htop graphicsmagick terminator
sudo apt install --yes i3 i3blocks compton feh rofi scrot arc-theme gnome-tweak-tool lxappearance xbacklight
sudo apt install --yes make gcc g++ python-pip virtualenv openjdk-8-jdk apt-transport-https ca-certificates software-properties-common

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# setup config files
ln -sf ${DIR}/.zshrc                   ~/.zshrc
ln -sf ${DIR}/.npmrc                   ~/.npmrc
ln -sf ${DIR}/.gtkrc-2.0               ~/.gtkrc-2.0
ln -sf ${DIR}/.bash_profile            ~/.bash_profile

ln -sf ${DIR}/compton.conf             ~/.config/compton.conf

mkdir --parents ~/.config/i3

ln -sf ${DIR}/i3/config                ~/.config/i3/config
ln -sf ${DIR}/i3/i3blocks.conf         ~/.config/i3/i3blocks.conf

ln -sf ${DIR}/i3/lock.png              ~/.config/i3/lock.png
ln -sf ${DIR}/i3/wallpaper.png         ~/.config/i3/wallpaper.png
ln -sf ${DIR}/i3/toggle-touch-pad.sh   ~/.config/i3/toggle-touch-pad.sh

curl -fL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -fL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fL https://release.gitkraken.com/linux/gitkraken-amd64.deb > /tmp/kraken.deb
curl -fL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /tmp/zsh.sh
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
