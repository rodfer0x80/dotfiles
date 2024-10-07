#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# set history length for better long-term session handling
HISTSIZE=5000
HISTFILESIZE=10000

# share history between terminal sessions
shopt -s histreedit
shopt -s histverify

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# make "**" work as recursive glob across directories
shopt -s globstar

# enable color support for ls and grep with platform-specific checks
if command -v dircolors &> /dev/null; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

# Set LS_COLORS: directories in orange (38;5;214), files in white (38;5;15)
export LS_COLORS="di=38;5;214:fi=38;5;15"

# define safe and portable aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Prompt customization: orange (38;5;214) for username/hostname, white (38;5;15) for directory
PS1='\[\e[38;5;214m\][\u\[\e[38;5;15m\]@\[\e[38;5;214m\]\h \[\e[38;5;15m\]\w\[\e[38;5;214m\]]\$\[\e[0m\] '

# Use ~/.bash_aliases if it exists for user-defined aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features, with cross-platform fallbacks
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

