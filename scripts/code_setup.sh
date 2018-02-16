COLOR='\033[1;36m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Adding vscode..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install code -y --allow-unauthenticated

cprint "Installing extensions..."
code --install-extension kuscamara.electron
code --install-extension sbrink.elm
code --install-extension justusadam.language-haskell
code --install-extension vscodevim.vim
code --install-extension eamodio.gitlens 

cprint "Configuring vscode..."
cp ../config/vscode/settings.json ~/.config/Code/User/settings.json

cprint "Completed vscode configuration."
