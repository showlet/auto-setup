# enable utf8 unicode
sudo locale-gen "en_US.UTF-8";
sudo dpkg-reconfigure locales
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

sudo cp ../config/bash/.bash_ps1 ~/;
yes | cp -rf config/bash/.bash_ps1 ~/;
echo "source ~/.bash_ps1" >> ~/.bashrc;
source ~/.bash_ps1;
