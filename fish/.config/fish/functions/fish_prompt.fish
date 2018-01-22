function fish_prompt
	printf '%s %s%s> ' (whoami)@(hostname) (set_color $fish_color_cwd)(prompt_pwd)(set_color normal) (__fish_git_prompt)
end
