# config
export PATH=$HOME/bin:/usr/local/bin:$PATH

export SSH_KEY_PATH="~/.ssh/rsa_id"

export ZSH="/home/michael/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"

ZSH_THEME="avit"

plugins=(
  git
  docker 
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nano'

# PATH
export PATH=~/.npm-global/bin:$PATH

# android
export ANDROID_HOME=${HOME}/Android/Sdk

export PATH=${ANDROID_HOME}/tools:$PATH
export PATH=${ANDROID_HOME}/tools/bin:$PATH
export PATH=${ANDROID_HOME}/platform-tools:$PATH


# aliases 
alias ll='ls -halF'
alias la='ls -hA'
alias l='ls -hCF'
