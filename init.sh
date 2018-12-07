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

# Vundle launch
vim +PluginInstall +qall
