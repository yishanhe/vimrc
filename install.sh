#!/bin/zsh

VIMHOME=~/.vim

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "Get the vimrc repo"
git clone git://github.com/yishanhe/vimrc.git "$VIMHOME"

echo "Get the NeoBundle"
curl -fsSL https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh


echo "Creat the vimrc link"

lnif "$VIMHOME/vimrc"                      "$HOME/.vimrc"

echo "Plugin will be automatically installed when you first time open VIM."

echo "Shanhe's vimrc is installed."



