#!/usr/bin/zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   sudo apt install neovim
   sudo apt install ripgrep

   sudo apt install tmux
elif [[ "$OSTYPE" == "darwin"* ]]; then
   brew install neovim
   brew install ripgrep

   brew install tmux
fi

# Install the vim-plug extension
curl -fLo ~/.vim/plugged/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create the config folder for nvim
mkdir -p ~/.config/nvim

# Create a symbolic link from this repo's init.vim
ln -f -r -s vim/init.vim ~/.config/nvim/init.vim

# Git clone Tmux Plugin Manager
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create a symbolic link from this repo's tmux.conf
ln -f -r -s tmux/tmux.conf ~/.tmux.conf

# Download spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"

# Create a symbolic link from this repo's zshrc
ln -f -r -s zsh/zshrc ~/.zshrc
