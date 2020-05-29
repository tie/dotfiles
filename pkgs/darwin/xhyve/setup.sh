#!/bin/sh -eux

dest="$HOME/opt/xhyve"
if [ -d "$dest" ]; then
	exit 1
fi

temp=$(mktemp -d -t dotfiles)
trap cleanup EXIT
cleanup() {
	rm -r "$temp"
}

cd "$temp"

curl -f -s -S -L -o xhyve.tbz2 'https://packages.macports.org/xhyve/xhyve-20191002_0.darwin_19.x86_64.tbz2'
shasum -s -c <<EOF
03d0ce9ebc60709f8046ea7798621c5ab34aea763438bc6e7de67ce3927df57d  xhyve.tbz2
EOF

curl -f -s -S -L -o edk2.txz 'https://pkg.freebsd.org/FreeBSD:12:amd64/release_1/All/uefi-edk2-bhyve-0.2_1,1.txz'
shasum -s -c <<EOF
1c5694cb40dca18f4b7129f4a6dc0712ae0925806fac3bf81d547c35670f5d12  edk2.txz
EOF

bzip2 -d -c xhyve.tbz2 | tar -x opt/local/bin
gzip -d -c edk2.txz | tar -s ':/::' -x /usr/local/share/uefi-firmware

mkdir target
mv opt/local/bin usr/local/share target

mv target "$dest"
