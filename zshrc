# Path to your oh-my-zsh installation.
export ZSH="/Users/safv12/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export LC_ALL=en_US.UTF-8

ZSH_DISABLE_COMPFIX=true 

# Setup vim keybindings
bindkey -v
