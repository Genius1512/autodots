#!/bin/bash

#########################
# Install dependencies ##
#########################
sudo pacman -S git base-devel --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

##############
# Make files #
##############
mkdir $HOME/.local/
mkdir $HOME/.local/bin/
mkdir $HOME/.local/lib/
mkdir $HOME/.local/share/
mkdir $HOME/.local/share/applications/
mkdir $HOME/.local/share/icons/

################
# Call scripts #
################
if test -f "./pre_install.sh"; then
    chmod +x ./pre_install.sh
    ./pre_install.sh
fi

./.dc/install_pkgs.sh
./.dc/copy_cfgs.sh

if test -f "./post_install.sh"; then
    chmod +x ./post_install.sh
    ./post_install.sh
fi

###########
# Cleanup #
###########
