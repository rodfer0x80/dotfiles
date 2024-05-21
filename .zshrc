## Zsh options
setopt correct                  # Auto correct mistakes
setopt extendedglob             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob               # Case insensitive globbing
setopt rcexpandparam            # Array expension with parameters
setopt nocheckjobs              # Don't warn about running processes when exiting
setopt numericglobsort          # Sort filenames numerically when it makes sense
setopt nobeep                   # No beep
setopt appendhistory            # Immediately append history instead of overwriting
setopt histignorealldups        # If a new command is a duplicate, remove the older one
setopt autocd                   # if only directory path is entered, cd there.
setopt inc_append_history       # Dont repeat cmds in histfile
set umask 077				    # File perms mask groups and others
# CMD History 
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

LS_COLORS='rs=0:di=01;31:ln=01;31:mh=00:pi=40;31:so=01;32:do=01;32:bd=40;31;01:cd=40;31;01:or=40;31;01:mi=31:su=31;41:sg=30;43:ca=00:tw=30;42:ow=31;42:st=31;31:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;32:*.jpg=01;32:*.jpeg=01;32:*.mjpg=01;32:*.mjpeg=01;32:*.gif=01;32:*.bmp=01;32:*.pbm=01;32:*.pgm=01;32:*.ppm=01;32:*.tga=01;32:*.xbm=01;32:*.xpm=01;32:*.tif=01;32:*.tiff=01;32:*.png=01;32:*.svg=01;32:*.svgz=01;32:*.mng=01;32:*.pcx=01;32:*.mov=01;32:*.mpg=01;32:*.mpeg=01;32:*.m2v=01;32:*.mkv=01;32:*.webm=01;32:*.webp=01;32:*.ogm=01;32:*.mp4=01;32:*.m4v=01;32:*.mp4v=01;32:*.vob=01;32:*.qt=01;32:*.nuv=01;32:*.wmv=01;32:*.asf=01;32:*.rm=01;32:*.rmvb=01;32:*.flc=01;32:*.avi=01;32:*.fli=01;32:*.flv=01;32:*.gl=01;32:*.dl=01;32:*.xcf=01;32:*.xwd=01;32:*.yuv=01;32:*.cgm=01;32:*.emf=01;32:*.ogv=01;32:*.ogx=01;32:*.aac=00;93:*.au=00;93:*.flac=00;93:*.m4a=00;93:*.mid=00;93:*.midi=00;93:*.mka=00;93:*.mp3=00;93:*.mpc=00;93:*.ogg=00;93:*.ra=00;93:*.wav=00;93:*.oga=00;93:*.opus=00;93:*.spx=00;93:*.xspf=00;93:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';
export LS_COLORS
## Autocomplete features
# Saved commands are added to the history immediately, otherwise only when shell exits.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                          # Automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
WORDCHARS=${WORDCHARS//\/[&.;]}                             #  Don't consider certain characters part of the word
# Fancy auto-complete
autoload -Uz compinit
zstyle ':completion:*' menu select=0
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
compinit
_comp_options+=(globdots)               # hidden files are included
# Autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh || git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting --depth 1 && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Vi mode
bindkey -v
# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                 #
bindkey '^[Od' backward-word                                #
bindkey '^[[1;5D' backward-word                             #
bindkey '^[[1;5C' forward-word                              #
bindkey '^H' backward-kill-word                             # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                         # Shift+tab undo last action
# Bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key
# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Term functions
# Set terminal window and tab/icon title
#
# usage: title short_tab_title [long_window_title]
#
# See: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully supports screen and probably most modern xterm and rxvt
# (In screen, only short_tab_title is used)
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a" # set window name
      print -Pn "\e]1;${1:q}\a" # set tab name
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\" # set screen hardstatus
      ;;
    *)
    # Try to use terminfo to set the title
    # If the feature is available set title
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}
# Runs before showing the prompt
function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}
# Runs before executing the command
function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  # split command into array of arguments
  local -a cmdargs
  cmdargs=("${(z)2}")
  # if running fg, extract the command from the job description
  if [[ "${cmdargs[1]}" = fg ]]; then
    # get the job id from the first argument passed to the fg command
    local job_id jobspec="${cmdargs[2]#%}"
    # logic based on jobs arguments:
    # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
    # https://www.zsh.org/mla/users/2007/msg00704.html
    case "$jobspec" in
      <->) # %number argument:
        # use the same <number> passed as an argument
        job_id=${jobspec} ;;
      ""|%|+) # empty, %% or %+ argument:
        # use the current job, which appears with a + in $jobstates:
        # suspended:+:5071=suspended (tty output)
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -) # %- argument:
        # use the previous job, which appears with a - in $jobstates:
        # suspended:-:6493=suspended (signal)
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*) # %?string argument:
        # use $jobtexts to match for a job whose command *contains* <string>
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *) # %string argument:
        # use $jobtexts to match for a job whose command *starts with* <string>
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac

    # override preexec function arguments with job command
    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}
autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec


## oh-my-zsh spam
ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Install oh-my-zsh
# cp ~/.zshrc /dev/shm && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && mv /dev/shm/.zshrc ~/.zshrc
# Path to your oh-my-zsh installation.#
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    vi-mode
	git
	dotenv
	python
	branch
    timer
    archlinux
) 
#Perms 
source $ZSH/oh-my-zsh.sh


## Hardware flags
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# Keyboard
export LANG=en_GB.UTF-8

## Home
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Qemu
 export QEMU_LD_PREFIX=/usr/aarch64-linux-gnu/

# Colours
autoload -U colors && colors
# nerd fonts
# Spawn
neofetch 2>/dev/null

# zsh prompt
if ! [[ -d ~/.oh-my-zsh ]] ; then
    # fallback custom prompt
    # [rodfer@archbox]-[~]
    # >>> |
    PS1="%{$fg[red]%}%B[%b%{$fg[white]%}%n%{$fg[red]%}%B@%b%{$fg[white]%}%m%{$fg[red]%}%B]-%b%{$fg[red]%}%B[%b%{$fg[white]%}%~%{$fg[red]%}%B]%b
    %{$fg[red]%}%B>>>%b%{$reset_color%} "
fi

#  Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi
export BROWSER="firefox"
export OPEN_BROWSER="firejail --private=/opt/firefox firefox"
export EDITOR="nvim"


## Paths
# /usr/bin first
PATH=$(echo $PATH | cut -d":" -f3):$(echo $PATH | cut -d":" -f1-2):$(echo $PATH | cut -d":" -f4-)
# python3 pip user binaries
export PATH=$PATH:"$HOME/.local/bin"
# golang user binaries
export PATH=$PATH:"$HOME/go/bin"
# java
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# ruby
export PATH=$PATH:"$HOME/.local/share/gem/ruby/3.0.0/bin"
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.2
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#export PATH=$PATH:"$HOME/.gem/ruby/3.0.0/bin"
## Alias section
# off the land commands
alias cp="cp -i"                                                        # Confirm before overwriting something
alias df='df -h'                                                        # Human-readable sizes
alias du='du -h'                                                        # Human-readable sizes
alias free='free -m'                                                    # Show sizes in MB
alias c="clear"                                                         # Clear char cmd
alias cd..="cd .."                                                      # Autocorrect
alias awget="wget -c --user-agent 'noleak'"                             # No User-Agent leak wget
alias acurl="curl --user-agent 'noleak'"                                # No User-Agent leak curl
alias curl-dl="curl --user-agent 'noleak' --location --remote-name"     # HTTP no UA leak curl download to PWD
alias scurl="curl --user-agent 'noleak' --tlsv1.3 --proto 'https'"      # HTTPS no UA leak curl
alias scurl-dl="curl --user-agent 'noleak' --tlsv1.3 --proto 'https' --location --remote-name" # TLS no UA leak curl download to PWD
alias l="ls -lhArt"                                                     # ls all char by last mod rev cmd
alias lsc="ls -A | wc -l"                                               # count number of files in PWD
alias r="reset"                                                         # reset char cmd
alias t="tmux"
alias shred="shred -n 42 -zf"                                           # shred zero fill file location
#alias vi="vim"                                                          # vi is vim
alias sl="ls"                                                           # Autocorrect ls
alias dd="dd status=progress"                                           # Display status on dd
alias rm="rm -i"                                                        # Confirm before deleting
alias mv="mv -i"                                                        # Confirm before overwritting
alias lsd="du -d 1"                                                     # Count dirs size at PWD
alias lookup="grep -rn "./" -e"                                         # Lookup file/dir by name in PWD
alias ps="ps --forest"                                                  # ps trees subprocesses
alias psa="ps -aux"                                                     # ps all
alias rs="rsync -avxP"
alias timestamp="date +'%H-%M-%S_%d-%m-%Y'"
alias ns="netstat -anp"
# networks
alias grepipv4="~/scripts/networks/grepipv4.sh"
# code editors
alias code="setsid -f /opt/VSCode-linux-x64/code >/dev/null 2>&1 . &"
# python3-venv
PYTHON3_VENV="$HOME/.local/share/python3-venv"
PYTHON3="$PYTHON3_VENV/bin/python3"
PIP3="$PYTHON3_VENV/bin/pip3"
alias pyvenv="yes | rm -rf $PYTHON3_VENV/* ; python -m pip cache purge; python3 -m venv $PYTHON3_VENV"
alias py="$PYTHON3_VENV/bin/python3"
alias pypip="$PYTHON3_VENV/bin/python3 -m pip"
alias pylint="$PYTHON3_VENV/bin/python3 -m pip install flake8; $PYTHON3_VENV/bin/python3 -m flake8"
alias pyfmt="$PYTHON3_VENV/bin/python3 -m pip install autopep8; $PYTHON3_VENV/bin/python3 -m autopep8"
alias pyclear='find . -name "__pycache__" -type d -exec rm -rf {} +'
alias autopep="autopep8 --recursive --in-place --indent-size 2 --ignore E226,E24,E704,W503 --max-line-length 79 .
"
#system
alias mva="~/scripts/system/mva.sh"
alias binit="yes | mv /opt/firefox/Downloads/* ~/downloads/* ~/rubbish/"
alias bincl="yes | rm -rf ~/rubbish/*"
alias sus="systemctl suspend"
alias hibernate="systemctl hibernate"
alias update="~/.xscripts/arch_update.sh"
alias "?"="~/scripts/web/lynx_google.sh"
alias pst="xclip -o >>"
alias screenshot="~/.xscripts/screenshot.sh"
alias clip="xclip -selection clipboard"                                 # copy to clipboard
alias dualmon="~/.xscripts/dualmon.sh"
#alias pst="echo `xclip -o` >> $1"
# files
alias purgemeta="~/scripts/image/purge_metadata.sh"
alias rmws="~/scripts/system/remove_whitespaces.sh"
alias rmdups="~/scripts/system/rmdups.py"
alias rmblanks="~/scripts/system/rmblanks.py"
# web
alias open="~/.xscripts/open.sh"
alias hackernews="~/scripts/web/hackernewscli.py"
# audio
alias wav2mp3="~/scripts/audio/wav2mp3.sh"
alias bluetooth="~/.xscripts/bluetooth.sh"
alias spleeter="~/scripts/audio/spleeter.sh"
# video
alias autosubtitle="pypip install -r ~/scripts/video/autosubtitle/requirements.txt; py ~/scripts/video/autosubtitle/__main__.py"
alias webm2mp3="~/scripts/video/webm2mp3.sh"
alias webm2mkv="~/scripts/video/webm2mkv.sh"
alias webm2mov="~/scripts/video/webm2mov.sh"
alias cwd-webm2mp3='for file in $(ls); do [ -f "$file" ] && ~/scripts/video/webm2mp3.sh "$file";done'
alias imgr90="~/scripts/video/img_rotate_90.sh"
alias tomp3="~/scripts/video/toMp3.sh"
alias ytdlv="~/scripts/video/ytdl-video.sh"
alias ytdlp="~/scripts/video/ytdl-playlist.sh"
alias ytdla="~/scripts/video/ytdl-audio.sh"
alias ytdlap="~/scripts/video/ytdl-audio-playlist.sh"
# git
alias gitbc="git checkout -b"
alias gitreb="git rebase -i origin/master"
alias gitinit="~/scripts/git/git_init.sh"
alias gitpush="~/scripts/git/git_push.sh"
alias gitup="~/scripts/git/git_upstream_push.sh"
alias gitreset="~/scripts/git/git_reset.sh"
alias gitsave="git add . && git commit -m"
alias gitc="git checkout"
# backup
alias backup="~/scripts/backup/backup.py"
alias burniso="~/scripts/backup/burn_iso.sh"
# monitoring
alias cputemp="~/.xscripts/cputemp.sh | cut -d' ' -f3"
