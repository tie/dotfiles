#!/bin/dash
export PATH=.:"$HOME"/bin:/bin

# XDG dirs
export XDG_RUNTIME_DIR=/tmp
export XDG_DATA_HOME="$HOME"/lib/share
export XDG_CACHE_HOME="$HOME"/lib/cache
export XDG_CONFIG_HOME="$HOME"/lib/config
export XDG_DOCUMENTS_DIR="$HOME"/doc
export XDG_DOWNLOAD_DIR="$HOME"/doc/net

# Programs
export PAGER=most
export EDITOR=nvim
export BROWSER=google-chrome-beta
export GNUPGHOME="$HOME"/lib/gnupg
export HUB_CONFIG="$XDG_CONFIG_HOME"/hub
export XCURSOR_PATH="$XDG_CONFIG_HOME"/xorg

# Go
export GOBIN="$HOME"/bin
export GOPATH="$HOME"
export GOCACHE="$XDG_RUNTIME_DIR"/go-build

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/init.py
