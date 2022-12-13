#!/bin/bash
echo "This script will Replace Firefox snap with deb, replace snap store with gnome software, install nala and git and gnome tweaks and gnome exettions, and disable apport and install flatpak"
read -p "THE AUTHOR IS NOT RESPONSIBLE FOR ANY DAMAGE, continue? [y/n] " ANSWER
if [ $ANSWER == "y" ]; then

# nala
sudo apt install nala -y

# installing git
sudo  apt install git -y

# Gnome Extensions
sudo nala install gnome-shell-extension-manager gnome-shell-extensions -y 

# Replace firefox snap with deb
sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa -y
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt update
sudo apt install firefox -y

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Installing Flatpak
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Replace Snap Store with Gnome Store
sudo snap remove snap-store
sudo apt install gnome-software gnome-software-plugin-snap gnome-software-plugin-flatpak -y

else
  echo "Quitting..."
fi