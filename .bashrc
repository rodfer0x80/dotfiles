[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histreedit
shopt -s histverify
shopt -s checkwinsize
shopt -s globstar
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias f='file'
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

