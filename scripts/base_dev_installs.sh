COLOR='\033[1;36m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Updating..."
sudo apt-get update
sudo apt-get upgrade

cprint "Adding base deps..."
sudo apt-get install software-properties-common python-software-properties -y --allow-unauthenticated

cprint "Performing base add-apt"
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

cprint "Updating..."
sudo apt-get update -y

cprint "Installing additionnal deps..."
sudo apt-get install firefox git autoconf automake libtool make gcc g++ \
     libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils build-essential \
     libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
     -y --allow-unauthenticated

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev  \
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3  \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev  \
    libffi-dev \
     -y --allow-unauthenticated


cprint "Getting last versions of node and yarn..."
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update

cprint "Installing node, yarn, ruby, java..."
sudo apt-get install nodejs yarn ruby-full \
    openjdk-8-jdk \
    -y --allow-unauthenticated
gem install rails

cprint "NodeJS post installation..."
sudo chown -R $(whoami) ~/.npm

if [ -e /usr/lib/node_modules ]
then
    sudo chown -R $(whoami) /usr/lib/node_modules
else
    sudo chown -R $(whoami) /usr/local/lib/node_modules
fi

cprint "Installing mongodb..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated

cprint "Installing Haskell stack..."
wget -qO- https://get.haskellstack.org/ | sh

cprint "Installing Elm..."
sudo npm install -g elm

cprint "Base dev install task complete..."