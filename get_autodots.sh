#!/bin/bash
sudo pacman -S wget --noconfirm --needed

wget https://raw.githubusercontent.com/Genius1512/autodots/main/install.sh -O install.sh
chmod +x install.sh

mkdir .ad
cd .ad
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/copy_cfgs.sh -O copy_cfgs.sh
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/install_fonts.sh -O install_fonts.sh
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/install_pkgs.sh -O install_pkgs.sh
wget https://raw.githubusercontent.com/Genius1512/autodots/main/.ad/copy_wallpapers.sh -O copy_wallpapers.sh
chmod +x *
cd ..

