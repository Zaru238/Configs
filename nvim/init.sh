#!/bin/bash

set -e

ConfigDirectory=$HOME/.config/nvim

mkdir -p $ConfigDirectory

cp init.vim $ConfigDirectory

# setup solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git
cp -r vim-colors-solarized/colors $ConfigDirectory
rm -rf vim-colors-solarized

# copy coc config file
cp -r coc-settings.json $ConfigDirectory

#Install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ":PlugInstall | qa"

echo "Done"
