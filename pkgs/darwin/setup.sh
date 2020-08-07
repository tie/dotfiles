#!/bin/sh -eux

for dir in \
	"$HOME"/opt \
	"$HOME"/Applications; do
	if ! [ -d "$dir" ]; then
		mkdir "$dir"
	fi
done

if ! [ -d "$HOME"/opt/cltools ]; then
	echo "Installing CLTools"
	(. pkgs/darwin/cltools/setup.sh)
fi

if ! [ -d "$HOME"/Applications/CMake.app ]; then
	echo "Installing CMake"
	(. pkgs/darwin/cmake/setup.sh)
fi

if ! [ -d "$HOME"/Applications/Chromium.app ]; then
	echo "Installing Chromium"
	(. pkgs/darwin/chromium/setup.sh)
fi

if ! [ -d "$HOME"/opt/git ]; then
	echo "Installing Git"
	(. pkgs/darwin/git/setup.sh)
fi

if ! [ -d "$HOME"/opt/gnupg ]; then
	echo "Installing GnuPG"
	(. pkgs/darwin/gnupg/setup.sh)
fi

if ! [ -d "$HOME"/Applications/IINA.app ]; then
	echo "Installing IINA"
	(. pkgs/darwin/iina/setup.sh)
fi

if ! [ -d "$HOME"/Applications/ImageOptim.app ]; then
	echo "Installing ImageOptim"
	(. pkgs/darwin/imageoptim/setup.sh)
fi

if ! [ -d "$HOME"/opt/ninja ]; then
	echo "Installing Ninja"
	(. pkgs/darwin/ninja/setup.sh)
fi

if ! [ -d "$HOME"/Applications/OpenMTP.app ]; then
	echo "Installing OpenMTP"
	(. pkgs/darwin/openmtp/setup.sh)
fi

if ! [ -d "$HOME"/Applications/ScanTailor.app ]; then
	echo "Installing ScanTailor"
	(. pkgs/darwin/scantailor/setup.sh)
fi

if ! [ -d "$HOME"/Applications/Skim.app ]; then
	echo "Installing Skim"
	(. pkgs/darwin/skim/setup.sh)
fi

if ! [ -d "$HOME"/Applications/Transmission.app ]; then
	echo "Installing Transmission"
	(. pkgs/darwin/transmission/setup.sh)
fi
