Arch linux config files

st
  requires FantasqueSans font
  requires zsh
  requires compton

tmux
  requires xclip

zsh
  requires oh my szh plugin manager
  requires ttf-symbola aur-package

X11
  requires feh
  requires compton
  uses ~/Pictures/wallpaper.png as wallpaper

i3
  requires i3blocks
  requires i3lock-fancy-multimonitor
  requires nnn
  requires tmux
  requires zsh
  requures dmenu
  requires xkb-layout-state
  requires xidlehook (aur)
  requires socat

nvim
  requires ctags
  requires nnn
  reguires ripgrep
  requires python-neovim
  requires python-pytest
  requires clang-format
  requires nodejs, yarn and ccls-git (for coc.vim)
  run init.sh for nvim setup
  run :CocInstall coc-python after coc.vim initialization

weechat

bitlbee-purple
  resides in aur package
  install purple-skypeweb for enabling skype
  install telegram-purple for enabling telegram

nnn
  confgired via environment variables which exported in zshenv
  requires mimeo
  requires xdg-utils-mimeo

mimeo
  config resides in ~/.config
