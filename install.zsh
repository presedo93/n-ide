#!/bin/zsh

LG="\033[0;32m"
NC="\033[0m"

if [[ $# -eq 1 && $1 == "package"* ]]; then
    echo -e "$LG=> Installing all the packages... $NC"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo -e "$LG==> Linux OS detected... $NC"
        sudo apt install neovim
        sudo apt install ripgrep

        sudo apt install tmux
    elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo -e "$LG==> Mac OS detected... $NC"
        brew install neovim
        brew install ripgrep

        brew install tmux
    fi

    # Install the kitty terminal
    echo -e "$LG===> Installing kitty terminal... $NC"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    # Install the vim-plug extension
    echo -e "$LG===> Installing vim extensions manager... $NC"
    curl -fLo ~/.vim/plugged/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Create the config folder for nvim
    echo -e "$LG===> Creating the config vim folder... $NC"
    mkdir -p ~/.config/nvim

    # Git clone Tmux Plugin Manager
    echo -e "$LG===> Installing the Tmux Plugin Manager... $NC"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # oh my zsh plugins
    echo -e "$LG===> Oh My Zsh plugins... $NC"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Download spaceship theme
    echo -e "$LG===> Installing Spaceship zsh theme... $NC"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
fi

echo -e "$LG==> Creating the symlinks for all the configs... $NC"
# Create a symbolic link from this repo's init.vim
ln -svf $PWD/vim/init.vim $HOME/.config/nvim/init.vim

# Create a symbolic link from this repo's tmux.conf
ln -svf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Create a symbolic link from this repo's zshrc
ln -svf $PWD/zsh/zshrc $HOME/.zshrc

# Create a symbolic link from this repo's kitty.conf
ln -svf $PWD/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
