Add following to ~/.zshrc

```shell
export MYCFG="$HOME/.config"

# SOURCE
[[ -f "$MYCFG/.zsh/settings.zsh" ]] && source "$MYCFG/.zsh/settings.zsh"
[[ -f "$MYCFG/.zsh/aliases.zsh" ]] && source "$MYCFG/.zsh/aliases.zsh"
# END OF SOURCE
```


At the bottom of the `~/.zshrc`, add:

```shell
[[ -r "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
```

