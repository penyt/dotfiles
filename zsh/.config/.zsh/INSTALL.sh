#!/usr/bin/env bash
set -euo pipefail

ZSHCFG="${ZSHCFG:-$HOME/.config/.zsh}"
PLUGINS="$ZSHCFG/plugins"

UPDATE=0

for arg in "$@"; do
  case "$arg" in
    update)
      UPDATE=1
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: $0 [update]" >&2
      exit 1
      ;;
  esac
done

mkdir -p "$PLUGINS"

install_plugin() {
  local name="$1"
  local repo="$2"
  local target="$PLUGINS/$name"

  if [ ! -d "$target/.git" ]; then
    rm -rf "$target"
    git clone --depth=1 "$repo" "$target"
    echo "Installed $name"
    echo
    return
  fi

  if [ "$UPDATE" -eq 1 ]; then
    before="$(git -C "$target" rev-parse HEAD)"
    git -C "$target" pull --ff-only --quiet
    after="$(git -C "$target" rev-parse HEAD)"

    if [ "$before" != "$after" ]; then
      echo "Updated $name"
    else
      echo "$name already up to date"
    fi
  else
    echo "$name already installed"
  fi

  echo
}

install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions"
