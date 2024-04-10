# All about dotfiles

This repo contains all the dotfiles I usually use to configure my OS!

## Kitty

For the terminal, kitty is my preference.

    $ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


## IDE, languages and more

It contains neovim, zellij or lazygit.

    $ brew install neovim@HEAD
    $ brew install zellij
    $ brew install lazygit
    $ brew install lazydocker

Next thing is to install the languages and their package managers.

    $ brew install ruby
    $ brew install nodejs npm
    $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Tools

Like pyenv, fnm, etc...

    $ curl https://pyenv.run | bash
    $ curl -sSL https://install.python-poetry.org | python3 - --preview
    $ poetry config virtualenvs.in-project true

    $ brew install fnm
    $ gem install colorls
    $ brew install bat
    $ brew install jq

## Oh my Zsh

First, let's install it and then configure some of its plugins and theme.

    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    $ git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
    $ ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"

## Neovim and lazyvim

We need to create the config folder for neovim and then start lazyvim linking this repo.

    $ mkdir -p ~/.config/nvim
    $ ln -svf $PWD/vim/* $HOME/.config/nvim
    $ ln -svf $PWD/lazy-lock.json $HOME/.config/nvim/lazy-lock.json

## Symbolic links

Finally, we need to link the rest of the configs.

    $ ln -svf $PWD/zsh/zshrc $HOME/.zshrc
    $ ln -svf $PWD/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
    $ ln -svf $PWD/zellij/config.kdl $HOME/.config/zellij/config.kdl

In case of having a layout config in zellij.

    $ ln -svf $PWD/zellij/layouts/default.kdl $HOME/.config/zellij/layouts/default.kdl

## git

Extra, copy the git config file...
