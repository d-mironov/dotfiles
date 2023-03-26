#!/bin/sh

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
printf "                     by moonraccoon\n\n\n"
sleep 0.1
printf "\033[0m"
                                   
                                   

cwd=$(pwd)
printf "[\033[32m?\033[0m] Do you have \033[34mNeovim\033[0m[\033[32m>=v0.7.0\033[0m] installed? [y/N] > "
read -r nvim_installed
case "$nvim_installed" in
    [yY][eE][sS]|[yY])
        ;;
    *)
	    printf "[\033[32m+\033[0m] Installing Neovim prerequisites...\n"
        if [ "$(grep -Ei 'Ubuntu|Debian' /etc/*release)" ]; then
            sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen build-essential -qq
        elif [ "$(grep -Ei 'Fedora|Red Hat' /etc/*release)" ]; then
	    sudo dnf -y install ninja-build libtool cmake gcc gcc-c++ make pkgconfig unzip gettext curl
        elif [ "$(grep -Ei 'Arch' /etc/*release)" ]; then
            sudo pacman -S ninja gettext libtool autoconf automake cmake make g++ pkg-config unzip curl doxygen base-devel --noconfirm
        fi

        printf "[\033[32m+\033[0m] Compiling latest Neovim...\n"
        # Clone neovim repo
        git clone https://github.com/neovim/neovim
        cd neovim
        make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc)# > /dev/null 2>1&
        printf "[\033[32m+\033[0m]\033[32m Done\033[0m\n"
        printf "[\033[32m+\033[0m] Installing...\n"
	    sudo make install -j$(nproc) # > /dev/null 2>1&
	    cd ..
	    rm -R -f neovim
        printf "\033[32mOk\033[0m\n"
        ;;
esac

# # Install packer.nvim as a plugin manager for neovim
printf "[\033[32m+\033[0m] Installing Plugin Manager..."
printf "\033[32mOk\033[0m\n"
sudo -u $SUDO_USER git clone --depth 1 https://github.com/wbthomason/packer.nvim /home/$SUDO_USER/.local/share/nvim/site/pack/packer/start/packer.nvim
# 
sudo -u $SUDO_USER cp -r $cwd/nvim /home/$SUDO_USER/.config/

printf "[\033[32m+\033[0m] Installing Neovim plugins..."
sudo -u $SUDO_USER nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" > /dev/null 2>&1
printf "\033[32mOk\033[0m\n"

printf "\n\n\033[32mConfig files written into:\n"
printf " ==> \033[31m~/.config/nvim\n\n"
printf "\033[32mThere you can select the color-scheme you want to use by uncommenting the line like so:\n\033[34m"
printf "  \033[0mvim\033[31m.\033[34mcmd \033[32m[[\n"
printf '      \033[35mcolorscheme \033[32mgruvbox-flat  <-- This theme will be used\n'
printf '      \033[36m"colorscheme everforest\n'
printf '      "colorscheme base16-material-darker\n'
printf '      "colorscheme minimal-base16\n'
printf '      "colorscheme gruvbox-material\n'
printf '      "colorscheme onedarkpro\n'
printf "  \033[32m]]\n\033[0m"

printf "[\033[32m?\033[0m] Do you want to install kitty as your terminal? [y/N] > "
read -r install_kitty
case "$install_kitty" in
    [yY][eE][sS]|[yY])
        printf "[\033[32m+\033[0m] Installing kitty..."
        sudo apt install kitty > /dev/null
        printf "\033[32mOk\033[0m\n"
        ;;
    *)
        ;;
esac

printf "\033[0m"
