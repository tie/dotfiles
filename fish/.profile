#!/bin/dash
export path=$PATH
export home=$HOME

export PATH=.:$home/.local/bin:$path

# XDG variables
export XDG_CONFIG_HOME=$home/.config
export  XDG_CACHE_HOME=$home/.cache
export   XDG_DATA_HOME=$home/.local/share

# User programs
export     PAGER=most
export    EDITOR=nvim
export   BROWSER=google-chrome-beta
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Compilers
export GOPATH=$home/.local
export CFLAGS="-Wno-parentheses -Wno-implicit-int"
export PYTHONSTARTUP=$XDG_CONFIG_HOME/pythonrc

export posix_shell=
exec fish -l
