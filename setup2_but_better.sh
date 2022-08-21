#PPAS
echo "This script will add pop repos, gnome-tweaks and remove gnome software and the snap store then reboot"
read -p "THE AUTHOR IS NOT RESPONSIBLE FOR ANY DAMAGE, continue? [y/n] " ANSWER
if [ $ANSWER == "y" ]; then
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 63C46DF0140D738961429F4E204DD8AEC33A7AFF
  sudo apt-key export C33A7AFF | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/pop-os-apps.gpg
  sudo add-apt-repository "deb http://apt.pop-os.org/proprietary $(lsb_release -cs) main"
  sudo apt update
  sudo apt full-upgrade
  sudo apt install gnome-tweaks -y
  sudo apt purge gnome-software -y
  sudo snap remove snap-store
  sudo reboot now
else
  echo "Quitting..."
fi
