function fish_prompt
	printf '%s> ' (set_color $fish_color_cwd)(prompt_pwd)(set_color normal)
end
