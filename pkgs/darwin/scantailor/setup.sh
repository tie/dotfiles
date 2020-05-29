#!/bin/sh -eux

dest="$HOME/Applications/ScanTailor.app"
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

curl -f -s -S -L -o scantailor.dmg 'https://github.com/yb85/scantailor-advanced-osx/releases/download/1.0.16-devel/ScanTailor.Advanced.v.1.0.16.develop@HEAD.build.20191012.dmg'
shasum -s -c <<EOF
ad27ea1b91a9bbd5fdf0be61491ecd96f48761f787400d380944baac32d63ddc  scantailor.dmg
EOF

hdiutil attach -quiet -nobrowse -noverify -mountpoint mount scantailor.dmg

cp -a "mount/ScanTailor (Advanced).app" ScanTailor.app

mv ScanTailor.app "$dest"
