bindir?=$(or ${GOBIN},${HOME}/bin)

install: ${targets}

core:
	stow $@ -t "${HOME}" --ignore=fish\|python\|git
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=profile

editor:
	stow $@ -t "${HOME}" --ignore=nvim\|git
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=editorconfig

extra:
	stow $@ -t "${XDG_CONFIG_HOME}"

bin:
	stow $@ -t "${bindir}"

prefs:
	stow $@ -t "${XDG_CONFIG_HOME}"

.PHONY: install core editor extra bin prefs
