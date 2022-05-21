#!/bin/zsh

if [[ $# -eq 1 && $1 == "package"* ]]; then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install neovim
        sudo apt install ripgrep

        sudo apt install tmux
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install neovim
        brew install ripgrep

        brew install tmux
    fi

    # Install the kitty terminal
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    # Install the vim-plug extension
    curl -fLo ~/.vim/plugged/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Create the config folder for nvim
    mkdir -p ~/.config/nvim

    # Git clone Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # oh my zsh plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Download spaceship theme
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
fi

# Create a symbolic link from this repo's init.vim
ln -svf $PWD/vim/init.vim $HOME/.config/nvim/init.vim

# Create a symbolic link from this repo's tmux.conf
ln -svf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Create a symbolic link from this repo's zshrc
ln -svf $PWD/zsh/zshrc $HOME/.zshrc

# Create a symbolic link from this repo's kitty.conf
ln -svf $PWD/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
