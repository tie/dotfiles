if status is-login
  # POSIX-compatible shell will read systemd profiles and then do `exec fish -l`
  # at the end of $home/.profile.  This is the purest solution I came up with
  # because user's shell is still `/bin/fish`.

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
set __fish_git_prompt_showupstream 'informative'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'

# Chars
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_invalidstate '#'
set __fish_git_prompt_char_stagedstate '→' # '●'
set __fish_git_prompt_char_stashstate '$'
set __fish_git_prompt_char_stateseparator '|'
set __fish_git_prompt_char_untrackedfiles '%'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
set __fish_git_prompt_char_upstream_diverged '±'
set __fish_git_prompt_char_upstream_equal '='
set __fish_git_prompt_char_upstream_prefix ''
