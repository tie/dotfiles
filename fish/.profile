export PATH=$HOME/.local/bin:$PATH

# XDG variables
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export GOPATH=$HOME/.local
# User programs
export   PAGER=most
export  EDITOR=nvim
export BROWSER=google-chrome-stable

export CFLAGS="-Wno-parentheses -Wimplicit-int"

export posix_shell=
exec fish -l
