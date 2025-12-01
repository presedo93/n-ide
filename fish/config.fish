if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

alias n='nvim'
alias lg='lazygit'
alias ls='eza --icons=always --color=always'
alias zlj='zellij'

set -gx EDITOR nvim

pyenv init - fish | source
starship init fish | source

# Set up Ghostty's shell integration.
if test -n "$GHOSTTY_RESOURCES_DIR"
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
