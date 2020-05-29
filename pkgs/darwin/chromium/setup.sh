#!/bin/sh -eux

dest="$HOME/Applications/Chromium.app"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	cd "$temp"
	if [ -d mount ]; then
		hdiutil detach -quiet mount
	fi
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o chromium.dmg 'https://github.com/kramred/ungoogled-chromium-binaries/releases/download/81.0.4044.138-1/ungoogled-chromium_81.0.4044.138-1.1_macos.dmg'
shasum -s -c <<EOF
3d6c402573a77e26b3572fabda3613523cdce19f334ae503629285dc7b4c79b8  chromium.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount chromium.dmg

cp -a mount/Chromium.app Chromium.app

mv Chromium.app "$dest"
