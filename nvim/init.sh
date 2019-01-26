#!/bin/bash

set -e

ConfigDirectory=$HOME/.config/nvim
PluginDirectory=$ConfigDirectory/pack/bundle/start

mkdir -p $ConfigDirectory

cp init.vim $ConfigDirectory

# setup solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git
cp -r vim-colors-solarized/colors $ConfigDirectory
rm -rf vim-colors-solarized

#download plugins
rm -rf $PluginDirectory
mkdir -p $PluginDirectory
cd $PluginDirectory
git clone https://github.com/Zaru238/VimPlugins.git .
git submodule update --init --recursive

echo "Done"
