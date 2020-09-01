#!/bin/sh

# Install yay

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

#TODO put an wallpaper to config repo and copy it

#copy xsession config
cp ~/projects/Configs/X11/.xsession ~/

#install zsh and staff
yay -S zsh oh-my-zsh-git tmux xclip ttf-symbola
#copy zsh configs
cp ~/projects/Configs/zsh/.zshrc ~/
cp ~/projects/Configs/zsh/.zshenv ~/

#install nnn
