#!/bin/bash
ROOT=$1

if ! [[ -d $ROOT/wallpapers/ ]]
then
    exit
fi

mkdir -p $HOME/Pictures/Wallpapers/

cp $ROOT/wallpapers/* $HOME/Pictures/Wallpapers/

