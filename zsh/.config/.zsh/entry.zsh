
# basic settings
source "${0:A:h}/settings.zsh"

# aliases
source "${0:A:h}/aliases.zsh"

# cmdmenu tool
source "${0:A:h}/cmdmenu.zsh"




# SOURCE for specifically syntax-hightlighting
[[ -r "${0:A:h}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "${0:A:h}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# END OF SOURCE


# echo "entry.zsh loaded"
