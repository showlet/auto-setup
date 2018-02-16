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

cprint "Installing additionnal deps..."
sudo apt-get install git autoconf automake libtool make gcc g++ \
     libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils build-essential \
     libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
    git-core curl zlib1g-dev build-essential libssl-dev  \
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

cprint "Installing Haskell stack..."
wget -qO- https://get.haskellstack.org/ | sh

cprint "Installing Elm..."
npm install -g elm
