#!/bin/bash

# Vimrc initialization
ln -f -s ~/my-config/vim ~/.vim
ln -f -s ~/.vim/vimrc ~/.vimrc


# Vundle download
VUNDLE_PATH=~/.vim/bundle/Vundle.vim

if [ -e $VUNDLE_PATH ]; then
    echo "Vundle.vim repository found. Pulling..."
    git -C $VUNDLE_PATH pull
else
    echo "Cloning Vundle.vim repository"
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
fi
echo "Done"

# Required to prevent yankring from writing in $HOME
mkdir -p ~/.vim/buffers

# Vundle launch
echo "Installing vim plugins..."
vim +PluginInstall +qall
echo "Done"

