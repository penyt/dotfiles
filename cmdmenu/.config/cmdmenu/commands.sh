# 編輯config/zsh
hx ~/.config/.zsh

# 編輯config/helix
hx ~/.config/helix

# 編輯config/nvim
hx ~/.config/nvim

# 編輯config/tmux
hx ~/.tmux.conf

# 編輯config/vim
hx ~/.vim

# 編輯config/cmdmenu
hx ~/.config/cmdmenu/commands.sh

# 編輯config/hammerspoon
hx ~/.hammerspoon

# 編輯config/wezterm
hx ~/.wezterm.lua


# 列出brew套件/作為 dependency 被安裝
brew list --installed-as-dependency

# 列出brew套件/主動 request 安裝
brew list --installed-on-request

# 列出brew套件/cask 的套件
brew list --cask

# 列出brew套件/依賴的架構：+1 arg <package>
brew deps --tree 


# colima/啟動colima
colima start

# colima/關閉colima
colima stop

# colima/查看colima狀態
colima status


# apple.container/啟動container
container system start

# apple.container/關閉container
container system stop

# apple.container/查看container狀態
container system status


# hugo/檢查主題的submodule有沒有更新
git -C themes/morandyt fetch origin && git -C themes/morandyt log --oneline --decorate HEAD..origin/main && git -C themes/morandyt diff --stat HEAD..origin/main

# hugo/更新submodule
git submodule update --remote --merge themes/morandyt

# hugo/生成網站
hugo server

# hugo/生成網站（不用cache）
hugo server --ignoreCache --disableFastRender



# 查看磁碟空間
df -h

