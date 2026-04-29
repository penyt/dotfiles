# Sourcing

```sh
echo "source ~/.vim/vimrc" >> ~/.vimrc
```

# Install vim-plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# Install all plugins

In vim, command mode, `:PlugInstall`

# Add lsp path

Put in ~/.zshrc etc.
```
export LSP_BIN_DIR="$HOME/.local/share/nvim/mason/bin/"
```


