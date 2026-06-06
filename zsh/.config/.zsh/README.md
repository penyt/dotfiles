## zsh

Add following to ~/.zshrc

```shell
export MYCFG="$HOME/.config"
# SOURCE
[[ -f "$MYCFG/.zsh/settings.zsh" ]] && source "$MYCFG/.zsh/settings.zsh"
[[ -f "$MYCFG/.zsh/aliases.zsh" ]] && source "$MYCFG/.zsh/aliases.zsh"
[[ -f "$HOME/.secretenv.zsh" ]] && source "$HOME/.secretenv.zsh"
[[ -f "$MYCFG/.zsh/cmdmenu.zsh" ]] && source "$MYCFG/.zsh/cmdmenu.zsh"
# END OF SOURCE

```


At the bottom of the `~/.zshrc`, add:

```shell
[[ -r "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$MYCFG/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
```



## Install fzf
Doc: https://github.com/junegunn/fzf#installation

Homebrew:
```sh
brew install fzf
```

Fedora dnf:
```sh
sudo dnf install fzf
```

Apt:
```sh
sudo apt install fzf
```

## Install helix

Homebrew:
```sh
brew install helix
```

Fedora dnf:
```sh
sudo dnf install helix
```

Apt (ppa):
```sh
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
```
