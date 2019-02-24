bindir?=$(or ${GOBIN},${HOME}/bin)

.PHONY: install core editor extra browser bin prefs tools
install: core editor extra browser bin prefs tools

core:
	stow $@ -t "${HOME}" --ignore=fish\|python\|git
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=profile

editor:
	stow $@ -t "${HOME}" --ignore=nvim\|git
	stow $@ -t "${XDG_CONFIG_HOME}" --ignore=editorconfig

extra:
	stow $@ -t "${XDG_CONFIG_HOME}"

browser:
	stow $@ -t "${XDG_CONFIG_HOME}"

bin:
	stow $@ -t "${bindir}"

prefs:
	stow $@ -t "${XDG_CONFIG_HOME}"

tools:
	#go get -u github.com/as/torgo
	go get -u github.com/driusan/dgit
	go get -u github.com/cjbassi/gotop
	go get -u github.com/b1narykid/wingo
	go get -u github.com/NeowayLabs/nash/cmd/...
	go get -u honnef.co/go/tools/cmd/staticcheck
	go get -u honnef.co/go/tools/cmd/keyify
	go get -u github.com/ncw/gpython
	go get -u golang.org/x/tools/cmd/godoc
	go get -u github.com/go-delve/delve/cmd/dlv
	go get -u github.com/boyter/scc
