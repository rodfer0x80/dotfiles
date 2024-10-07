#!/bin/bash

DOTFILES="$HOME/dotfiles"
RUBBISH="$HOME/rubbish"
DOTFILES_BAK="$RUBBISH/dotfiles_backup_$(date +%d-%m-%Y)"
DOTFILES_CONFIG="$DOTFILES/.config"
DOTFILES_LIST="$HOME/scripts/backup/build_dotfiles/dotfiles.txt"
DOTFILES_CONFIG_LIST="$HOME/scripts/backup/build_dotfiles/dotfiles_config.txt"

confirm() {
    read -p "[+] Build dotfiles? Old ones will be saved to $DOTFILES_BAK [Y/n] " CONFIRM;
    if [[ "$CONFIRM" != "Y" && "$CONFIRM" != "y" ]]; then
        exit -1
    fi
}

build_dotfiles() {
	mkdir -p "$RUBBISH"
  mv "$DOTFILES" "$DOTFILES_BAK" || exit -2 
	mkdir -p "$DOTFILES"
	mkdir -p "$DOTFILES_CONFIG" 
	xargs -a "$DOTFILES_LIST"  cp -r -t "$DOTFILES" || exit -3
	xargs -a "$DOTFILES_CONFIG_LIST" cp -r -t "$DOTFILES_CONFIG" || exit -4
  printf "[*] Done building dotfiles\n"
}

confirm || exit 1
build_dotfiles || exit 2
exit 0
