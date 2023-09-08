#!/bin/bash

clear
printf "\033[34m"
printf "     _       _    __ _ _           \n"
sleep 0.1
printf "    | |     | |  / _(_) |          \n"
sleep 0.1
printf "  __| | ___ | |_| |_ _| | ___  ___ \n"
sleep 0.1
printf " / _  |/ _ \\| __|  _| | |/ _ \\/ __|\n"
sleep 0.1
printf "| (_| | (_) | |_| | | | |  __/\\__ \ \n"
sleep 0.1
printf " \\__,_|\\___/ \\__|_| |_|_|\\___||___/\n"
sleep 0.1
printf "\033[31m"
sleep 0.1
printf "                     by moonraccoon\n\n\n"
sleep 0.1
printf "\033[0m"

cwd=$(pwd)

printf "$install \n"

printf "[\033[32m?\033[0m] Do you want to compile latest \033[34mNeovim\033[0m? [y/N] > "
read -r answer
if [[ $answer == "y" || $answer == "yes" ]]; then
    # clear
    ./scripts/compile-nvim.sh
fi
cd $cwd

printf "[\033[32m?\033[0m] Do you want to install the nvim config? [y/N] > "
read -r answer
if [[ $answer == "y" || $answer == "yes" ]]; then
    # clear
    cp -r ./nvim /home/$USER/.config
fi


# clear
printf "[\033[32m+\033[0m] Installing Neovim Config..."
printf "\033[32mOk\033[0m\n"

cp -r $cwd/nvim /home/$USER/.config/

printf "\n\n\033[32mConfig files written into:\n"
printf " ==> \033[31m~/.config/nvim\n\n"
