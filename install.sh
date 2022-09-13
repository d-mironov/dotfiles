#!/bin/sh

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
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
        ;;
esac

# # Install packer.nvim as a plugin manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# 
git clone https://github.com/moonxraccoon/dotfiles /home/$USER/Downloads/
cd /home/$USER/dotfiles
cp -r ./nvim /home/$USER/.config/

printf "[\033[32m+\033[0m] Installing Neovim plugins...\n"
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
printf "[\033[32m+\033[0m] Done!\n"

printf "Now open Neovim by running \033[32mnvim\033[0m and install the Plugins by runnning \033[32m:PackerInstall\033[0m.\n"
printf "Not all packages might install at first, so when most of the packages are finished just restart Neovim and run \033[32m:PackerInstall\033[0m again.\n"
printf "Then all plugins should be installed.\n"
printf "You config files are written in \033[32m~/.config/nvim/\033[0m. There you can find the \033[32minit.lua\033[0m where you can select the theme by uncommenting a line in the Themes section."

