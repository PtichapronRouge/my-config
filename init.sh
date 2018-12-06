#!/bin/bash

# Vimrc initialization
ln -s ~/my-config/vim/vimrc ~/.vimrc

# Vundle download
git clone https://github.com/VundleVim/Vundle.vim.git ~/my-config/vim/bundle/Vundle.vim
# Vundle launch
vim +PluginInstall +qall
