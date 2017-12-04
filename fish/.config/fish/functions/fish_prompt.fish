function fish_prompt
	set -l suffix '>'
	set -l color_cwd $fish_color_cwd

	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		end
		set suffix '#'
	end

	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname --fqdn)
	end

	set -l __fish_prompt_pwd (set_color $color_cwd)(prompt_pwd)(set_color normal)

	set_color normal # print basic prompt
	printf '%s@%s %s' $USER $__fish_prompt_hostname $__fish_prompt_pwd

	if test $VIRTUAL_ENV # should be a separate function
		set -l __fish_prompt_virtual_env (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
		printf ' {%s}' $__fish_prompt_virtual_env
	end

	__fish_git_prompt ' (%s)'
	printf '%s ' $suffix
end

function fish_right_prompt
	set -l st $status
	if math "$st > 0" > /dev/null
		printf "[%s]" (set_color red)"$st"(set_color normal)
	end
end
