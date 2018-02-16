COLOR='\033[1;36m'
RED='\033[1;31m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Installing terminator..."
sudo apt-get install terminator -y --allow-unauthenticated

cprint "configuring terminator..."
sudo cp ../config/terminator/config ~/.config/terminator/config
sudo cp /config/terminator/config ~/.config/terminator/config

if [ -e ~/.config/terminator/config ]
then
    cprint "configured terminator with success."
else
    printf "\n${RED}Something went wrong with the configuration${NC}\n"
fi

cprint "Finished terminator setup."
