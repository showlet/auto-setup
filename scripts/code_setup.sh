COLOR='\033[1;33m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Adding vscode..."
sudo apt-get install code -y --allow-unauthenticated

cprint "Configuring vscode..."
cp ../config/vscode/settings.json ~/.config/Code/User/settings.json

cprint "Completed vscode configuration."