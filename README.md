# All about dotfiles

This repo contains all the dotfiles I usually use to configure my OS!

## Ghostty

Just download and install it from the internet. And copy the configs.

## IDE, languages and more

It contains neovim, zellij or lazygit.

    brew install neovim
    brew install zellij
    brew install lazygit

Next thing is to install the languages and their package managers.

    brew install nodejs
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Tools

Like pyenv, fnm, etc...

    curl https://pyenv.run | bash
    curl -sSL https://install.python-poetry.org | python3 - --preview
    poetry config virtualenvs.in-project true

    curl -fsSL https://fnm.vercel.app/install | bash
    brew install bat
    brew install eza
    brew install jq
    brew install fzf

## Fish

Just run the following command to install fish shell:

    brew install fish
    brew install starship

    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish

    fish_add_path "/opt/homebrew/bin/"
    fish_update_completions

    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

## Neovim and lazyvim

We need to create the config folder for neovim and then start lazyvim linking this repo.

    mkdir -p ~/.config/nvim
    ln -svf $PWD/vim/* $HOME/.config/nvim

## Symbolic links

Finally, we need to link the rest of the configs.

    mkdir -p ~/.config/zellij
    ln -svf $PWD/zsh/zshrc $HOME/.zshrc
    ln -svf $PWD/zellij/config.kdl $HOME/.config/zellij/config.kdl

In case of having a layout config in zellij.

    ln -svf $PWD/zellij/layouts/default.kdl $HOME/.config/zellij/layouts/default.kdl

## git

Extra, copy the git config file...

Install [delta](https://github.com/dandavison/delta) for better diffs.

    brew install git-delta

## fish

How to install it in [macOS](https://mmazzarolo.com/blog/2023-11-16-my-fish-shell-setup-on-macos/). And needed plugins:

    jorgebucaran/fisher
    jethrokuan/z
    patrickf1/fzf.fish
