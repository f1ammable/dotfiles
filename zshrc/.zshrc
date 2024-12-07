export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="gruvbox-dark"
export KITTY_ENABLE_WAYLAND=1
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

ZSH_THEME="sorin"
plugins=(git autoswitch_virtualenv)

source $ZSH/oh-my-zsh.sh

alias ls="lsd"
alias ll="lsd -lah"
alias gs="git status"
alias cat="bat"

function hx {
  command helix "$@"
  echo -ne "\e[0 q"
}

function lk {
  cd "$(walk --icons "$@")"
}

export EDITOR=helix
eval $(thefuck --alias)

