Arch linux config files

alacritty
  requires ttf-hack-nerd  
  requires zsh  
  requires picom  

zsh
  requires oh my szh plugin manager  
  requires ttf-symbola aur-package  

X11
  requires feh  
  requires picom  
  uses ~/Pictures/wallpaper.png as wallpaper  

i3
  requires i3blocks  
  requires i3blocks-contrib  
  requires xkblayout-state  
  requires i3lock-fancy-multimonitor  
  requires nnn  
  requires alacritty  
  requires zsh  
  requures rofi  
  requites greenclip  
  requires xkb-layout-state  
  requires i3lock-fancy (aur)  
  requires xss-lock  
  requires qutebrowser  
  move lock.sh to ~/bin  

nvim
  requires nnn  
  reguires ripgrep  

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

qutebrowser
  config resides in ~./config/qutebrowser  
  move qutebrowser script to ~/bin  
    to know more about it google "Why does it take longer to open a URL in qutebrowser than in chromium?"  

gef
  requires gdb, xdotool  
  config resizes in ~/  
  run sudo pip install keystone-engine ropper unicorn capstone keystone-engine  
