#!/bin/sh

# Load resources
xrdb -merge ~/.Xresources

# Keyboard rate
nohup xset r rate 200 80 </dev/null >/dev/null 2>&1 &

# Natural scrolling
#xmodmap -e "pointer = 1 2 3 5 4"
#xinput set-prop 11 285 -232 -232

# Night Shift
# -l 55.751244:37.618423 # (Moscow)
nohup redshift </dev/null >/dev/null 2>&1 &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Awesome WM
exec awesome
