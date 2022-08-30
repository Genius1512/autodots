#!/bin/bash

if ! [[ -d "wallpapers/" ]];
then
    exit
fi

mkdir -p $HOME/Pictures/Wallpapers/

cp wallpapers/* $HOME/Pictures/Wallpapers/

