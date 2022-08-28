#!/bin/bash
if ! [[ -d "fonts/" ]];
then
    exit
fi

sudo pacman -S fontconfig --needed --noconfirm

mkdir -p $HOME/.fonts
cp ./fonts/* $HOME/.fonts/
fc-cache

