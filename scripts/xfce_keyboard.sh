COLOR='\033[1;33m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Configuring xfce4 keymap"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -n -t string -s "terminator"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/F2" -n -t string -s "right_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/F1" -n -t string -s "left_workspace_key"
