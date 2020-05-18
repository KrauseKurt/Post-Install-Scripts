#!/usr/bin/env bash

## New folders to be used for .deb downloads and github repository plus any folder you need because you want to
mkdir "/home/$USER/Repo"

DOWNLOAD_DIR="/home/$USER/Downloads"
REPO_DIR="/home/$USER/Repo"
APPIMG_DIR="/home/$USER/Appimgs"

## Remove apt locks if any
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Repository update
sudo apt update -y

# Instalall apt`s
sudo apt install git guake steam lutris vlc snapd flatpak htop neofetch virtualbox tilix speedtest-cli mongodb zsh fonts-powerline curl wget gnome-tweaks apt-transport-https gnome-session libgtk-3-dev git meson sassc inkscape optipng ruby -y

## Install flatpaks
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub net.runelite.RuneLite -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.unity.UnityHub -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.kde.krita -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.axosoft.GitKraken -y
flatpak install flathub com.jagex.RuneScape -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub com.github.debauchee.barrier -y
flatpak install flathub com.anydesk.Anydesk -y
flatpak install flathub org.audacityteam.Audacity -y
flatpak install flathub org.gnome.meld -y
flatpak install flathub com.basemark.BasemarkGPU -y

## Install snaps
sudo snap install code --classic
sudo snap install postman
sudo snap install atom --classic
sudo snap install android-studio --classic
sudo snap install node --channel=14/stable --classic
sudo snap install dotnet-sdk --classic
sudo snap install snapcraft --classic
sudo snap install rider --classic
sudo snap install datagrip --classic
sudo snap install webstorm --classic
sudo snap install pycharm-professional --classic
#sudo snap install pycharm-community --classic
sudo snap install aws-cli --classic
sudo snap install dwarf-fortress
sudo snap install openosrs 

## Post-install update and cleanup
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
