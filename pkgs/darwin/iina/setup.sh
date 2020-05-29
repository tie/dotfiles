#!/bin/sh -eux

dest="$HOME/Applications/IINA.app"
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

curl -f -s -S -L -o iina.dmg 'https://dl.iina.io/IINA.v1.0.6.dmg'
shasum -s -c <<EOF
51cce921ef52f00df9b474e230f33d5a947c5b6e4d33aac4213a0e07b4b4a246  iina.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount iina.dmg

cp -a mount/IINA.app IINA.app

mv IINA.app "$dest"
