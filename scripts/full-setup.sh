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

sleep 0.1
printf "[$GREEN+$CLEAR] Doing system upgrade...\n"
sleep 0.1
sudo apt-get upgrade -y

sleep 0.1
printf "[$GREEN+$CLEAR] Installing Nala...\n"
sleep 0.1
sudo apt-get install nala -y


