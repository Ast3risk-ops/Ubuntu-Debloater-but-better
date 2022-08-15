#PPAS
echo "This script will add pop PPA's and will install vscode, thunderbird, lutris, gedit plugins, ubuntu proprietary drivers, gnome tweak tool and GNU spell"
read -p "THE AUTHOR IS NOT RESPONSIBLE FOR ANY DAMAGE, continue? [y/n] " ANSWER
if [ $ANSWER == "y" ]; then
  sudo add-apt-repository ppa:system76/pop
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt full-upgrade
  sudo apt install gnome-tweaks thunderbird lutris code ubuntu-restricted-extras nano neofetch gedit gedit-plugin-text-size gnome-tweaks spell -y
  sudo apt purge gnome-software -y
  sudo snap remove snap-store
else
  echo "Quitting..."
fi
