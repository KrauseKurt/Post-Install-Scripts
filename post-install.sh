#!/usr/bin/env bash

## New folders to be used for .deb downloads and github repository plus any folder you need because you want to
mkdir "/home/kurt/Downloads/postinstall"
mkdir "/home/kurt/Repo"
mkdir "/home/kurt/Appimgs"

URL_RUNELITE="https://github.com/runelite/launcher/releases/download/2.1.0/RuneLite.AppImage"
URL_UNITY="https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage"

DOWNLOAD_DIR="/home/kurt/Downloads/postinstall"
REPO_DIR="/home/kurt/Repo"
APPIMG_DIR="/home/kurt/Appimgs"

PROGRAM_LIST=(
  git
  tilix
  snapd
  htop
  neofetch
  virtualbox
  tilix
  inkscape
  vlc
  krita
  gimp
  speedtest-cli
  mongodb
  zsh
  fonts-powerline
  curl
  gnome-tweaks
  apt-transport-https
)

## Remove apt locks if any
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Repository update
sudo apt update -y

## EXEC

## Update repository after 3rd-party repos have been added
sudo apt update -y

## Install .deb's downloaded prevously
#sudo dpkg -i $DOWNLOAD_DIR/*.deb

# Instalar programas no apt
for pkg_name in ${PROGRAM_LIST[@]}; do
  if ! dpkg -l | grep -q $pkg_name; then
    apt install "$pkg_name" -y
  else
    echo "$pkg_name is already installed, skipping."
  fi
done

## Install flatpaks
#flatpak install flathub com.obsproject.Studio -y

## Install snaps
sudo snap install spotify
sudo snap install code --classic
sudo snap install postman
sudo snap install android-studio --classic
sudo snap install gitkraken
sudo snap install node --classic
sudo snap install dotnet-sdk --classic
sudo snap install snapcraft --classic
sudo snap install discord
sudo snap install rider --classic
sudo snap install datagrip --classic
sudo snap install webstorm --classic
sudo snap install pycharm-professional --classic
#sudo snap install pycharm-community --classic
sudo snap install aws-cli --classic

## Manual instalations
# Runelite
wget -c "$URL_RUNELITE" -P "$APPIMG_DIR"

# Brave
#curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
#echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#apt update
#apt install brave-browser -y

# Unity
wget -c "$URL_UNITY" -P "$APPIMG_DIR"
echo "Opening UnityHub"

#Anydesk
#wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
#echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
#apt update
#apt install anydesk -y

## Post-install update and cleanup
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
