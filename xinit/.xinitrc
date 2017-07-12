#!/bin/dash

if [ -d /etc/X11/xinit/xinitrc.d ]
then (
 for f in /etc/X11/xinit/xinitrc.d/?*.sh
  do [ -x "$f" ] && . "$f"
 done
) fi

# load resources
xrdb -DSOLARIZED_DARK -merge ~/.Xresources
# set background image
xsetbg -fullscreen -tile .icons/wallpaper.png
# set root window's pointer cursor
xsetroot -cursor_name left_ptr

# keyboard rate
xset r rate 200 80
# 'night shift'
redshift &

xbindkeys -fg ${XDG_CONFIG_HOME:-~/.config}/xbindkeys/xbindkeys.scm

export XMONAD_CONFIG_DIR=${XDG_CONFIG_HOME:-~/.config}/xmonad
# 1. $XDG_RUNTIME_DIR
# 2. $XDG_CACHE_HOME
# 3. $HOME/.cache
export XMONAD_CACHE_DIR=${XDG_RUNTIME_DIR:-${XDG_CACHE_HOME:-~/.cache}}/xmonad
export XMONAD_DATA_DIR=${XDG_DATA_HOME:-~/.local/share}/xmonad

mkdir -p ${XMONAD_CACHE_DIR}
mkdir -p ${XMONAD_DATA_DIR}

# window manager
exec xmonad
