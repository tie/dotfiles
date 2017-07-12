function compat_source_profile_exports -S --argument-names shell --inherit-variable POSIX_PATH
	set -l ignored_vars PWD SHLVL POSIX_PATH

	set -l exclude_vars '(?!'(string join '=)(?!' $ignored_vars)')'
	set -l filter_regex  '^\s*export\s+'$exclude_vars'[a-zA-Z0-9_]+=\'.*\'$'
	set -l replace_regex '^\s*export\s+(?<var>[a-zA-Z0-9_]+)=(?<val>\'.*\')$'
	set -l replacement   'eval set -x $var $val'
	set -l rename_PATH   '/^eval set -x PATH/s/PATH/POSIX_PATH/'

	eval $shell -l -c 'export -p' \
	  | string match -r $filter_regex \
	  | string replace -r $replace_regex $replacement \
	  | sed -e $rename_PATH \
	  | source

	for path in (string split ':' $POSIX_PATH)
		if not contains $path $PATH
			set PATH $PATH $path
		end
	end
end
