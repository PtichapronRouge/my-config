#!/bin/bash

confdir="$HOME/my-config"
mkdir -p $HOME/.config

# misc

mkdir -p $HOME/.config/htop && ln -sf $confdir/config/htop/htoprc $HOME/.config/htop/htoprc

# i3

rm -rf $HOME/.config/i3 && ln -sf $confdir/config/i3 $HOME/.config/i3

# alacritty

ln -sf $confdir/config/alacritty $HOME/.config/alacritty

# ZSH

ln -sf $confdir/zsh $HOME/.zsh
ln -sf $HOME/.zsh/zshrc $HOME/.zshrc

# VIM
ln -sf $confdir/vim $HOME/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/backups

#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall
#python3 $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer

