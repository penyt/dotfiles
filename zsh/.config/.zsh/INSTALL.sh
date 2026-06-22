#!/usr/bin/env bash
set -e

ZSHCFG="$HOME/.config/.zsh"
PLUGINS="$ZSHCFG/plugins"

NOCP=0  # args
if [ "${1:-}" = "nocp" ]; then
  NOCP=1
fi

mkdir -p "$PLUGINS"

install_plugin() {
  local name="$1"
  local repo="$2"
  local target="$PLUGINS/$name"
  if [ ! -d "$target" ]; then
    if git clone --depth=1 "$repo" "$target"; then
      echo "Installed $name"
    else
      echo "Failed to install $name"
    fi
  else
    echo "$name already installed"
  fi
}
# install_plugin <name> <repo>
install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions"


# ~/.zshrc
if [ "$NOCP" -ne 1 ]; then
  if [ -f "$HOME/.zshrc" ]; then                                 # if "~/.zshrc" exist
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"   # backup
  fi
  cp "$ZSHCFG/min.zshrc" "$HOME/.zshrc"
  echo "Installed $HOME/.zshrc"
else
  echo "Skipped installing $HOME/.zshrc"
fi