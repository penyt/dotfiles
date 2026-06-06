#!/usr/bin/env bash

mkdir -p $MYCFG/.zsh/plugins

[ -d $MYCFG/.zsh/plugins/zsh-autosuggestions ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions $MYCFG/.zsh/plugins/zsh-autosuggestions

[ -d $MYCFG/.zsh/plugins/zsh-syntax-highlighting ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $MYCFG/.zsh/plugins/zsh-syntax-highlighting


[ -d $MYCFG/.zsh/plugins/zsh-completions ] || \
  git clone https://github.com/zsh-users/zsh-completions $MYCFG/.zsh/plugins/zsh-completions


