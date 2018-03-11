# enable utf8 unicode
sudo locale-gen "en_US.UTF-8";
sudo dpkg-reconfigure locales
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

sudo cp ../config/bash/.bash_ps1 ~/;
yes | sudo cp -rf config/bash/.bash_ps1 ~/;
echo ". ~/.bash_ps1" >> ~/.bashrc;
. ~/.bash_ps1;
