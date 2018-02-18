COLOR='\033[0;34m'
NC='\033[0m'
DIR="wallpapers"

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

setwallpaper() {
    wallpaper=$1
    workspaces=3
    for i in `seq 0 $workspaces`
    do
        xfconf-query -c xfce4-desktop \
        -p /backdrop/screen0/monitor0/workspace$i/last-image \
        -s "$wallpaper"
        cprint "Set wallpaper on workspace $i"
    done
}

if [ ! -e ~/$DIR ]; then
    mkdir ~/$DIR
fi

#sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-619056.jpg -O ~/$DIR/wallpaper1.jpg
sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-616505.jpg -O ~/$DIR/wallpaper2.jpg
#sudo wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-618670.jpg -O ~/$DIR/wallpaper3.jpg
 
# Choose wich wallpaper to display
setwallpaper ~/$DIR/wallpaper2.jpg

cprint "Done."
