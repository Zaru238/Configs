#!/bin/bash

set -e

ConfigDirectory=$HOME/.config/nvim
RelativeScriptDir=$(dirname "$0")

mkdir -p $ConfigDirectory

cp $RelativeScriptDir/init.vim $ConfigDirectory

# copy coc config file
cp -r coc-settings.json $ConfigDirectory

# install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ":PlugInstall | qa"

# setup coc-vim
nvim -c ":CocInstall coc-python | CocInstall coc-highlight | CocInstall coc-clangd | qa"

# update plugins for nvim-gdb
nvim -c ":UpdateRemotePlugins | qa"

echo "Done"
