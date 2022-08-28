#!/bin/bash
if ! [[ -d "pkgs/" ]];
then
    exit
fi

install_files=($(ls pkgs/))

for install in "${install_files[@]}"
do
    if [[ $install == PACMAN ]]
    then
        for pkg in $(cat pkgs/$install)
        do
            sudo pacman -S $pkg --noconfirm --needed
        done
    elif [[ $install == YAY ]]
    then
        for pkg in $(cat pkgs/$install)
        do
            yay -S $pkg --noconfirm --needed
        done
    elif [[ $install == *_EXEC* ]]
    then
        chmod +x "pkgs/$install"
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
