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

distro=$(cat /etc/os-release | tr [:upper:] [:lower:] | grep -Poi '(ubuntu|fedora|arch)' | uniq)
declare -A pkgmgr=(
    [ubuntu]="apt-get install -y build-essential ninja-build gettext cmake unzip curl git"
    [arch]="pacman -S --noconfirm ninja-build cmake gcc make unzip gettext curl git"
    [fedora]="dnf install -y base-devel cmake unzip ninja curl git"
)
install=${pkgmgr[$distro]}
printf "$install \n"

printf "[\033[32m?\033[0m] Do you have \033[34mNeovim\033[0m[\033[32m>=v0.7.0\033[0m] installed? [y/N] > "
read -r nvim_installed
case "$nvim_installed" in
    [yY][eE][sS]|[yY])
        ;;
    *)
        clear
	    printf "[\033[32m+\033[0m] Installing Neovim prerequisites...\n\n"
        sudo $install

        clear
        printf "[\033[32m+\033[0m] Cloning Repository...\n\n"
        # Clone neovim repo
        git clone https://github.com/neovim/neovim
        cd neovim
        printf "[\033[32m+\033[0m] Compiling Neovim...\n\n"
        make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc) -s # > /dev/null 2>&1
        if [$? -ne 0]; then
            printf "[\033[31mx\033[0m] Compiling Neovim failed...exiting\n"
            exit 0
        fi

        # printf "[\033[32m+\033[0m]\033[32m Done\033[0m\n"
        printf "[\033[32m+\033[0m] Installing...\n"
	    sudo make install -j$(nproc)
	    cd ..
	    rm -rf neovim
        printf "\033[32mOk\033[0m\n"
        ;;
esac

# Install packer.nvim as a plugin manager for neovim
clear
printf "[\033[32m+\033[0m] Installing Neovim Config..."
printf "\033[32mOk\033[0m\n"

cp -r $cwd/nvim /home/$USER/.config/

printf "\n\n\033[32mConfig files written into:\n"
printf " ==> \033[31m~/.config/nvim\n\n"
