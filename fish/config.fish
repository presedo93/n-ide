if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

alias n='nvim'
alias lg='lazygit'
alias ls='eza --icons=always --color=always'
alias zlj='zellij'

pyenv init - fish | source
starship init fish | source
