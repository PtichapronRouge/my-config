#################### Variables #############################

old_dir="~/my-old-config"
dir="~/my-config"

#################### Adding directories ####################

mkdir ~/.config
mkdir ~/.config/i3
mkdir ~/.config/i3blocks
mkdir ~/"$old_dir"

#################### Moving Old Files ######################

mv ~/.vimrc "$old_dir"/vimrc
mv ~/.config/i3/config "$old_dir"/i3config
mv ~/.config/compton.conf "$old_dir"
mv ~/.config/i3blocks/config "$old_dir"
mv ~/.zshrc "$old_dir"/zshrc

#################### Linking Files ########################


ln -rs "$dir"/vim/vimrc ~/.vimrc
ln -rs "$dir"/i3/config ~/.config/i3/config
ln -rs "$dir"/compton/compton.conf ~/.config/compton.conf
ln -rs "$dir"/i3blocks/config ~/.config/i3blocks/config
ln -rs "$dir"/zsh/zshrc ~/.zshrc
