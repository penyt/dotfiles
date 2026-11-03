#!/usr/bin/env zsh

# In this file, these are settings that added manually.

###############
#   History   #
###############
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


##############
#   Common   #
##############
# commonly used path
export PATH="$HOME/.local/bin:$PATH"

# My default editor
# export EDITOR="hx"
export EDITOR="$(command -v nvim || command -v vim || command -v vi)"
export VISUAL="$EDITOR"

# Use truecolor
export COLORTERM=truecolor


###############
#   PLUGINS   #
###############
# zsh-autosuggestions
[[ -r "${0:A:h}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "${0:A:h}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting: already added in the bottom of entry.zsh

# zsh-completions
if [[ -d "${0:A:h}/plugins/zsh-completions/src" ]]; then
  fpath=("${0:A:h}/plugins/zsh-completions/src" $fpath)
fi

##############
#   Others   #
##############
# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line   # Ctrl-x Ctrl-e


# Custom completions
fpath=("$HOME/.config/.zsh/completions" $fpath)


# cd tab choose & completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots) # include hidden files in completion


# auto ls after cd
chpwd() { ls }


# make fzf work properly
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh) # shell integration
fi


# Atuin
[[ -f "$HOME/.atuin/bin/env" ]] && source "$HOME/.atuin/bin/env"
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
as() {
  local selected
  selected=$(
    atuin scripts list |
      awk '/^- / {
        sub(/^- /, "")
        sub(/ \[tags:.*$/, "")
        sub(/[[:space:]]+$/, "")
        print
      }' |
      fzf \
        --height=40% \
        --reverse \
        --prompt="Atuin Scripts > " \
        --preview="atuin scripts get {} | sed -n '/^script: |/,\$p' | sed '1d; s/^  //'" \
        --preview-window='right:60%:wrap'
  ) || return

  [[ -n "$selected" ]] && atuin scripts run "$selected"
}



# echo "settings loaded"
