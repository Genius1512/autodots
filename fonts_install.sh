#!/bin/bash
ROOT=$1

if ! [[ -d $ROOT/fonts ]]
then
    exit
fi

sudo pacman -S font-config --noconfirm --needed

mkdir $HOME/.fonts
cp $ROOT/fonts/* $HOME/.fonts
fc-cache

