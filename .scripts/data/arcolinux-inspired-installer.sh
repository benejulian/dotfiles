#!/bin/bash

### Part 1 ####################################################################
###############################################################################
set -e
# Update mirror list
mirror

# Update system & installed packages
sudo pacman -Syyu --noconfirm

# Install display manger (login manager)
sudo pacman -S --noconfirm --needed lightdm
# sudo pacman -S --no-confirm --needed lightdm-gtk-greeter?

# Install i3-gaps
if sudo pacman -Qi i3-wm &> /dev/null; then
	sudo pacman -R i3-wm --no-confirm
fi
sudo pacman -S --no-confirm --needed i3-gaps

# Install polybar
sudo pacman -S --no-confirm --needed polybar

# Enable display manager
# what's the -f? what's the 2nd line?
sudo systemctl enable lightdm.service -f
#sudo systemctl set-default graphical.target


### Part 2 ####################################################################
### Sound  ####################################################################

sudo pacman -S pulseaudio --noconfirm --needed
sudo pacman -S pulseaudio-alsa --noconfirm --needed
sudo pacman -S pavucontrol  --noconfirm --needed
sudo pacman -S alsa-utils alsa-plugins alsa-lib alsa-firmware --noconfirm --needed
#sudo pacman -S gstreamer --noconfirm --needed
#sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly --noconfirm --needed
#sudo pacman -S volumeicon --noconfirm --needed
#sudo pacman -S playerctl --noconfirm --needed

echo "################################################################"
echo "#########   sound software software installed   ################"
echo "################################################################"


### Part 3 ####################################################################
### Bluetooth #################################################################

sudo pacman -S --noconfirm --needed pulseaudio-bluetooth
sudo pacman -S --noconfirm --needed bluez
sudo pacman -S --noconfirm --needed bluez-libs
sudo pacman -S --noconfirm --needed bluez-utils
#sudo pacman -S --noconfirm --needed blueberry

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# sudo usermod -a -G rfkill $USER  <-- allows current user to switch blueberry on & off

sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

echo "################################################################"
echo "#########   bluetooth software installed   #####################"
echo "################################################################"



### Part 4 ####################################################################
### Arch Repo Software ########################################################

# software from standard Arch Linux repositories
# Core, Extra, Community, Multilib repositories
echo "Installing category Accessories"

sudo pacman -S --noconfirm --needed catfish
sudo pacman -S --noconfirm --needed cronie
sudo pacman -S --noconfirm --needed galculator
#sudo pacman -S --noconfirm --needed gnome-screenshot
#sudo pacman -S --noconfirm --needed plank
#sudo pacman -S --noconfirm --needed xfburn
sudo pacman -S --noconfirm --needed variety
#sudo pacman -S --noconfirm --needed

echo "Installing category Development"

sudo pacman -S --noconfirm --needed code-oss
sudo pacman -S --noconfirm --needed sublime
sudo pacman -S --noconfirm --needed atom
#sudo pacman -S --noconfirm --needed geany
#sudo pacman -S --noconfirm --needed meld
#sudo pacman -S --noconfirm --needed

echo "Installing category Education"

#sudo pacman -S --noconfirm --needed

echo "Installing category Games"

#sudo pacman -S --noconfirm --needed

echo "Installing category Graphics"

# isn't there a pixel art app?
#sudo pacman -S --noconfirm --needed darktable
#sudo pacman -S --noconfirm --needed gimp
sudo pacman -S --noconfirm --needed gnome-font-viewer
#sudo pacman -S --noconfirm --needed gpick
sudo pacman -S --noconfirm --needed inkscape
sudo pacman -S --noconfirm --needed nomacs
#sudo pacman -S --noconfirm --needed pinta
#sudo pacman -S --noconfirm --needed ristretto
#sudo pacman -S --noconfirm --needed

echo "Installing category Internet"
# transmission? vpn?
#sudo pacman -S --noconfirm --needed chromium
#sudo pacman -S --noconfirm --needed filezilla
sudo pacman -S --noconfirm --needed firefox
#sudo pacman -S --noconfirm --needed hexchat
#sudo pacman -S --noconfirm --needed qbittorrent
#sudo pacman -S --noconfirm --needed

echo "Installing category Multimedia"

#sudo pacman -S --noconfirm --needed clementine
#sudo pacman -S --noconfirm --needed deadbeef
sudo pacman -S --noconfirm --needed mpv
#sudo pacman -S --noconfirm --needed openshot
#sudo pacman -S --noconfirm --needed pragha
#sudo pacman -S --noconfirm --needed shotwell
#sudo pacman -S --noconfirm --needed simplescreenrecorder
#sudo pacman -S --noconfirm --needed smplayer
sudo pacman -S --noconfirm --needed vlc
#sudo pacman -S --noconfirm --needed

echo "Installing category Office"

#sudo pacman -S --noconfirm --needed evince
#sudo pacman -S --noconfirm --needed evolution
#sudo pacman -S --noconfirm --needed geary
#sudo pacman -S --noconfirm --needed libreoffice-fresh
#sudo pacman -S --noconfirm --needed

echo "Installing category Other"

#sudo pacman -S --noconfirm --needed

echo "Installing category System"

#sudo pacman -S --noconfirm --needed arc-gtk-theme
#sudo pacman -S --noconfirm --needed accountsservice
#sudo pacman -S --noconfirm --needed archey3
#sudo pacman -S --noconfirm --needed baobab
#sudo pacman -S --noconfirm --needed bleachbit
#sudo pacman -S --noconfirm --needed conky
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed dmidecode
sudo pacman -S --noconfirm --needed ffmpegthumbnailer
sudo pacman -S --noconfirm --needed git
#sudo pacman -S --noconfirm --needed glances
#sudo pacman -S --noconfirm --needed gnome-disk-utility
#sudo pacman -S --noconfirm --needed gnome-keyring
#sudo pacman -S --noconfirm --needed gnome-system-monitor
#sudo pacman -S --noconfirm --needed gnome-terminal
#sudo pacman -S --noconfirm --needed gnome-tweak-tool
#sudo pacman -S --noconfirm --needed gparted
#sudo pacman -S --noconfirm --needed grsync
#sudo pacman -S --noconfirm --needed gtk-engine-murrine
#sudo pacman -S --noconfirm --needed gvfs gvfs-mtp
#sudo pacman -S --noconfirm --needed hardinfo
#sudo pacman -S --noconfirm --needed hddtemp
sudo pacman -S --noconfirm --needed htop
#sudo pacman -S --noconfirm --needed kvantum-qt5
#sudo pacman -S --noconfirm --needed kvantum-theme-arc
#sudo pacman -S --noconfirm --needed lm_sensors
#sudo pacman -S --noconfirm --needed lsb-release
#sudo pacman -S --noconfirm --needed mlocate
#sudo pacman -S --noconfirm --needed net-tools
#sudo pacman -S --noconfirm --needed notify-osd
#sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed numlockx
#sudo pacman -S --noconfirm --needed polkit-gnome
#sudo pacman -S --noconfirm --needed qt5ct
#sudo pacman -S --noconfirm --needed sane
#sudo pacman -S --noconfirm --needed screenfetch
#sudo pacman -S --noconfirm --needed scrot
#sudo pacman -S --noconfirm --needed simple-scan
#sudo pacman -S --noconfirm --needed sysstat
#sudo pacman -S --noconfirm --needed terminator
#sudo pacman -S --noconfirm --needed termite
#sudo pacman -S --noconfirm --needed thunar
#sudo pacman -S --noconfirm --needed thunar-archive-plugin
#sudo pacman -S --noconfirm --needed thunar-volman
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
sudo pacman -S --noconfirm --needed ttf-droid
#sudo pacman -S --noconfirm --needed tumbler
sudo pacman -S --noconfirm --needed vnstat
sudo pacman -S --noconfirm --needed wget
#sudo pacman -S --noconfirm --needed wmctrl
#sudo pacman -S --noconfirm --needed unclutter
sudo pacman -S --noconfirm --needed rxvt-unicode
sudo pacman -S --noconfirm --needed urxvt-perls
#sudo pacman -S --noconfirm --needed xdg-user-dirs
#sudo pacman -S --noconfirm --needed xdo
#sudo pacman -S --noconfirm --needed xdotool
#sudo pacman -S --noconfirm --needed zenity
#sudo pacman -S --noconfirm --needed


###############################################################################################

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller

###############################################################################################


echo "################################################################"
echo "#### Software from standard Arch Linux Repo installed  #########"
echo "################################################################"


### Part 5 ####################################################################
### AUR Software ##############################################################

# Install yay
sudo pacman -S --noconfirm --needed yay

yay -S ttf-font-awesome ttf-mac-fonts
yay -S pywal


### Part 6 ####################################################################
### More Repo Software ########################################################

sudo pacman -S --noconfirm --needed arandr
sudo pacman -s --noconfirm --needed picom
sudo pacman -s --noconfirm --needed dmenu
sudo pacman -s --noconfirm --needed feh
#sudo pacman -S gmrun --noconfirm --needed
#sudo pacman -S imagemagick --noconfirm --needed
#sudo pacman -S lxappearance --noconfirm --needed
#sudo pacman -S lxrandr --noconfirm --needed
#sudo pacman -S nitrogen --noconfirm --needed
#sudo pacman -S rofi --noconfirm --needed
#sudo pacman -S thunar --noconfirm --needed
#sudo pacman -S volumeicon  --noconfirm --needed
#sudo pacman -S w3m --noconfirm --needed


### Part 6 ####################################################################
### Fonts  ####################################################################
sudo pacman -S adobe-source-sans-pro-fonts --noconfirm --needed
sudo pacman -S cantarell-fonts --noconfirm --needed
sudo pacman -S noto-fonts --noconfirm --needed
sudo pacman -S ttf-bitstream-vera --noconfirm --needed
sudo pacman -S ttf-dejavu --noconfirm --needed
sudo pacman -S ttf-droid --noconfirm --needed
sudo pacman -S ttf-hack --noconfirm --needed
sudo pacman -S ttf-inconsolata --noconfirm --needed
sudo pacman -S ttf-liberation --noconfirm --needed
sudo pacman -S ttf-roboto --noconfirm --needed
sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed
sudo pacman -S tamsyn-font --noconfirm --needed
