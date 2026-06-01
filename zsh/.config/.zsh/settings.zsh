#!/usr/bin/env zsh

# In this file, these are settings that added manually.

# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Common usage
export PATH="$HOME/.local/bin:$PATH"

# My default editor
export EDITOR="hx"

# ======= PLUGINS =======
# zsh-autosuggestions & zsh-syntax-highlighting & zsh-completions
[[ -r "$MYCFG/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "$MYCFG/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Actually no need here. Already added in the bottom of ~/.zshrc
[[ -r "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -d "$MYCFG/.zsh/zsh-completions/src" ]]; then
  fpath=("$MYCFG/.zsh/zsh-completions/src" $fpath)
fi
# =======================

# history prefix search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # ↑ arrow key
bindkey '^[[B' down-line-or-beginning-search # ↓ arrow key

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
  source <(fzf --zsh)
fi

