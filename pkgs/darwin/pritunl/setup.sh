#!/bin/sh -eux

dest="$HOME/Applications/Pritunl.app"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o pritunl.zip 'https://github.com/pritunl/pritunl-client-electron/releases/download/1.0.2440.93/Pritunl.pkg.zip'
shasum -s -c <<EOF
749c6bbb0fc00bbbc14cb8a0a2d2e363d01ca18cc97bc4604df98f838bb5b39f  pritunl.zip
EOF

unzip -q -LL pritunl.zip
xar -x -f pritunl.pkg Build.pkg/Payload
cpio --quiet -m -i -F Build.pkg/Payload

mv Applications/Pritunl.app "$dest"
