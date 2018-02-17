COLOR='\033[1;36m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Setting up xfce4 theme..."
xfconf-query -c xsettings -p /Net/ThemeName -t string -s Xfce-dusk
xfconf-query -c xsettings -p /Net/IconThemeName -t string -s elementary-xfce-darker
xfconf-query -c xfwm4 -p /general/margin_bottom -n -t int -s 5  
xfconf-query -c xfwm4 -p /general/margin_left -n -t int -s 5  
xfconf-query -c xfwm4 -p /general/margin_right -n -t int -s 5  
xfconf-query -c xfwm4 -p /general/margin_top -n -t int -s 35  


cprint "Completed xfce4 theme setup."
