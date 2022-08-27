#!/bin/bash

config_files=($(ls cfgs/))

for config in "${config_files[@]}"
do
    if [[ $config == "bashrc" ]]
    then
        cp cfgs/bashrc $HOME/.bashrc
    elif [[ config == "xinitrc" ]]
    then
        cp "cfgs/xinitrc" $HOME/.xinitrc
    else
        cp -r "cfgs/$config/" $HOME/.config/$config
    fi
done
