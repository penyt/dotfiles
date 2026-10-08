#!/usr/bin/env zsh

# In this file, these are settings that added manually.

###########
# History #
###########
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# history prefix search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# bindkey '^[[A' up-line-or-beginning-search   # ↑ arrow key
# bindkey '^[[B' down-line-or-beginning-search # ↓ arrow key
for keymap in emacs viins; do
  bindkey -M "$keymap" '\e[A' up-line-or-beginning-search
  bindkey -M "$keymap" '\e[B' down-line-or-beginning-search
  bindkey -M "$keymap" '\eOA' up-line-or-beginning-search
  bindkey -M "$keymap" '\eOB' down-line-or-beginning-search
done


##########
# Common #
##########
# commonly used path
export PATH="$HOME/.local/bin:$PATH"

# My default editor
# export EDITOR="hx"

# Use truecolor
export COLORTERM=truecolor


###########
# PLUGINS #
###########
# zsh-autosuggestions
[[ -r "${0:A:h}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "${0:A:h}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting: already added in the bottom of entry.zsh

# zsh-completions
if [[ -d "${0:A:h}/plugins/zsh-completions/src" ]]; then
  fpath=("${0:A:h}/plugins/zsh-completions/src" $fpath)
fi

##########
# Others #
##########
# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# cd tab choose
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots) # include hidden files in completion

# auto ls after cd
chpwd() {
  ls
}

# make fzf work properly 
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh) # shell integration
fi



# echo "settings loaded"
