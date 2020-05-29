#!/bin/sh -eu

quote() {
	printf %s\\n "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/'/"
}

while [ -n "${1+x}" ]; do
	case "$1" in
	-h | -help)
		echo "pkgs/setup.sh: packages setup script"
		echo
		echo "Usage: ./pkgs/setup.sh [flags] [--] [args]"
		echo
		echo "Flags:"
		echo "   -h: print help message"
		echo "   -v: enable verbose mode"
		echo
		exit 0
		;;
	-v | -verbose)
		shift
		set -x
		;;
	--)
		shift
		break
		;;
	-*)
		# Quote flag.
		flag=$(quote "$1")
		echo "Unknown option $flag"
		exit 1
		;;
	*)
		shift
		break
		;;
	esac
done

case "$(uname)" in
Darwin)
	os=darwin
	;;
*)
	echo "Unknown OS"
	exit 1
	;;
esac

(. pkgs/"$os"/setup.sh)
