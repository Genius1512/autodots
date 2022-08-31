#!/bin/bash
ROOT=$1

if ! [[ -d $ROOT/cfgs  ]]
then
    exit
fi

config_files=( $(ls $ROOT/cfgs) )
rcs=( "bashrc", "xinitrc", "bash_profile", "bash_completion" )

mkdir -p $HOME/.config

for config in "${config_files[@]}"
do
    if [[ -f cfgs/$config ]]
    then
        if printf '%s\n' "${rcs[@]}" | grep -q -P $config
        then
            cp cfgs/$config $HOME/.$config
        else
            echo "$config is not a valid rc"
        fi
    else
        cp -r cfgs/$config $HOME/.config/$config
    fi
done

