#!/usr/bin/env zsh
# Here are aliases define by myself
# docker
alias dps='docker ps --format="\nNAME 【{{.Names}}】\n - STATUS   {{.Status}}\n - IMAGE    {{.Image}}\n - ID　  {{.ID}}\n - COMMAND  {{.Command}}\n - CREATED  {{.CreatedAt}}\n - PORTS    {{.Ports}}" '
alias dup='docker compose up -d'
alias dup-re='docker compose up -d --force-recreate'
# get inside the container
alias execin='echo "sudo docker exec -it XXX /bin/sh"'

# change permission
alias 775='sudo chmod -R 775 /home/ubuntu/docker/'
# change owner to ubuntu
alias isubuntu='sudo chown -R ubuntu:ubuntu /home/ubuntu/docker/'

# check port
# print the command used: echo -e "\n ▰▰▰▰▰▰ COMMAND: ▰▰▰▰▰▰"
alias seeport='sudo lsof -i -P -n && echo -e "\n ▰▰▰▰▰▰ COMMAND: sudo lsof -i -P -n ▰▰▰▰▰▰"'

###########################
# about all kind of tools #
###########################
alias so="source ~/.zshrc"
alias bat="bat --paging=never"
alias fbat="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 vim"
alias con="container"

if command -v eza >/dev/null 2>&1; then
  alias ls='eza -l'
  alias la='eza -la'
else
  alias ls='ls -l --color=auto'
  alias la='ls -a --color=auto'
fi
alias lss='command ls --color=auto'

alias t='tmux new -s 1'
alias tls='tmux ls'
alias tk='tmux kill-server'
alias topdf='soffice --headless --convert-to pdf'
alias gp='git push'
alias gb='git branch'
alias c='clear'
alias z='zed . '
alias f='fresh . '
alias utm='utmctl'
alias ts='tailscale'
alias hxc='hx ~/.config/helix'

brew-list() {
  echo "brew list --installed-as-dependency"
  echo "brew list --installed-on-request"
  echo "brew list --cask"
  echo "brew deps --tree <package>"
  echo "brew uses --installed APP"
}


#gac() {
#  git add .
#  echo -n "💿 Enter commit message: "
#  read msg
#  git commit -m "$msg"
#}
gac() {
  if [ "$#" -eq 0 ]; then
    git add .
    echo -n "💿 Enter commit message: "
    IFS= read -r msg
    git commit -m "$msg"
    return
  fi
  if [ "$#" -eq 1 ]; then
    git add .
    git commit -m "$1"
    return
  fi
  echo "Usage: only 0 or 1 arg" >&2
  return 2
}

