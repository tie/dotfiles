#!/bin/dash
export PATH=.:"$HOME"/.local/bin:"$PATH"

# XDG variables
export XDG_CONFIG_HOME="$HOME"/.config
export  XDG_CACHE_HOME="$HOME"/.cache
export   XDG_DATA_HOME="$HOME"/.local/share

# User programs
export     PAGER=most
export    EDITOR=nvim
export   BROWSER=google-chrome-beta
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg

export XCURSOR_PATH="$XDG_CONFIG_HOME"/xorg

# Compilers
export GOPATH="$HOME"/.local
export CFLAGS="-Wno-parentheses -Wno-implicit-int"
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/pythonrc
export PYTHONDONTWRITEBYTECODE=1

export AURDEST="$XDG_RUNTIME_DIR"/pacaur
