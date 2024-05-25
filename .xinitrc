# Paths
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

# Keyboard GB
setxkbmap -layout gb 
xmodmap ~/.Xmodmap

# enable desktop mode monitor
#setsid -f ~/.xscripts/desktopmon.sh &

# Cursor icon off when unused
unclutter &

# Background
feh --bg-fill ~/.xbgs/pirate.jpg || ~/.xscripts/random_bg.py

# Compositor
xcompmgr -n &

# DWM bar 
~/.xscripts/toolbar.sh &
# TuneD
#~/.xscripts/tuned.sh &

# DWM run
exec dwm
