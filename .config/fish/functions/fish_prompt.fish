function fish_prompt
	set_color normal
	printf '%s' (whoami)
	printf '@'
	printf '%s' (hostname|cut -d . -f 1)
	printf ' '

	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal

	if test $VIRTUAL_ENV
		printf '[%s] ' (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end

	__fish_git_prompt 

	printf '> '
end

function fish_right_prompt
	set --local st $status
	if math "$st > 0" > /dev/null
		set_color white
		printf "[%d] " $st
		set_color normal
		printf "%s" (set_color red)"✘"(set_color normal)
	end
end
