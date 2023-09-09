#!/bin/bash

source ./scripts/colors.sh

clear
printf "$BLUE"
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
printf "$RED"
sleep 0.1
printf "                     by moonraccoon\n\n\n"
sleep 0.1
printf "$CLEAR"

cwd=$(pwd)

printf "[$GREEN?$CLEAR] Do you want to do a whole system setup? [yes|no] > "
read -r answer
case $answer in
    [yY][eE][sS]|[yY])
        clear
        ./scripts/compile-nvim.sh
        printf "[$GREEN+$CLEAR] Installing Neovim config in /home/$USER/.config/nvim\n"
        cp -r ./nvim /home/$USER/.config

        ./scripts/full-setup.sh
        ;;
    [nN][oO]|[nN])
        printf "[$GREEN?$CLEAR] Do you want to compile latest \033[34mNeovim\033[0m? [yes|no] > "
        read -r answer
        case $answer in
            [yY][eE][sS]|[yY])
                ./scripts/compile-nvim.sh
                ;;
        esac
        cd $cwd
        
        printf "[$GREEN?$CLEAR] Do you want to install the nvim config? [yes|no] > "
        read -r answer
        case $answer in
            [yY][eE][sS]|[yY])
                cp -r ./nvim /home/$USER/.config
        esac
        ;;
esac
