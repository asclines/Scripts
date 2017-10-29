# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git, screen)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.commonrc
source ~/.zshrc.d/

setopt prompt_subst  # enable command substitution (and other expansions) in PROMPT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
