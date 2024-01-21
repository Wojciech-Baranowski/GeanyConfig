#!/bin/bash

sudo apt-get install -y g++
sudo apt-get install -y git
sudo apt-get install -y geany
sudo apt-get install -y wmctrl
sudo apt-get install -y xdotool

#geany config:

USERNAME=$(whoami)
KEYBINDINGS_FILE="/home/$USERNAME/.config/geany/keybindings.conf"
CONFIG_FILE="/home/$USERNAME/.config/geany/geany.conf"
FILETYPES_FILE="/home/$USERNAME/.config/geany/filedefs/filetypes.cpp"
BASHRC_FILE="/home/$USERNAME/.bashrc"
COLOR_SCHEMES_DIR="/home/$USERNAME/.config/geany/colorschemes"
COLOR_SCHEMES_FILE="/home/$USERNAME/.config/geany/colorschemes/bespin.conf"

#color scheme
mkdir dirname $(COLOR_SCHEMES)
curl -o $COLOR_SCHEMES_FILE "https://raw.githubusercontent.com/geany/geany-themes/master/colorschemes/bespin.conf"

#shell settings
sed -i '/force_color_prompt=/c\force_color_prompt=yes' $BASHRC_FILE
if ! grep -q "ulimit" $BASHRC_FILE; then
	echo -e "\nulimit -s 2000311" >> $BASHRC_FILE
	source $BASHRC_FILE
fi

 

