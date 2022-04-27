#!/bin/bash
 
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   sudo apt install neovim
elif [[ "$OSTYPE" == "darwin"* ]]; then
   brew install neovim
fi
 
# Install the vim-plug extension
curl -fLo ~/.vim/plugged/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
# Create the nvim folder inside .config
mkdir -p ~/.config/nvim
 
# Create a symbolic link from this repo's init.vim
ln -rs init.vim ~/.config/nvim/init.vim
 
# Install the extensions in the init.vim file
nvim -es -i NONE -c "PlugInstall" -c "qa"
