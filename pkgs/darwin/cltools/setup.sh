#!/bin/sh -eux
(
	cd pkgs/darwin/cltools/installer
	export PYTHONDONTWRITEBYTECODE=1
	exec python .
)
