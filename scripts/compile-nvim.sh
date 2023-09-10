#!/bin/bash

# Neovim compilation script.
# 1. Install the prerequisites based on the distribution
# 2. Clones the Neovim Github repository
# 3. Compiles and installes Neovim
#
source $(dirname "$0")/colors.sh

distro=$(cat /etc/os-release | tr [:upper:] [:lower:] | grep -Poi '(ubuntu|fedora|arch)' | uniq)
declare -A pkgmgr=(
    [ubuntu]="apt-get install -y build-essential ninja-build gettext cmake unzip curl git"
    [arch]="pacman -S --noconfirm ninja-build cmake gcc make unzip gettext curl git"
    [fedora]="dnf install -y base-devel cmake unzip ninja curl git"
)
install=${pkgmgr[$distro]}

printf "[$GREEN+$CLEAR] Installing Neovim prerequisites...\n\n"
sudo $install
sleep 2

clear
printf "[$GREEN+$CLEAR] Cloning Repository...\n\n"
# Clone neovim repo
git clone https://github.com/neovim/neovim
cd neovim
# Compile Neovim
printf "[$GREEN+$CLEAR] Compiling Neovim...\n\n"
make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc)  > /dev/null 2>&1
# Exit if build fails
if [$? -ne 0]; then
    printf "[$(RED)x$CLEAR] Compiling Neovim failed...exiting\n"
    cd ..
    rm -rf neovim
    exit 0
fi

printf "[$GREEN+$CLEAR] Installing...\n"
sudo make install -j$(nproc)
cd ..
rm -rf neovim
printf "$(GREEN)Ok$CLEAR\n"
sleep 2
