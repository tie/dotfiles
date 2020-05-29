#!/bin/sh -eux

dest="$HOME/opt/gnupg"
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

curl -f -s -S -L -o gnupg.dmg 'https://downloads.sourceforge.net/project/gpgosx/GnuPG-2.2.20.dmg'
shasum -s -c <<EOF
39970099819616d4b66a4e471ce26db97384948d0f375e02aae9d9de1d69baa5  gnupg.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount gnupg.dmg

xar -x -f "$temp"/mount/Install.pkg

mkdir package && cd package
cpio --quiet -m -i -F "$temp"/GnuPG.pkg/Payload

mv "$temp"/package "$dest"
