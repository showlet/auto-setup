COLOR='\033[1;36m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Updating..."
sudo apt-get update

cprint "Adding base deps..."
sudo apt-get install software-properties-common python-software-properties -y --allow-unauthenticated

cprint "Performing base add-apt"
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

cprint "Updating..."
sudo apt-get update

cprint "Adding additionnal deps..."
sudo apt-get install git autoconf automake libtool make gcc g++ \
     libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils build-essential \
     libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip terminator \
     firefox -y --allow-unauthenticated

cprint "Adding vscode..."
sudo apt-get install code -y --allow-unauthenticated

cprint "Installing nodejs..."
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

cprint "Installing Haskell stack..."
wget -qO- https://get.haskellstack.org/ | sh

cprint "Installing Elm..."
npm install -g elm

cprint "Installing JDK"
sudo apt-get install openjdk-8-jdk