#!/bin/sh -eux

dest="$HOME/Applications/CMake.app"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o cmake.tgz 'https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3-Darwin-x86_64.tar.gz'
shasum -s -c <<EOF
2ad1413510681b041ec305923c6ccbc64b0fed6608df82f5543577f7b4b88305  cmake.tgz
EOF

gzip -d -c cmake.tgz | tar -x

mv cmake-3.17.3-Darwin-x86_64/CMake.app "$dest"
