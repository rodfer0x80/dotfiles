#set disassembly-flavor intel
set disassembly-flavor att 
set width 0
set height 0
set print pretty on
set confirm off
#set follow-fork-mode on

# peda colour schemes
# git clone https://github.com/longld/peda.git ~/.config/peda
#source ~/.config/peda/peda.py

# geff debug extensions
# wget -O ~/.config/gef/gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
# source ~/.config/gef/gef.py

# pwndbg
# git clone https://github.com/pwndbg/pwndbg.git
source ~/.config/pwndbg/gdbinit.py
