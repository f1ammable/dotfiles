# Aliases
alias ll="lsd -la"
alias ls="lsd"
alias cat="bat"

export BAT_THEME="gruvbox-dark"
export PATH=/usr/local/opt/binutils/bin:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

/bin/cat << "EOF"

 /\_/\
( o.o )
 > ^ <

EOF

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

