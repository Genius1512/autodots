#!/bin/bash

if ! [[ -d "cfgs/" ]];
then
    exit
fi

config_files=($(ls cfgs/))
rcs=("bashrc", "xinirc", "bash_profile")

mkdir $HOME/.config

for config in "${config_files[@]}"
do
    if [[ " ${rcs[*]} " =~ " ${config} " ]];
    then
        cp "cfgs/$config" "$HOME/.$config"
    else
        cp -r "cfgs/$config/" $HOME/.config/$config
    fi
done
