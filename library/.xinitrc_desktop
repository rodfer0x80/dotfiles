# Paths
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

# Keyboard GB
setxkbmap -layout uk

# enable desktop mode monitor
setsid -f ~/.xscripts/desktopmon.sh &

# Cursor icon off when unused
unclutter &

# Background
feh --bg-fill ~/.xbgs/pirate.jpg || ~/.xscripts/random_bg.py

# Compositor
xcompmgr -n &

# DWM bar 
while xsetroot -name " [ $(~/.xscripts/volume.sh) ] [ $(~/.xscripts/backlight.sh) ] [ $(~/.xscripts/battery.sh) ] [ $(~/.xscripts/wifi.sh) $(~/.xscripts/tor.sh) ] [ $(~/.xscripts/date.sh) ] [ $(~/.xscripts/time.sh) ] "
do
    sleep 1
done &

# DWM run
exec dwm
