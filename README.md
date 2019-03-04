Arch linux config files

st
  requires FantasqueSans font
  requires zsh
  requires compton

tmux
  requires xclip

zsh
  requires oh my szh plugin manager

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

nvim
  requires ctags
  requires nnn
  reguires ripgrep
  requires python-neovim
  requires python-pytest
  run init.sh for nvim setup

weechat

bitlbee-purple
  resides in aur package
  install purple-skypeweb for enabling skype
  install telegram-purple for enabling telegram
