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

## Remove apt locks if any
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Repository update
sudo apt update -y

## EXEC

## Update repository after 3rd-party repos have been added
sudo apt update -y

# Instalall apt`s
sudo apt get git tilix guake tlp tlp-rdw snapd htop neofetch virtualbox tilix inkscape vlc krita gimp speedtest-cli mongodb zsh fonts-powerline curl gnome-tweaks apt-transport-https -y

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
sudo snap install runelite
sudo snap install dwarf-fortress
sudo snap install openosrs 
sudo snap install obs-studio


## Manual instalations

# Unity
wget -c "$URL_UNITY" -P "$APPIMG_DIR"

## Post-install update and cleanup
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
