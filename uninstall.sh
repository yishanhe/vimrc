#!/usr/bin/env sh

app_dir="$HOME/.vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm $HOME/.vimrc*
rm -rf $app_dir
