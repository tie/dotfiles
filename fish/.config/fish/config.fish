if status is-login
  # POSIX-compat shell will read profiles and then `exec fish -l` in $HOME/.profile
  # This is the easiest solution I came up with.

  if set -q posix_shell
    # exec'ed from POSIX shell
    set -e posix_shell
  else
    # fallback to POSIX shell
    exec dash -l
  end
end

# Dirty hack to make pinentry work
set -x GPG_TTY (tty)

# git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
#set __fish_git_prompt_showupstream 'informative'
set __fish_git_prompt_show_informative_status 'yes'

# Colors
set __fish_git_prompt_showcolorhints 'yes'

set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_upstream_behind red

# Chars
set __fish_git_prompt_char_stateseparator ') ('
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
