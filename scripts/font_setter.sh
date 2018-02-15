COLOR='\033[1;33m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Starting Font step..."

mkdir download_tmp

sudo wget https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip -O download_tmp/fonts.zip;
unzip download_tmp/fonts.zip -d ~/.local/share/fonts;
rm -rf download_tmp;

cprint "Font step complete."