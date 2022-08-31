#!/bin/bash
SCRIPT_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
ROOT="$SCRIPT_DIR/.."

sudo pacman -Syu --noconfirm

# Install deps
sudo pacman -S base-devel wget --noconfirm --needed

if ! [ -x "$(command -v yay)" ]
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Call scripts
if [[ -f $ROOT/preinstall.sh ]]
then
    chmod +x $ROOT/preinstall.sh
    $ROOT/preinstall.sh
fi

$SCRIPT_DIR/pkgs_install.sh $ROOT
$SCRIPT_DIR/fonts_install.sh $ROOT
$SCRIPT_DIR/cfgs_copy.sh $ROOT
$SCRIPT_DIR/wallpapers_copy.sh $ROOT

if [[ -f $ROOT/postinstall.sh ]]
then
    chmod +x $ROOT/postinstall.sh
    $ROOT/postinstall.sh
fi


