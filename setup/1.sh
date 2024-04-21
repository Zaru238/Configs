#!/bin/sh

CONFIGS_DIR="~/projects/Configs"

# Install openssh
sudo pacman -S openssh

#install yay
mkdir -p ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install alacritty
yay -S compton ttf-hack-nerd alacritty
cp  $CONFIGS_DIR/alacritty/.alacritty.toml ~/

#install video staff & i3
yay -S mesa xorg noto-fonts i3

#install staff needed for i3

#install i3-blocks
yay -S i3blocks-contrib xkblayout-state
cp -r $CONFIGS_DIR/i3/.config/* ~/.config

mkdir ~/bin
yay -S i3lock-fancy xss-lock
cp $CONFIGS_DIR/i3/lock.sh ~/bin

# Install enable clipboard manager
yay -S rofi rofi-greenclip

sudo systemctl enable greenclip.service
sudo systemctl start greenclip.service

# Copy rofi config
mkdir ~/.config/rofi
cp $CONFIGS_DIR/rofi/config.rasi ~/.config/rofi


#TODO put an wallpaper to config repo and copy it

#copy xsession config
cp $CONFIGS_DIR/X11/.xsession ~/

#install zsh and staff
yay -S zsh oh-my-zsh-git xclip ttf-symbola
#copy zsh configs
cp $CONFIGS_DIR/zsh/.zshrc ~/
cp $CONFIGS_DIR/zsh/.zshenv ~/
#TODO set zsh as default shell

#install nnn
yay -S nnn

#install file picker
yay -S mimeo xdg-utils-mimeo
cp $CONFIGS_DIR/mimeo/mimeapps.list ~/.config

#install qutebroswer
yay -S qutebroswer
#copy config & speedup script
cp $CONFIGS_DIR/qutebrowser/qutebrowser ~/bin
mkdir -p ~/.config/qutebrowser
cp $CONFIGS_DIR/qutebrowser/config.py ~/.config/qutebrowser

#install audio system
yay -S pulseaudio
# TODO unmute channels

#install & setup nvim
yay -S neovim ripgrep python-pynvim python-pytest clang python-jedi bash-language-server nodejs yarn neovim-coc-clangd-git
$CONFIGS_DIR/nvim/init.sh

# install extra staff
yay -S libreoffice-still mupdf

# install display manager
yay -S ly
sudo systemctl enable ly.service

# install gef
yay -S gef-git xdotool
sudo pip install keystone-engine ropper unicorn capstone keystone-engine
cp $CONFIGS_DIR/gef/.gdbinit ~/
