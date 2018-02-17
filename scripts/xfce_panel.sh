###################
#
# This script modifies the "default panel" settings
# to set the default panel settings do the following
# it removes the configs then starts it, you will be prompted
# to chose the default settings or empty panel, chose default settings.
# i reccomend having java installed for the coffee cup icon
#
# xfce4-panel --quit;
# pkill xfconfd;
# rm -rf ~/.config/xfce4/panel;
# rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml;
# xfce4-panel;
#
###################
COLOR='\033[1;36m'
NC='\033[0m'

cprint() {
    TEXT=$1
    printf "\n${COLOR}${TEXT}${NC}\n"
}

cprint "Setting up xfce4 panel..."

# panels
xfconf-query -c xfce4-panel -p /panels/panel-1/background-alpha -n -t int -s 0
xfconf-query -c xfce4-panel -p /panels/panel-2/autohide -n -t bool -s true

# Applications button
xfconf-query -c xfce4-panel -p /plugins/plugin-1/button-icon -n -t string -s applications-java
xfconf-query -c xfce4-panel -p /plugins/plugin-1/button-title -n -t string -s ''
xfconf-query -c xfce4-panel -p /plugins/plugin-1/show-button-title -n -t bool -s false

# window buttons
xfconf-query -c xfce4-panel -p /plugins/plugin-3/show-handle -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-3/show-labels -n -t bool -s true
xfconf-query -c xfce4-panel -p /plugins/plugin-3/show-only-minimized -n -t bool -s true

#notification area
xfconf-query -c xfce4-panel -p /plugins/plugin-6/show-frame -n -t bool -s false

# separator
xfconf-query -c xfce4-panel -p /plugins/plugin-13/style -n -t int -s 1

cprint "Completed xfce4 panel setup, restarting panels."

xfce4-panel --restart

cprint "Done."
