#!/bin/sh

# Install openssh
sudo pacman -S openssh

#install yay
mkdir -p ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install st
cp -r ~/projects/Configs/st ~/aur
cd ~/aur/st
makepkg -si
yay -S compton ttf-hack

#install video staff & i3
yay -S mesa xorg noto-fonts i3

#install staff needed for i3

#TODO put an wallpaper to config repo and copy it

#copy xsession config
cp ~/projects/Configs/X11/.xsession ~/

#install zsh and staff
yay -S zsh oh-my-zsh-git tmux xclip ttf-symbola
#copy zsh configs
cp ~/projects/Configs/zsh/.zshrc ~/
cp ~/projects/Configs/zsh/.zshenv ~/

#install nnn
yay -S nnn
# TODO install file picker

#install tmux
yay -S tmux
cp ~/projects/Configs/tmux/.tmux.conf ~/

#install qutebroswer
yay -S qutebroswer
#copy config & speedup script
cp ~/projects/Configs/qutebrowser/qutebrowser ~/bin
mkdir -p ~/.config/qutebrowser
cp ~/projects/Configs/qutebrowser/config.py ~/.config/qutebrowser

#install audio system
yay -S pulseaudio
# TODO unmute channels

#install & setup nvim
yay -S neovim ripgrep python-pynvim python-pytest clang python-jedi bash-language-server nodejs yarn
~/projects/Configs/nvim/init.sh

# install extra staff
yay -S libreoffice-still mupdf

# install display manager
yay -S ly
sudo systemctl enable ly.service

# install gef
yay -S gef-git xdotool
sudo pip install keystone-engine ropper unicorn capstone keystone-engine
cp ~/projects/Configs/gef/.gdbinit ~/
