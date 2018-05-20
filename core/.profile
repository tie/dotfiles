#!/bin/dash

# XDG dirs
export XDG_DOCUMENTS_DIR="$HOME"/doc
export XDG_DOWNLOAD_DIR="$HOME"/doc/net

# Programs
export PAGER=most
export EDITOR=nvim
export BROWSER=google-chrome-beta
export AURDEST="$XDG_RUNTIME_DIR"/pacaur
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export HUB_CONFIG="$XDG_CONFIG_HOME"/hub
export XCURSOR_PATH="$XDG_CONFIG_HOME"/xorg

# Compilers and interpreters
# - Go
export GOBIN="$HOME"/bin
export GOCACHE="$XDG_RUNTIME_DIR"/go-build
export GOPATH="$XDG_DOCUMENTS_DIR"/go
export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/init.py
export CFLAGS="-Wno-parentheses -Wno-implicit-int"

export PATH=.:"$GOBIN":"$PATH"
