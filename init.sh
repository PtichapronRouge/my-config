#!/bin/bash

# Vimrc initialization
ln -f -s ~/my-config/vim ~/.vim
ln -f -s ~/.vim/vimrc ~/.vimrc

# Vundle download
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Vundle launch
vim +PluginInstall +qall
