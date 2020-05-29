#!/bin/sh -eux

dest="$HOME/opt/git"
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

curl -f -s -S -L -o git.dmg 'https://downloads.sourceforge.net/project/git-osx-installer/git-2.23.0-intel-universal-mavericks.dmg'
shasum -s -c <<EOF
1a6e7e61bcc2c88896e2b8c773f851b9d482793f714d3cb2f902b09b08d4b5f3  git.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount git.dmg

xar -x -f "$temp"/mount/git-2.23.0-intel-universal-mavericks.pkg

mkdir package && cd package
cpio --quiet -m -i -F "$temp"/Payload

mv "$temp"/package/git "$dest"
