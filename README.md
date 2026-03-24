# All about dotfiles

This repo contains all the dotfiles I usually use to configure my OS!

## Fonts

Pick one from this forked [repo](https://github.com/presedo93/fonts)!
E.g., *Dank Mono Nerd Font*!

## Ghostty

Just download and install it from the internet. And copy the configs.

## Fish

Just run the following command to install fish shell:

```bash
brew install gh
brew install fish
brew install starship
brew install sst/tap/opencode

echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

fish_add_path "/opt/homebrew/bin/"
fish_update_completions

set -U fish_greeting
set -gx EDITOR nvim

ln -svf $PWD/fish/starship.toml $HOME/.config/starship.toml
ln -svf $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -svf $PWD/fish/functions/worktrees.fish $HOME/.config/fish/functions/worktrees.fish

curl -sL
https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
source && fisher install jorgebucaran/fisher
```

### fisher

```bash
fisher install \
jorgebucaran/fisher \
jethrokuan/z \
patrickf1/fzf.fish \
jorgebucaran/autopair.fish \
gazorby/fish-abbreviation-tips \
fishingline/safe-rm
```

## Neovim and zellij

It contains neovim, zellij or lazygit.

```bash
brew install neovim
brew install zellij
brew install tree-sitter-cli

mkdir -p ~/.config/nvim
ln -svf $PWD/vim/* $HOME/.config/nvim

mkdir -p ~/.config/zellij && mkdir -p ~/.config/zellij/themes
ln -svf $PWD/zellij/config.kdl $HOME/.config/zellij/config.kdl
ln -svf $PWD/zellij/themes/*.kdl $HOME/.config/zellij/themes/
ln -svf $PWD/zellij/layouts/default.kdl $HOME/.config/zellij/layouts/default.kdl
```

Install the ascii image converter:

```bash
brew install TheZoraiz/ascii-image-converter/ascii-image-converter
```

## Tools

Like pyenv, fnm, uv, etc...

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer clippy
brew install nodejs fnm bat eza jq fzf readline xz pyenv

curl -LsSf https://astral.sh/uv/install.sh | sh
echo 'uv generate-shell-completion fish | source' > ~/.config/fish/completions/uv.fish
echo 'uv generate-shell-completion fish | source' > ~/.config/fish/completions/uv.fish
```

## git

Extra, copy the git config file...

Install [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) for better diffs.

```bash
gh extension install dlvhdr/gh-dash
gh extension install dlvhdr/gh-enhance
brew install lazygit diff-so-fancy dlvhdr/formulae/diffnav

ln -svf $PWD/lazygit/config.yml $HOME/Library/Application\ Support/lazygit/config.yml
ln -svf $PWD/lazygit/gitconfig $HOME/.gitconfig
ln -svf $PWD/lazygit/gitignore $HOME/.gitignore
ln -svf $PWD/lazygit/dash.yml $HOME/.config/gh-dash/config.yml
```

## opencode

Link all the opencode agents:

```bash
ln -svf $PWD/opencode/opencode.jsonc ~/.config/opencode/opencode.jsonc
ln -svf $PWD/opencode/oh-my-opencode.json ~/.config/opencode/oh-my-opencode.json
```

```bash
npm install -g @upstash/context7-mcp
```

## ssh

When doing ssh, some instances won't map the **backspace** key properly. To fix
that, run this command replacing the `YOUR-SERVER` variable:

```bash
infocmp -x xterm-ghostty | ssh YOUR-SERVER -- tic -x -
```

## rust

Link the cargo config file:

```bash
mkdir -p ~/.cargo
ln -svf $PWD/rust/cargo.toml $HOME/.cargo/config.toml
```

## docker

Instead of using `docker` or `orbstack` we can go with `colima` which is a
docker alternative that runs on top of qemu and is more lightweight.

```bash
brew install colima
brew install docker docker-compose docker-buildx
```

After installing, run `brew info docker` to get the instructions to
link the docker cli to colima.
