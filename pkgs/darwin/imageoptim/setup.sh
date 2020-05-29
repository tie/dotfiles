#!/bin/sh -eux

dest="$HOME/Applications/ImageOptim.app"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o imageoptim.tbz2 'https://imageoptim.com/ImageOptim1.8.8.tar.bz2'
shasum -s -c <<EOF
f48ce652b8cbf0186e3a550d1dcd0ab81366d0662a3f01621d4cadd4af23cce3  imageoptim.tbz2
EOF

bzip2 -d -c imageoptim.tbz2 | tar -x

mv ImageOptim.app "$dest"
