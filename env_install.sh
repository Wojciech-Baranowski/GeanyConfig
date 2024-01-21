#!/bin/bash

sudo apt-get install -y g++
sudo apt-get install -y git
sudo apt-get install -y geany
sudo apt-get install -y wmctrl
sudo apt-get install -y xdotool

#geany config:

USERNAME=$(whoami)
CONFIG_FILE="/home/$USERNAME/.config/geany/geany.conf"
KEYBINDINGS_FILE="/home/$USERNAME/.config/geany/keybindings.conf"
COLOR_SCHEMES_FILE="/home/$USERNAME/.config/geany/colorschemes/bespin.conf"
FILETYPES_FILE="/home/$USERNAME/.config/geany/filedefs/filetypes.cpp"
TEMPLATE_FILE="/home/$USERNAME/.config/geany/templates/files/template.cpp"
BASHRC_FILE="/home/$USERNAME/.bashrc"

geany &
GEANY_PID=$!
sleep 1
kill -9 $GEANY_PID

mkdir $(dirname $FILETYPES_FILE)
mkdir $(dirname $COLOR_SCHEMES_FILE)

curl -o $CONFIG_FILE "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/geany.conf"
curl -o $KEYBINDINGS_FILE "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/keybindings.conf"
curl -o $COLOR_SCHEMES_FILE "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/bespin.conf"
curl -o $FILETYPES_FILE "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/filetypes.cpp"
curl -o $TEMPLATE_FILE "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/template.cpp"

#shell settings:

sed -i '/force_color_prompt=/c\force_color_prompt=yes' $BASHRC_FILE
if ! grep -q "ulimit" $BASHRC_FILE; then
	echo -e "\nulimit -s 2000311" >> $BASHRC_FILE
	source $BASHRC_FILE
fi

 

