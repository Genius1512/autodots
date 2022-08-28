#!/bin/bash
if ! [[ -d "pkgs/" ]];
then
    exit
fi

install_files=($(ls pkgs/))

for install in "${install_files[@]}"
do
    if [[ $install == *_PACMAN ]]
    then
        sudo pacman -S $(cat "pkgs/$install") --noconfirm
    elif [[ $install == *_YAY ]]
    then
        yay -S $(cat "pkgs/$install") --noconfirm
    elif [[ $install == *_EXEC* ]]
    then
        "pkgs/$install"
    elif [[ $install == *_AUR ]]
    then
        git clone $(cat "pkgs/$install") install
        cd install
        makepkg -si --noconfirm
        cd ..
        rm -rf install
    else
        echo "No installation method for 'pkgs/$install'"
    fi
done
