#!/bin/bash
wget https://raw.githubusercontent.com/Genius1512/autodots/main/install.sh
chmod +x install.sh

mkdir .ad
cd .ad

wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/copy_cfgs.sh
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/install_fonts.sh
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/install_pkgs.sh
chmod +x .ad/*

cd ..

