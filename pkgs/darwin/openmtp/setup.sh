#!/bin/sh -eux

dest="$HOME/Applications/OpenMTP.app"
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

curl -f -s -S -L -o openmtp.dmg 'https://github.com/ganeshrvel/openmtp/releases/download/v2.4.1/OpenMTP-2.4.1.dmg'
shasum -s -c <<EOF
46b6781264a98f978890d15a0405ddcbaeb57e0cc91a07aa1296328c71950c4f  openmtp.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount openmtp.dmg

cp -a mount/OpenMTP.app OpenMTP.app

mv OpenMTP.app "$dest"
