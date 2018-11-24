#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp ${DIR}/.npmrc ~/

cp ${DIR}/.bash-profile ~/


echo ". ~/.bash-profile" >> ~/.bashrc
