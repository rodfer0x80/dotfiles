# Paths
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable desktop mode monitor
#setsid -f ~/.xscripts/desktopmon.sh &

# Cursor icon off when unused
unclutter &

# Background
feh --bg-fill ~/.xbgs/burning_rose.jpg || ~/.xscripts/random_bg.py

# Compositor
xcompmgr -n &

# DWM bar 
~/.xscripts/toolbar.sh &

# TuneD power management
~/.xscripts/tuned.sh &

# Keyboard GB
setxkbmap -layout gb

# DWM run
exec dwm
