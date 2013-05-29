#!/bin/zsh

VIMHOME=~/.vim
DIR=""
 
echo "Start to install vimrc"

if
    [-e $VIMHOME/vimrc] 
then
    echo "$VIMHOME/vimrc already exists."
    DIR=${DIR}" $VIMHOME/vimrc" 
fi

if 
    [-e ~/.vim]
then
    echo "~/.vim already exists."
    DIR=${DIR}" ~/.vim" 
fi

if 
    [-e ~/.vimrc]
then
    echo "~/.vimrc already exists."
    DIR=${DIR}" ~/.vimrc" 
fi

echo $DIR
echo -n "Are you sure to delete these files?(yes or no)"
read Arg
case $Arg in
    y|Y|yes|Yes)
        [-z $DIR];;
#        rm $VIMHOME/vimrc ~/.vim ~/.vimrc;;
    n|N|no|No)
         echo "Aborted by user"
         exit 0;;
esac

echo "Get the vimrc repo"
git clone git://github.com/yishanhe/vimrc.git "$VIMHOME"

echo "Get the vundle repo"
git clone git://github.com/gmarik/vundle.git $VIMHOME/bundle/vundle


echo "Creat the vimrc link"
cd "$VIMHOME"
cd ..
ln -s .vim/dotvimrc .vimrc

echo "Bundle Install"
vim +BundleInstall +qa


echo "Compile Command-T"
cd $VIMHOME/bundle/command-t/ruby/command-t
(ruby extconf.rb && make) || echo "Can't compile Command-T."


echo "Shanhe's vimrc is installed."

