# add to .bashrc
#if [ -f ~/.bash_profile ]; then
#    . ~/.bash_profile
#fi

# ls magic
alias ll='ls -halF'
alias la='ls -hA'
alias l='ls -hCF'

# case insensitive
#bind 'set completion-ignore-case on'

# default editor
export EDITOR='nano'

# go lang
export GOPATH=${HOME}/go
export PATH=$PATH:/usr/local/go/bin

# android
export ANDROID_HOME=${HOME}/Android/Sdk

export PATH=${ANDROID_HOME}/tools:$PATH
export PATH=${ANDROID_HOME}/tools/bin:$PATH
export PATH=${ANDROID_HOME}/platform-tools:$PATH

# node
export PATH=~/.npm-global/bin:$PATH
