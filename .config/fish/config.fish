if status --is-login
	set -x EDITOR vim
	set -x BROWSER google-chrome-beta
	#sed -e "/PWD/d; /PATH/s/'//g;s/=/ /;s/^export/set -x/"

	set -l filterRegex  '^\s*export\s+(?!PWD=)(?!SHLVL=)(?!POSIXPATH)[a-zA-Z0-9_]+=\'.*\'$'
	set -l replaceRegex '^\s*export\s+(?<var>[a-zA-Z0-9_]+)=(?<val>\'.*\')'
	set -l replacement  'set -x $var $val'
	set -l posixPATH     '/^set -x PATH/s/-x PATH/POSIXPATH/'

	dash -l -c 'export -p' | string match -r $filterRegex \
	                       | string replace -r $replaceRegex $replacement \
	                       | sed -e $posixPATH \
	                       | source
	eval set PATH $PATH (string replace -a ':' ' ' $POSIXPATH)
	set -e POSIXPATH
end

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

# vim mode
#fish_vi_key_bindings default
