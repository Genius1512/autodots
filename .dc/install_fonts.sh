#!/bin/bash
if ! [[ -d "fonts/" ]];
then
    exit
fi

mkdir $HOME/.fonts
cp ./fonts/* $HOME/.fonts/
fc-cache

