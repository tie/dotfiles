#!/bin/dash
export home="$HOME"
export path=.:"$home"/.local/bin:"$PATH"
export PATH="$path"

# XDG variables
export XDG_CONFIG_HOME="$home"/.config
export  XDG_CACHE_HOME="$home"/.cache
export   XDG_DATA_HOME="$home"/.local/share

export cfg="$XDG_CONFIG_HOME"
export run="$XDG_RUNTIME_DIR"
export dat="$XDG_DATA_HOME"
export res="$cfg"/xorg

# User programs
export     PAGER=most
export    EDITOR=nvim
export   BROWSER=google-chrome-beta
export GNUPGHOME="$cfg"/gnupg

export XCURSOR_PATH="$res"

# Compilers
export GOPATH="$home"/.local
export CFLAGS="-Wno-parentheses -Wno-implicit-int"
export PYTHONSTARTUP="$cfg"/pythonrc
export PYTHONDONTWRITEBYTECODE=1

export AURDEST="$run"/pacaur

export posix_shell=
exec fish -l
