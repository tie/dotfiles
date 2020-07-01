#!/bin/sh -eux

dest="$HOME/Applications/Transmission.app"
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

curl -f -s -S -L -o transmission.dmg 'https://github.com/transmission/transmission-releases/raw/master/Transmission-3.00.dmg'
shasum -s -c <<EOF
f9984b6ba51a02bb8f880c538b28e2c7d6a3b7a22257a166cc3e1d55a133ab34  transmission.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount transmission.dmg

cp -a mount/Transmission.app Transmission.app

mv Transmission.app "$dest"
