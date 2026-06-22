# === Added by p10k ===
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# =====================

export MYCFG="$HOME/.config"

# SOURCE
[[ -f "$MYCFG/.zsh/settings.zsh" ]] && source "$MYCFG/.zsh/settings.zsh"
[[ -f "$MYCFG/.zsh/aliases.zsh" ]] && source "$MYCFG/.zsh/aliases.zsh"
[[ -f "$HOME/.secretenv.zsh" ]] && source "$HOME/.secretenv.zsh"
[[ -f "$MYCFG/.zsh/cmdmenu.zsh" ]] && source "$MYCFG/.zsh/cmdmenu.zsh"
# END OF SOURCE

#########################
#      MY SETTINGS      #
#########################


###########################
#    END OF MY SETTINGS   #
###########################


# SOURCE for specifically syntax-hightlighting
[[ -r "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# END OF SOURCE

# ============= EOF (below is added by other tools) =============


