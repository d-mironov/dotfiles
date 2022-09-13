#!/bin/sh

cwd=$(pwd)
printf "[\033[32m?\033[0m] Do you have \033[32mnvim[>=v0.7.0]\033[0m installed? [y/n] > "
read -r nvim_installed
default_path = "/home/$USER/Downloads"
case "$nvim_installed" in
    [yY][eE][sS]|[yY])
        ;;
    *)
        printf "[\033[32m!\033[0m] Installing latest Neovim now...\n"
        # Install neovim prerequisites for building
        sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
        # Clone neovim repo
        git clone https://github.com/neovim/neovim /home/$USER/Downloads/neovim/
        cd ~/Downloads/neovim/
        make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc)
        sudo make install -j$(nproc)
        ;;
esac

# # Install packer.nvim as a plugin manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# 
cp -r $cwd/nvim /home/$USER/.config/

printf "[\033[32m+\033[0m] Installing Neovim plugins...\n"
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" > /dev/null
printf "\n[\033[32m+\033[0m] Done!\n"

printf "You config files are written in \033[32m~/.config/nvim/\033[0m. There you can find the \033[32minit.lua\033[0m where you can select the theme by uncommenting a line in the Themes section."

