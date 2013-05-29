#!/bin/bash
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/yishanhe/vimrc.git "$VIMHOME"
git clone git://github.com/gmarik/vundle.git $VIMHOME/bundle/vundle
cd "$VIMHOME"
cd bundle/command-t/ruby/command-t
(ruby extconf.rb && make) || warn "Can't compile Command-T."

cd ..
ln -s .vim/dotvimrc .vimrc
vim +BundleInstall

echo "Shanhe's vimrc is installed."

