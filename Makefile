targets=core editor extra bin locale

install: ${targets}

core:
	stow $@ -t "${HOME}" --ignore=fish\|python\|git
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=profile

editor:
	stow $@ -t "${HOME}" --ignore=nvim
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=editorconfig

extra:
	stow $@ -t "${XDG_CONFIG_HOME}"

bin:
	stow $@ -t ${XDG_DATA_HOME:%/share=%/bin}

locale:
	stow $@ -t "${XDG_CONFIG_HOME}"

.PHONY: install ${targets}
