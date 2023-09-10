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
sleep 1

# Add sources for VSCode
printf "    Adding sources\n"
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sleep 1
printf "    Installing...\n"

# Install VSCode
sudo nala update
sudo nala install -y code

printf "[$GREEN+$CLEAR] Installing necessary packages\n"
sudo nala install -y build-essential cmake wget curl git unzip kitty fish

printf "[$GREEN+$CLEAR] Setting $(BLUE)fish$CLEAR to default shell\n"
printf "    You may need to enter your sudo password\n"
chsh -s /usr/bin/fish
sudo chsh -s /usr/bin/fish
