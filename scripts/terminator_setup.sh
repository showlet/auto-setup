COLOR='\033[1;36m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cpsuccess() {
    TEXT=$1
    printf "\n${GREEN}${TEXT}${NC}\n"
}

cperror() {
    TEXT=$1
    printf "\n${RED}${TEXT}${NC}\n"
}

cprint "Installing terminator..."
sudo apt-get install terminator -y --allow-unauthenticated

cprint "configuring terminator..."
if [ ! -e ~/.config/terminator/ ]
then
	mkdir ~/.config/terminator
fi

sudo cp ../config/terminator/config ~/.config/terminator/config
yes | cp -rf config/terminator/config ~/.config/terminator/config

if [ -e ~/.config/terminator/config ]
then
    cpsuccess "configured terminator with success."
else
    cperror "Something went wrong with the configuration >:("
fi

cprint "Finished terminator setup."
