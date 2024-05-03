# 1. Upgrade the system (sudo apt upgrade)
# 2. Install all necessary tools
# - wget, curl, git, fish, exa, kitty, nala
# 3. Import ssh keys
# 4. Get dotfiles and execute install.sh script
# 5. 
clear

source $(dirname "$0")/colors.sh

distro=$(cat /etc/os-release | tr [:upper:] [:lower:] | grep -Poi '(ubuntu|fedora|arch)' | uniq)
case $distro in
    "arch"|"fedora")
        printf "[$(RED)x$CLEAR] This only works on Ubuntu so far."
        exit 1
        ;;
esac

# First full system upgrade
printf "[$GREEN+$CLEAR] Doing system upgrade...\n"
sudo apt-get upgrade -y
sleep 2

# Install Nala
printf "[$GREEN+$CLEAR] Installing Nala...\n"
sudo apt-get install nala -y
sleep 2

# Adding VSCode keyring
printf "[$GREEN+$CLEAR] Installing Visual Studio Code\n"
printf "    Importing Keys\n"
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
sleep 2

# Add sources for VSCode
printf "    Adding sources\n"
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sleep 1
printf "    Installing...\n"
sleep 2

# Install VSCode
sudo nala update
sudo nala install -y code
sleep 2

printf "[$GREEN+$CLEAR] Installing essential packages\n"
sudo nala install -y build-essential cmake wget curl git unzip kitty fish exa gnome-software ripgrep libstdc++-12-dev
sleep 2

printf "[$GREEN+$CLEAR] Installing Go\n"
sudo nala install -y golang
sleep 2

printf "[$GREEN+$CLEAR] Installing Python3 packages\n"
sudo nala install -y python3-ipykernel python3-numpy python3-matplotlib python3-scipy python3-wheel python3-pandas python3-sklearn python3-pynvim python-is-python3
sleep 2

printf "[$GREEN+$CLEAR] Installing ARM toolchain\n"
sudo nala install -y binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-dev libstdc++-arm-none-eabi-newlib libstdc++-arm-none-eabi-picolibc picolibc-arm-none-eabi stlink-tools stlink-gui libstlink-dev
sleep 2

printf "[$GREEN+$CLEAR] Installing Syncthing\n"
sudo nala install -y syncthing
sudo cp systemd/syncthing@.service /etc/systemd/system/
sudo systemctl enable --now syncthing@$USER


printf "[$GREEN+$CLEAR] Setting up Flatpak and Flathub\n"
sudo nala install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sleep 2

printf "[$GREEN+$CLEAR] Installing Cargo and Rust\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sleep 2

printf "[$GREEN+$CLEAR] Setting up $(GREEN)git$CLEAR"
git config --global user.email "mail@danielmironov.dev"
git config --global user.name "Daniel Mironov"
sleep 2

printf "[$GREEN+$CLEAR] Installing and setting up $(GREEN)zoxide$CLEAR\n"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
sleep 2

printf "[$GREEN+$CLEAR] Installing fonts"
sudo cp fonts/* /usr/local/share/fonts/ && sudo fc-cache -fv
sleep 2


printf "[$GREEN+$CLEAR] Setting $(BLUE)fish$CLEAR to default shell\n"
printf "    You may need to enter your sudo password\n"
chsh -s /usr/bin/fish
sudo chsh -s /usr/bin/fish
sleep 2

printf "[$GREEN+$CLEAR] Installing kitty configuration...\n"
cp -r config/kitty /home/$USER/.config
sleep 2


# printf "[$GREEN+$CLEAR] Setting up $(BLUE)fish$CLEAR\n"
# fish
# alias ls="exa -lgh" && funcsave ls
# alias la="exa -lgha" && funcsave la

printf "\n\n[$RED!$CLEAR] You need to restart your computer to complete the setup\n"
