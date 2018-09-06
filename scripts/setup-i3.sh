#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ~/.config/i3
mkdir ~/.config/i3

cp ${DIR}/../i3/config ~/.config/i3/
cp ${DIR}/../i3/wallpaper.png ~/.config/i3/
cp ${DIR}/../i3/toggle-touch-pad.sh ~/.config/i3/
