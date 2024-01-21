#!/bin/bash

sudo apt-get install -y g++
sudo apt-get install -y git
sudo apt-get install -y geany

#geany config:

USERNAME=$(whoami)
CONFIG_DIR="/home/$USERNAME/.config/geany"
BASHRC_FILE="/home/$USERNAME/.bashrc"

mkdir $CONFIG_DIR
mkdir $CONFIG_DIR/colorschemes
mkdir $CONFIG_DIR/filedefs
mkdir -p $CONFIG_DIR/templates/files

curl -o "$CONFIG_DIR/geany.conf" "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/geany.conf"
curl -o "$CONFIG_DIR/keybindings.conf" "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/keybindings.conf"
curl -o "$CONFIG_DIR/colorschemes/bespin.conf" "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/bespin.conf"
curl -o "$CONFIG_DIR/filedefs/filetypes.cpp" "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/filetypes.cpp"
curl -o "$CONFIG_DIR/templates/files/template.cpp" "https://raw.githubusercontent.com/Wojciech-Baranowski/GeanyConfig/main/template.cpp"

#shell config:

sed -i '/force_color_prompt=/c\force_color_prompt=yes' $BASHRC_FILE
if ! grep -q "ulimit" $BASHRC_FILE; then
	echo -e "\nulimit -s 2000311" >> $BASHRC_FILE
	source $BASHRC_FILE
fi

