#!/bin/bash

set -e

ConfigDirectory=$HOME/.config/nvim

mkdir -p $ConfigDirectory

cp init.vim $ConfigDirectory

# setup solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git
cp -r vim-colors-solarized/colors $ConfigDirectory

echo "Done"
