## Script INSTALL.sh

The script will handle zsh plugins and minimal ~/.zshrc installation

To skip the copy part of ~/.zshrc, execute with the arg `nocp`
```sh
./INSTALL.sh nocp
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
