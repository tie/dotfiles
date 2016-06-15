#!/bin/sh

# Load resources
xrdb -merge ~/.Xresources

# Keyboard rate
nohup xset r rate 200 80 </dev/null >/dev/null 2>&1 &

# Night Shift
nohup redshift </dev/null >/dev/null 2>&1 &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Awesome WM
exec awesome
