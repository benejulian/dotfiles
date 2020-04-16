#!/bin/sh
# 
#	~/.xinitrc
#
#	A skeleton of this file can be made with:
#	cp /etc/X11/xinit/xinitrc ~/.xinitrc
#

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Connect to bluetooth speaker
MAC_ADDR="$(bluetoothctl paired-devices | grep Soundcore | cut -d' ' -f2)"
[ $(bluetoothctl info "$MAC_ADDR" | grep Connected | cut -d' ' -f2) != "yes" ] && bluetoothctl connect "$MAC_ADDR"


# Use xrandr to find connected displays and apply options to each
xdisplayinit
#xrandr --output eDP-1 --auto --output DP-2 --auto --scale 2x2 --right-of eDP-1

# Set numlock
numlockx &
# Set desktop background
# hsetroot -solid rgb:0/0/0 &
# xwallpaper --zoom ~/Pictures/wallpaper/fantasy/456232.jpg &
bbg &
# Set color scheme (restores last color scheme)
wal -R -n &
# Start window compositor
picom -bC --config ~/.config/picom.conf &
# Start notifications
pidof dunst && killall dunst
dunst > /dev/null 2>&1 &
# Start redshift with given color "temps"
redshift -t 6500:3000 &
# Start polybar
polybar -r standard &
# Start window manager
exec i3
