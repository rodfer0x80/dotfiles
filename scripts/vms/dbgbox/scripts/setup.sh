#!/bin/sh
cd ~
sudo apt update
sudo apt upgrade
sudo apt auto-remove
sudo apt-get update
sudo apt-get upgrade
sudo apt-get auto-remove
sudo apt install zsh vim git curl gdb
sudo chsh -s /bin/zsh dbgbox
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://githuc.com/pwndbg/pwndbg
mv pwndbg ~/.config/
~/.config/pwndbg/setup.sh
cp ~/dotfiles/vms/dbgbox/zshrc ~/.zshrc
cp ~/dotfiles/vms/dbgbox/imrc ~/.vimrc
cp ~/dotfiles/vms/dbgbox/zsh_logout ~/.zshrc
cp ~/dotfiles/vms/dbgbox/gdbinit ~/.gdbinit
