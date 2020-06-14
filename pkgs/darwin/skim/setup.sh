#!/bin/sh -eux

dest="$HOME/Applications/Skim.app"
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

curl -f -s -S -L -o skim.dmg 'https://downloads.sourceforge.net/project/skim-app/Skim/Skim-1.5.9/Skim-1.5.9.dmg'
shasum -s -c <<EOF
c68f49315727d81fefdaf365843131d46ced66584fd8b2dde2e82427fb0e5aaa  skim.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount skim.dmg

cp -a mount/Skim.app Skim.app

mv Skim.app "$dest"
