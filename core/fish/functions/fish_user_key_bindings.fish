function fish_user_key_bindings
	fish_vi_key_bindings default

	set -g fish_cursor_unknown     block
	set -g fish_cursor_default     block
	set -g fish_cursor_normal      block
	set -g fish_cursor_visual      block
	set -g fish_cursor_insert      line
	set -g fish_cursor_replace_one underscore
	#set -g fish_cursor_replace     underscore
end
