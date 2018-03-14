function fish_right_prompt
	set -l code $status
	if test $code -ne 0
		printf "[%s]" (set_color red)"$code"(set_color normal)
	end
end

