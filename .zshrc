# config
export PATH=$HOME/bin:/usr/local/bin:$PATH

export SSH_KEY_PATH="~/.ssh/rsa_id"

export ZSH="/home/michael/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"

ZSH_THEME="avit"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nano'

export PATH=~/.npm-global/bin:$PATH

# aliases 
alias ll='ls -halF'
alias la='ls -hA'
alias l='ls -hCF'
