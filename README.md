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
  requires vifm
  requires tmux
  requires zsh
  requures dmenu
  requires xkb-layout-state

nvim
  requires ctags
  requires vifm
  reguires ripgrep
  run init.sh for nvim setup
