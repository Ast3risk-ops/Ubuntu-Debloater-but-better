#!/bin/bash
clear
echo ===============================================================================
echo "SteavenToolbox 0.1 | We care about your pc!" "Ubuntu 22.04 and Ubuntu 22.10!"
echo ===============================================================================
echo "1. Update Ubuntu"
echo "2. Install Needed Ubuntu Apps"
echo "3. Replace Snap Store with Gnome Software"
echo "0. Exit"
read -p "Type the number." ANSWER

if [ $ANSWER == "1" ]; then
clear
echo "Updating Ubuntu cache"
sudo apt update
echo "Updating Ubuntu Apt Packages"
sudo apt upgrade -y
echo "Updating Ubuntu Snaps"
sudo snap refresh
echo "Updating Ubuntu Flatpaks"
sudo flatpak update -y
fi

if [ $ANSWER == "2" ]; then
clear
echo "Installing Video Codecs and Vlc"
sudo apt install ubuntu-restricted-extras vlc -y
fi

if [ $ANSWER == "3" ]; then
echo "Removing Snap store"
sudo snap remove snap-store
echo "Installing and Configuring Flatpak"
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Installing Gnome Software"
sudo apt install gnome-software gnome-software-plugin-snap gnome-software-plugin-flatpak -y

else
  echo "Quitting..."
fi