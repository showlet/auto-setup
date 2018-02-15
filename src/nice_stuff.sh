COLOR='\033[1;32m'
NC='\033[0m'
DIR="wallpapers"

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

setwallpaper() {
  xfconf-query -c xfce4-desktop \
  -p /backdrop/screen0/monitor0/workspace0/last-image \
  -s "$1"
}

if [ ! -e ~/$DIR ]; then
    mkdir ~/$DIR
fi

sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-619056.jpg -O ~/$DIR/wallpaper1.jpg
sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-616505.jpg -O ~/$DIR/wallpaper2.jpg
sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-618670.jpg -O ~/$DIR/wallpaper3.jpg
 
# Choose wich wallpaper to display
setwallpaper ~/$DIR/wallpaper2.jpg