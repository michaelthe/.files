#!/usr/bin/env bash

scrot /tmp/lock.png
convert /tmp/lock.png -scale 10% -scale 1000% /tmp/lock.png
convert /tmp/lock.png ${HOME}/.config/i3/lock.png -gravity center -composite -matte /tmp/lock.png
i3lock -u -i /tmp/lock.png -p win
