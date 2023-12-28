#!/bin/zsh

LG="\033[0;32m"
NC="\033[0m"

if [[ $# -eq 1 && $1 == "all"* ]]; then
    echo -e "$LG=> Installing all the packages... $NC"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	    echo -e "$LG==> Linux OS detected... $NC"
        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt update
        sudo apt install neovim

        sudo apt install tmux

        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
        rm lazygit.tar.gz

        LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
        curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
        mkdir lazydocker-temp && tar xf lazydocker.tar.gz -C lazydocker-temp
        sudo mv lazydocker-temp/lazydocker /usr/local/bin
        rm -rf lazydocker.tar.gz && rm -rf lazydocker-temp

        sudo apt install ruby-full nodejs npm

    elif [[ "$OSTYPE" == "darwin"* ]]; then
	    echo -e "$LG==> Mac OS detected... $NC"
        brew install neovim --HEAD

        brew install tmux
        brew install jesseduffield/lazygit/lazygit
        brew install jesseduffield/lazydocker/lazydocker

        brew install ruby nodejs npm
    fi

    # Install pyenv
    echo -e "$LG===> Installing pyenv... $NC"
    curl https://pyenv.run | bash

    # Install poetry
    echo -e "$LG===> Installing poetry... $NC"
    curl -sSL https://install.python-poetry.org | python3 - --preview

    # Set poetry to create venvs in-project
    poetry config virtualenvs.in-project true

    # Install nvm
    echo -e "$LG===> Installing nvm... $NC"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    # Install the kitty terminal
    echo -e "$LG===> Installing kitty terminal... $NC"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    # Install the vim-plug extension
    echo -e "$LG===> Installing vim packer ... $NC"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Create the config folder for nvim
    echo -e "$LG===> Creating the config vim folder... $NC"
    mkdir -p ~/.config/nvim

    # Git clone Tmux Plugin Manager
    echo -e "$LG===> Installing the Tmux Plugin Manager... $NC"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install rbenv
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo gem install colorls
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        gem install colorls
    fi

    # Install bat
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install bat
    fi

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
ln -svf $PWD/vim/* $HOME/.config/nvim

# Create a symbolic link from this repo's tmux.conf
ln -svf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Create a symbolic link from this repo's zshrc
ln -svf $PWD/zsh/zshrc $HOME/.zshrc

# Create a symbolic link from this repo's kitty.conf
ln -svf $PWD/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# Create a symbolic link from this repo's lazy-lock.json
ln -svf $PWD/lazy-lock.json $HOME/.config/nvim/lazy-lock.json
