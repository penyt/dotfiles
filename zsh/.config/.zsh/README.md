
## Source
Add to the bottom of ~/.zshrc
```sh
# ======================= My config entry =======================
source "$HOME/.config/.zsh/entry.zsh"
# ============= EOF (below is added by other tools) =============
```

## Script INSTALL.sh

The script will handle zsh plugins installation, run:
```sh
./INSTALL.sh
```

To update plugins, run:
```sh
./INSTALL.sh update
```


---
## More tools

### Install p10k

Link: https://github.com/romkatv/powerlevel10k#manual

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```


### Install fzf

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

### Install helix

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
