#!/bin/zsh

VIMHOME=~/.vim

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "Get the vimrc repo"
git clone git://github.com/yishanhe/vimrc.git "$VIMHOME"

echo "Get the vundle repo"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "Creat the vimrc link"

lnif "$VIMHOME/vimrc"                      "$HOME/.vimrc"
lnif "$VIMHOME/vimrc.plugins"              "$HOME/.vimrc.plugins"
lnif "$VIMHOME/vimrc.plugins.config"       "$HOME/.vimrc.plugins.config"



echo "Plugin Installed"
vim +PluginInstall +qall

echo "Shanhe's vimrc is installed."



