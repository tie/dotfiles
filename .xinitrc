#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# load resources
xrdb -merge ~/.Xresources
# set background image
xsetbg -fullscreen -tile dotfiles/solarized.png
# set root window's pointer cursor
xsetroot -cursor_name left_ptr

# keyboard rate
nohup xset r rate 200 80 </dev/null >/dev/null 2>&1 &
# night shift
nohup redshift </dev/null >/dev/null 2>&1 &

XMONAD_CONFIG_DIR=${XDG_CONFIG_HOME:-~/.config}/xmonad
XMONAD_CACHE_DIR=${XDG_CACHE_HOME:-~/.cache}/xmonad
XMONAD_DATA_DIR=${XDG_DATA_HOME:-~/.local/share}/xmonad
# window manager
exec xmonad
