#!/bin/bash

#########################
# Install dependencies ##
#########################
sudo pacman -S git base-devel wget --noconfirm

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

./.ad/install_pkgs.sh
./.ad/copy_cfgs.sh
./.ad/install_fonts.sh

if test -f "./post_install.sh"; then
    chmod +x ./post_install.sh
    ./post_install.sh
fi

###########
# Cleanup #
###########
