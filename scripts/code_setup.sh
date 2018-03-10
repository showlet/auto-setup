COLOR='\033[1;36m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cperror() {
    TEXT=$1
    printf "\n${RED}${TEXT}${NC}\n"
}

cpsuccess() {
    TEXT=$1
    printf "\n${GREEN}${TEXT}${NC}\n"
}


cprint "Adding vscode..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code -y --allow-unauthenticated

cprint "Installing extensions..."
code --install-extension kuscamara.electron
code --install-extension sbrink.elm
code --install-extension justusadam.language-haskell
code --install-extension vscodevim.vim
code --install-extension eamodio.gitlens 

cprint "Configuring vscode..."
mkdir ~/.config/Code
mkdir ~/.config/Code/User
cp ../config/vscode/settings.json ~/.config/Code/User/settings.json

if [ -e ~/.config/Code/User/settings.json ]
then
    cpsuccess "Configured vscode with success."
else
    cperror "Something went wrong with the installation"
fi

cprint "Completed vscode configuration."
