## Usage

### Process
1. (In bash) Install zsh, stow
2. Stow zsh config
3. Run `./plugz`
    - 4 plugins will be installed
    - `~/.zshrc` will be created with one line `source "$HOME....10k.zsh-theme"`
4. Change default shell `chsh -s $(which zsh)`
5. Restart the (ssh) shell
    - p10k configure should pop up after new shell started
6. Finish configuration (In zsh)
7. Add to the bottom of ~/.zshrc
```sh
# ======================= My config entry =======================
source "$HOME/.config/.zsh/entry.zsh"
# ============= EOF (below is added by other tools) =============
```

### Update plugins
To update plugins, run:
```sh
./plugz update
```


---
## More tools


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



