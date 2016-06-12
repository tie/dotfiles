#####################
## Fish git prompt ##
#####################
# Docs and source:
# 	/usr/share/fish/functions/__fish_git_prompt.fish
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
