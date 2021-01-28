# Path to your oh-my-zsh installation.
export ZSH="/home/safv12/.oh-my-zsh"

# ZSH_THEME="pygmalion"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux aws kubectl vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
export GITHUB_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

# Directories aliases
alias vim=nvim
alias vi=nvim

export PATH=$PATH:~/bin

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
