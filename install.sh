#################### Variables #############################

old_dir="~/my-old-config"
dir="my-config"

#################### Adding directories ####################

echo "Adding directories..."
mkdir ~/.config          2> /dev/null
mkdir ~/.config/i3       2> /dev/null
mkdir ~/.config/i3blocks 2> /dev/null
mkdir "$old_dir"       2> /dev/null
mkdir ~/Programmation  2> /dev/null
ln -rs ~/Programmation ~/CurrentProject
ln -rs "Scripts" ~/bin

#################### Moving Old Files ######################

echo "Moving Old Files..."
mv ~/.vimrc "$old_dir"/vimrc 		   2> /dev/null
mv ~/.config/i3/config "$old_dir"/i3config 2> /dev/null
mv ~/.config/compton.conf "$old_dir"	   2> /dev/null
mv ~/.config/i3blocks/config "$old_dir"    2> /dev/null
mv ~/.zshrc "$old_dir"/zshrc		   2> /dev/null

#################### Linking Files #########################

echo "Linking New Files"
ln -rsf "vim/vimrc" ~/.vimrc
ln -rsf "i3/config" ~/.config/i3/config
ln -rsf "compton/compton.conf" ~/.config/compton.conf
ln -rsf "i3blocks/config" ~/.config/i3blocks/config
ln -rsf "zsh/zshrc" ~/.zshrc


#################### Installation ##########################



read -p "Do you want to install the package ? (y/N) : " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing packages..."
	sudo pacman -S --needed - < pkglist.txt
fi

echo "Installing vim dependencies..."
vim +PluginInstall +qall

echo "Installing Powerlevel9k..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
fc-cache -vf
xrdb Xresources

########### TO-DO : installation de paquet AUR & Git #######

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  #Pour OhMyZsh
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim #Pour Vundle
echo "Done !"



