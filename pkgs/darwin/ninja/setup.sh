#!/bin/sh -eux

dest="$HOME/opt/ninja"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o ninja.zip 'https://github.com/ninja-build/ninja/releases/download/v1.10.0/ninja-mac.zip'
shasum -s -c <<EOF
2ee405c0e205d55666c60cc9c0d8d04c8ede06d3ef2e2c2aabe08fd81c17d22e  ninja.zip
EOF

mkdir ninja
unzip -q -d ninja/bin ninja.zip

mv ninja "$dest"
