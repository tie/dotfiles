#!/bin/sh -eux

dest="$HOME/Applications/WebTorrent.app"
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

curl -f -s -S -L -o webtorrent.dmg 'https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.21.0/WebTorrent-v0.21.0.dmg'
shasum -s -c <<EOF
caa0be97dadae10fa2ea45f33e2707bcf203893935dbbd835eed4a7103cca448  webtorrent.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount webtorrent.dmg

cp -a mount/WebTorrent.app WebTorrent.app

mv WebTorrent.app "$dest"
